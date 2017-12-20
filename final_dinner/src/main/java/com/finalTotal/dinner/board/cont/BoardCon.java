package com.finalTotal.dinner.board.cont;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.board.model.BoardDataService;
import com.finalTotal.dinner.board.model.BoardDataVO;
import com.finalTotal.dinner.board.model.BoardService;
import com.finalTotal.dinner.board.model.BoardVO;
import com.finalTotal.dinner.board.model.CommentService;
import com.finalTotal.dinner.board.model.CommentVO;
import com.finalTotal.dinner.board.model.SearchVO;
import com.finalTotal.dinner.common.FileUtil;
import com.finalTotal.dinner.common.PagingVO;
import com.finalTotal.dinner.member.model.MemberService;
import com.finalTotal.dinner.member.model.MemberVO;

@Controller
@RequestMapping("/board")
public class BoardCon {
	private static final Logger logger=LoggerFactory.getLogger(BoardCon.class);
	
	private static final String FILE_INPUT_NAME="boardFile";
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private BoardDataService boardDataService;
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private FileUtil fileUtil;
	
	@RequestMapping("/list.do")
	public String list(@ModelAttribute SearchVO searchVO, Model model) {
		logger.info("게시판 목록보기, 파라미터 SearchVO={}", searchVO);
		
		int totalRecord=boardService.selectRecordCount(searchVO);
		
		PagingVO paging=new PagingVO();
		paging.setCurrentPage(searchVO.getCurrentPage());
		paging.setTotalRecord(totalRecord);
		
		searchVO.setPageSize(paging.getPageSize());
		searchVO.setTotalPage(paging.getTotalPage());
		searchVO.setFirstRowNum(paging.getFirstRowNum());
		searchVO.setFirstBlockPage(paging.getFirstBlockPage());
		searchVO.setLastBlockPage(paging.getLastBlockPage());
		
		List<BoardVO> list=boardService.selectAll(searchVO);
		logger.info("게시판 목록조회 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("searchVO", searchVO);
		
		return "board/list";
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam(value="no", defaultValue="0")int freeNo,
			HttpSession session, Model model) {
		logger.info("게시판 상세보기, 파라미터 freeNo={}", freeNo);
		
		BoardVO vo=boardService.selectByNo(freeNo);
		logger.info("게시판 상세보기 결과, vo={}", vo);
		
		if(vo==null) {
			model.addAttribute("msg", "글이 없습니다.");
			model.addAttribute("url", "/board/list.do");
			return "common/message";
		}
		
		
		
		String memId=(String)session.getAttribute("memId");
		
		MemberVO memberVO=null;
		if(memId!=null && !memId.isEmpty()){
			memberVO=memberService.selectMember(memId);
		}
		int memGrade=0;
		if(memberVO!=null){
			memGrade=memberVO.getMemGrade();
		}
		
		List<CommentVO> commentList=commentService.selectCommentByFreeNo(freeNo);
		logger.info("게시판 상세보기 댓글조회 결과, commentList.size()={}", commentList.size());
		
		Map<String, Object> fileMap=boardDataService.selectFileInfoByBoardNo(freeNo);
		
		String freeContents=vo.getFreeContents().replace("\r\n", "<br>");
		vo.setFreeContents(freeContents);
		
		for(CommentVO cVo : commentList) {
			if(cVo.getCommentDelFlag().equals("N")) {
				String commentContents=cVo.getCommentContents().replace("\r\n", "<br>");
				cVo.setCommentContents(commentContents);
			}
		}
		
		model.addAttribute("vo", vo);
		model.addAttribute("commentList", commentList);
		model.addAttribute("fileMap", fileMap);
		model.addAttribute("memGrade", memGrade);
		
		return "board/detail";
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public void write_get() {
		logger.info("게시판 글쓰기화면 표시");
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	@Transactional
	public String write_post(@ModelAttribute BoardVO boardVO,
			HttpServletRequest request, Model model) {
		logger.info("게시판 글쓰기처리, 파라미터 boardVO={}", boardVO);
		
		HttpSession session = request.getSession();
		
		String msg="제목이 없습니다", url="/board/write.do";
		boolean back=false;
		boolean errFlag=true;
		
		//유효성검사 - 공통사항
		if(boardVO.getFreeTitle()!=null && !boardVO.getFreeTitle().isEmpty()) {
			back=true;
			url="";
			errFlag=false;
		}
		
		if(!errFlag) {
			//유효성검사 - 회원, 비회원
			url="";
			back=true;
			Map<String, Object>vetifi=boardVerifi(boardVO, session);
			errFlag=(Boolean)vetifi.get("errFlag");
			
			if(errFlag) {
				msg=(String)vetifi.get("msg");
			}else {
				
				List<BoardDataVO> dataList=new ArrayList<BoardDataVO>();
				
				try {
					dataList=uploadFile(request);
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				int cnt=boardService.insertBoard(boardVO);
				logger.info("게시판 글쓰기처리 결과, cnt={}", cnt);
				
				if(cnt>0) {
					if(dataList!=null && !dataList.isEmpty()) {
						cnt=boardDataService.insertFile(dataList, boardVO.getFreeNo());
						logger.info("게시판 파일정보 등록 결과, cnt={}", cnt);
					}
					msg="글쓰기 완료";
					url="/board/list.do";
					back=false;
					
					if(cnt==0) {
						msg="글쓰기 완료 - 파일 업로드 실패";
					}
				}else {
					msg="글쓰기 실패";
				}
			}
			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("back", back);
		return "common/message";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue="0")int freeNo,
			HttpSession session, Model model) {
		logger.info("게시판 글수정 화면 표시, 파라미터 freeNo={}", freeNo);
		
		BoardVO vo=boardService.selectByNo(freeNo);
		logger.info("게시판 글수정 화면 결과, vo={}", vo);
		
		Map<String, Object> fileMap=boardDataService.selectFileInfoByBoardNo(freeNo);
		
		String msg="수정할 글이 없습니다.", url="/board/list.do";
		boolean errFlag=true;
		
		if(vo!=null) {
			//수정권한 확인
			Map<String, Object> editMap=isEdit(vo, session);
			errFlag = (Boolean)editMap.get("errFlag");
				
			if(errFlag) {
				msg="수정권한이 없습니다.";
			}
		}
		
		if(errFlag) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}
		model.addAttribute("vo", vo);
		model.addAttribute("fileMap", fileMap);
		
		return "board/edit";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public String edit_post(@ModelAttribute BoardVO boardVO,
			@RequestParam(required=false) List<Integer> deleteFile,
			HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		logger.info("게시판 글수정 처리, 파라미터 boardVO={}", boardVO);
		
		BoardVO vo=boardService.selectByNo(boardVO.getFreeNo());
		logger.info("게시판 글수정 조회 결과, vo={}", vo);
		
		String msg="수정할 글이 없습니다.", url="/board/list.do";
		boolean back=false;
		boolean errFlag=true;
		
		if(boardVO.getFreeNo()!=0) {
			msg="잘못된 URL입니다.";
		}
		String memId=(String)session.getAttribute("memId");
		
		if(vo!=null) {
			//수정권한 확인
			Map<String, Object> editMap=isEdit(vo, session);
			errFlag = (Boolean)editMap.get("errFlag");
			boolean isMember=(Boolean)editMap.get("isMember");

			if(errFlag) {
				msg="수정권한이 없습니다.";
				url="/board/list.do";
				back=false;
			}else if(!isMember) {
				//비회원글일 경우 비밀번호 체크

				int memGrade=0;
				if(editMap.get("memGrade")!=null) {
					memGrade=(Integer)editMap.get("memGrade");
				}
				
				if(memGrade!=9 && (boardVO.getFreePwd()==null ||
						!boardVO.getFreePwd().equals(vo.getFreePwd()))) {
					msg="비밀번호가 일치하지 않습니다.";
					back=true;
					errFlag=true;
				}
			}
		}
		
		if(!errFlag) {
			//유효성 검사
			
			Map<String, Object> vetifi=boardVerifi(boardVO, session);
			errFlag=(Boolean)vetifi.get("errFlag");
			
			if(errFlag) {
				msg=(String)vetifi.get("msg");
				url="";
				back=true;
			}else {
				if(memId!=null && !memId.isEmpty()){
					vo.setFreeName(null);
				}
				
				//파일 업로드
				List<BoardDataVO> dataList=new ArrayList<BoardDataVO>();
				
				try {
					dataList=uploadFile(request);
					
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				//DB작업
				int cnt=boardService.editBoard(boardVO);
				logger.info("게시판 글수정 처리 결과, cnt={}", cnt);
				
				if(cnt>0) {
					if(dataList!=null && !dataList.isEmpty()) {
						cnt=boardDataService.insertFile(dataList, boardVO.getFreeNo());
						logger.info("게시판 파일정보 등록 결과, cnt={}", cnt);
					}
					
					//파일삭제
					if(deleteFile!=null && !deleteFile.isEmpty()) {
						List<BoardDataVO> fileList=new ArrayList<BoardDataVO>();
						
						for(int dataNo : deleteFile) {
							BoardDataVO datavo=boardDataService.selectFileByNo(dataNo);
							
							if(datavo!=null) {
								fileList.add(datavo);
							}
						}
						
						List<BoardDataVO> delFiles=boardDataService.deleteFiles(fileList, boardVO.getFreeNo());
						for(BoardDataVO dataVO : delFiles) {
							File file=new File(fileUtil.getUploadPath(request, FileUtil.FILE_UPLOAD), dataVO.getFreeDataName());
							
							if(file.exists()) {
								boolean bool = file.delete();
								logger.info("파일 삭제 결과, DataName={}, bool={}", dataVO.getFreeDataName(), bool);
							}
						}
					}
					
					msg="글수정 완료";
					url="/board/detail.do?no="+boardVO.getFreeNo();
					back=false;
				}else {
					msg="글수정 실패";
					url="";
					back=true;
				}
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("back", back);
		
		return "common/message";
	}
	
	
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String delete_get(@RequestParam(defaultValue="0")int freeNo,
			HttpSession session, Model model) {
		logger.info("게시판 글삭제 화면 표시, 파라미터 freeNo={}", freeNo);
		
		String msg="잘못된 URL입니다.", url="/board/list.do";
		boolean errFlag=true;
		
		BoardVO vo=boardService.selectByNo(freeNo);
		logger.info("게시판 글삭제화면 조회 결과, vo={}", vo);
		
		boolean hidePwd=false;
		
		MemberVO memberVO=null;

		String memId=(String)session.getAttribute("memId");
		if(memId!=null && !memId.isEmpty()){
			memberVO=memberService.selectMember(memId);
		}
		
		if(vo!=null) {
			//삭제권한 확인
			Map<String, Object> editMap=isEdit(vo, session);
			errFlag = (Boolean)editMap.get("errFlag");
			
			if(errFlag) {
				msg="삭제권한이 없습니다.";
			}
			hidePwd=(vo.getMemNo()!=0 
					&& (vo.getFreePwd()==null || vo.getFreePwd().isEmpty()))
					|| (memId!=null && memberVO.getMemGrade()==9);
		}
		
		if(errFlag) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}
		
		model.addAttribute("hidePwd", hidePwd);
		return "board/delete";
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public String delete_post(@ModelAttribute BoardVO boardVO,
			HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		logger.info("게시판 글삭제 처리, 파라미터 boardVO={}", boardVO);
		
		BoardVO vo=boardService.selectByNo(boardVO.getFreeNo());
		logger.info("게시판 글삭제 조회 결과, vo={}", vo);
		
		String msg="삭제할 글이 없습니다.", url="/board/list.do";
		boolean errFlag=true;
		boolean back=false;
		
		if(vo!=null) {
			//삭제권한 확인
			Map<String, Object> editMap=isEdit(vo, session);
			errFlag = (Boolean)editMap.get("errFlag");
			boolean isMember=(Boolean)editMap.get("isMember");
			
			if(errFlag) {
				msg="삭제권한이 없습니다.";
			}else if(!isMember) {
				//비회원글일 경우 비밀번호 체크
				int memGrade=0;
				if(editMap.get("memGrade")!=null) {
					memGrade=(Integer)editMap.get("memGrade");
				}
				
				if(memGrade!=9 && (boardVO.getFreePwd()==null
						|| !boardVO.getFreePwd().equals(vo.getFreePwd()))) {
					msg="비밀번호가 일치하지 않습니다.";
					back=true;
					errFlag=true;
				}
			}
			
		}
		
		if(!errFlag) {
			url="";
			back=true;
			
			//파일 삭제
			Map<String, Object> dataMap=boardDataService.selectFileInfoByBoardNo(boardVO.getFreeNo());
			List<BoardDataVO> dataList=(List<BoardDataVO>)dataMap.get("list");
			
			for(BoardDataVO dataVO : dataList) {
				File file=new File(fileUtil.getUploadPath(request, FileUtil.FILE_UPLOAD), dataVO.getFreeDataName());
				
				if(file.exists()) {
					boolean bool = file.delete();
					logger.info("파일 삭제 결과, DataName={}, bool={}", dataVO.getFreeDataName(), bool);
				}
			}
			
			//DB작업
			int cnt=boardDataService.deleteFileByBoardNo(boardVO.getFreeNo());
			logger.info("파일정보 삭제 결과, cnt={}", cnt);
			
			cnt=boardService.deleteBoard(boardVO.getFreeNo());
			logger.info("게시판 글삭제 처리 결과, cnt={}", cnt);
			
			
			if(cnt>0) {
				msg="글삭제 완료";
				url="/board/list.do";
				back=false;
			}else {
				msg="글삭제 실패";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("back", back);
		return "common/message";
	}
	
	//수정/삭제 권한 확인
	private Map<String, Object> isEdit(BoardVO boardVO, HttpSession session) {
		Map<String, Object> chkComment=new HashMap<String, Object>();
		boolean errFlag=true;
		boolean isMember=false;
		
		String memId=(String)session.getAttribute("memId");
		int memNo=0;
		if(memId!=null && !memId.isEmpty()) {
			memNo=(Integer)session.getAttribute("memNo");
		}
		
		MemberVO memberVO=null;
		if(memId!=null && !memId.isEmpty()){
			memberVO=memberService.selectMember(memId);
		}
		int memGrade=0;
		if(memberVO!=null){
			memGrade=memberVO.getMemGrade();
		}
		
		//글 작성자 회원/비회원 여부 확인
		if(boardVO.getMemNo()!=0
					|| boardVO.getFreePwd()==null || boardVO.getFreePwd().isEmpty()) {
			//회원일때 - 요청자 수정권한 확인(본인, 관리자만 수정가능)
			if(memId!=null && !memId.isEmpty()) {
			//요청자 회원 - 정보조회
				
				//요청자가 본인이거나 관리자이면 수정 가능
				if(memGrade==9 || memNo==boardVO.getMemNo()) {
					errFlag=false;
				}
			}
			isMember=true;
			
		}else {
			//비회원일때 - 수정가능
			errFlag=false;
			isMember=false;
		}
		
		
		chkComment.put("memGrade", memGrade);
		chkComment.put("isMember", isMember);
		chkComment.put("errFlag", errFlag);
		
		return chkComment;
	}
	
	//유효성검사
	private Map<String, Object> boardVerifi(BoardVO boardVO, HttpSession session){
		Map<String, Object> chkBoard=new HashMap<String, Object>();
		String msg="";
		boolean errFlag=false;
		
		String memId=(String)session.getAttribute("memId");
		String memName=(String)session.getAttribute("memName");
		int memNo=0;
		if(memId!=null && !memId.isEmpty()) {
			memNo=(Integer)session.getAttribute("memNo");
		}
		
		//공통사항
		if(boardVO.getFreeTitle()==null || boardVO.getFreeTitle().isEmpty()) {
			msg="제목이 없습니다";
			errFlag=false;
		}
		
		if(!errFlag) {
			if(memId!=null && !memId.isEmpty()) {
				//회원
				
				boardVO.setFreeName(memName);
				boardVO.setMemNo(memNo);
				boardVO.setFreePwd("");
				
				errFlag=false;
			}else {
				//비회원
				errFlag=true;
				if(boardVO.getFreeName()==null || boardVO.getFreeName().isEmpty()) {
					msg="이름이 없습니다";
					errFlag=true;
				}else if(boardVO.getFreePwd()==null || boardVO.getFreePwd().isEmpty()) {
					msg="비밀번호가 없습니다";
				}else {
					errFlag=false;
				}
			}
		}
		
		chkBoard.put("msg", msg);
		chkBoard.put("errFlag", errFlag);
		
		return chkBoard;
	}
	
	private List<BoardDataVO> uploadFile(HttpServletRequest request) throws IllegalStateException, IOException {
		List<BoardDataVO> dataList=new ArrayList<BoardDataVO>();
		
		List<Map<String, Object>> fileList=fileUtil.fileUploadByKey(request, FILE_INPUT_NAME, FileUtil.FILE_UPLOAD);
		
		if(fileList!=null && !fileList.isEmpty()) {
			for(Map<String, Object> dataMap : fileList) {
				BoardDataVO dataVO = new BoardDataVO();
				dataVO.setFreeDataName((String)dataMap.get("filename"));
				dataVO.setFreeDataOriginalName((String)dataMap.get("originalFilename"));
				
				dataList.add(dataVO);
			}
			
		}
		
		return dataList;
	}
	
}

