package com.finalTotal.dinner.board.cont;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalTotal.dinner.board.model.CommentService;
import com.finalTotal.dinner.board.model.CommentVO;
import com.finalTotal.dinner.member.model.MemberService;
import com.finalTotal.dinner.member.model.MemberVO;

@Controller
@RequestMapping("/board/comment")
public class CommentCon {
	private static final Logger logger=LoggerFactory.getLogger(CommentCon.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String write_post(@ModelAttribute CommentVO commentVO,
			HttpServletRequest request, Model model) {
		logger.info("댓글 작성 처리, 파라미터 commentVO={}", commentVO);

		HttpSession session=request.getSession();
		
		String msg="", url="/board/write.do";
		boolean back=false;
		boolean errFlag=false;
		
		if(!errFlag) {
			//유효성검사
			url="";
			back=true;
			Map<String, Object>vetifi=commentVerifi(commentVO, session);
			errFlag=(Boolean)vetifi.get("errFlag");
			
			if(errFlag) {
				msg=(String)vetifi.get("msg");
			}else {
				int cnt=commentService.insertComment(commentVO);
				logger.info("게시판 댓글쓰기처리 결과, cnt={}", cnt);
				
				if(cnt>0) {
					url=request.getHeader("referer");
					if(url==null || url.isEmpty()) {
						url="/board/detail.do?no="+commentVO.getFreeNo();
					}
					

					return "redirect:"+url;
				}else {
					msg="댓글쓰기 실패";
				}
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		model.addAttribute("back", back);
			
		return "common/message";
	}
	@RequestMapping(value="/reply.do", method=RequestMethod.GET)
	public String reply_get(@RequestParam(defaultValue="0")int commentNo,
			HttpServletRequest request, Model model) {
		logger.info("댓글 답변 화면 표시, 파라미터 commentNo={}", commentNo);
		
		if(commentNo==0) {
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("close", true);
			model.addAttribute("back", false);
			
			return "common/msgPopup";
		}
		
		return "board/comment/reply";
	}
	
	@RequestMapping(value="/reply.do", method=RequestMethod.POST)
	public String reply_post(@ModelAttribute CommentVO commentVO,
			HttpServletRequest request, Model model) {
		logger.info("댓글 답변 작성 처리, 파라미터 commentVO={}", commentVO);
		
		HttpSession session=request.getSession();
		
		String msg="";
		boolean back=true;
		boolean close=false;
		boolean errFlag=true;
		
		//유효성검사
		Map<String, Object>vetifi=commentVerifi(commentVO, session);
		errFlag=(Boolean)vetifi.get("errFlag");
		
		if(errFlag) {
			msg=(String)vetifi.get("msg");
			back=true;
			close=false;
		}else {
			int cnt=commentService.replyComment(commentVO);
			logger.info("게시판 댓글 답변처리 결과, cnt={}", cnt);
			
			if(cnt>0) {
				/*url=request.getHeader("referer");
				if(url==null || url.isEmpty()) {
					url="/board/detail.do?no="+commentVO.getFreeNo();
				}
				
				return "redirect:"+url;*/
				msg="";
				back=false;
				close=true;
				model.addAttribute("reloadOpener", true);
			}else {
				msg="댓글쓰기 실패";
				back=true;
				close=false;
			}
		}
		
		
		model.addAttribute("msg", msg);
		model.addAttribute("close", close);
		model.addAttribute("back", back);
		
		return "common/msgPopup";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue="0")int commentNo,
				HttpSession session, Model model) {
		logger.info("댓글수정 화면 표시, 파라미터 commentNo={}", commentNo);
		
		CommentVO vo=commentService.selectCommentByCommentNo(commentNo);
		logger.info("댓글수정 화면 결과, vo={}", vo);
		
		String msg="수정할 글이 없습니다.";
		boolean errFlag=true;
		
		if(vo!=null) {
			//수정권한 확인
			
			Map<String, Object> editMap=isEdit(vo, session);
			errFlag = (Boolean)editMap.get("errFlag");
			
			if(errFlag) {
				msg="수정권한이 없습니다.";
			}else {
				errFlag=false;
			}
		}
		
		if(errFlag) {
			model.addAttribute("msg", msg);
			model.addAttribute("close", true);
			return "common/msgPopup";
		}
		model.addAttribute("vo", vo);
		
		return "board/comment/edit";
	}
	
	@RequestMapping(value="/edit.do", method=RequestMethod.POST)
	public String edit_post(@ModelAttribute CommentVO commentVO,
			HttpSession session, Model model) {
		logger.info("게시판 댓글수정 처리, 파라미터 commentVO={}", commentVO);
		
		CommentVO vo=commentService.selectCommentByCommentNo(commentVO.getCommentNo());
		logger.info("게시판 댓글수정 조회 결과, vo={}", vo);
		
		String msg="수정할 댓글이 없습니다.";
		boolean back=false;
		boolean close=true;
		boolean errFlag=true;
		
		if(commentVO.getFreeNo()!=0) {
			msg="잘못된 URL입니다.";
			close=true;
			back=false;
			errFlag=true;
		}
		String memId=(String)session.getAttribute("memId");
		
		if(vo!=null) {
			//수정권한 확인
			Map<String, Object> editMap=isEdit(vo, session);
			errFlag = (Boolean)editMap.get("errFlag");
			
			boolean isMember=(Boolean)editMap.get("isMember");
			
			if(errFlag) {
				msg="수정권한이 없습니다.";
				close=true;
				back=false;
				errFlag=true;
			}else if(!isMember) {
				//비회원글일 경우 비밀번호 체크
				int memGrade=0;
				if(editMap.get("memGrade")!=null) {
					memGrade=(Integer)editMap.get("memGrade");
				}
				
				if(memGrade!=9 && (vo.getCommentPwd()==null
						|| !vo.getCommentPwd().equals(commentVO.getCommentPwd()))) {
					msg="비밀번호가 일치하지 않습니다.";
					close=false;
					back=true;
					errFlag=true;
				}
			}
		}
		
		if(!errFlag) {
			//유효성 검사
				Map<String, Object> vetifi=commentVerifi(commentVO, session);
				errFlag=(Boolean)vetifi.get("errFlag");
				
				if(errFlag) {
					msg=(String)vetifi.get("msg");
					close=false;
					back=true;
					errFlag=true;
				}else {
					if(memId!=null && !memId.isEmpty()){
						vo.setCommentName(null);
					}
					
					int cnt=commentService.editComment(commentVO);
					logger.info("게시판 댓글수정 처리 결과, cnt={}", cnt);
					
					if(cnt>0) {
						msg="댓글수정 완료";
						close=true;
						back=false;
						model.addAttribute("reloadOpener", true);
					}else {
						msg="댓글수정 실패";
						close=false;
						back=true;
					}
				}
			}
		
		model.addAttribute("msg", msg);
		model.addAttribute("close", close);
		model.addAttribute("back", back);
		
		return "common/msgPopup";
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String delete_get(@RequestParam(defaultValue="0")int commentNo,
			HttpSession session, Model model) {
		logger.info("게시판 댓글삭제 화면 표시, 파라미터 commentNo={}", commentNo);
		
		String msg="잘못된 URL입니다.";
		boolean close=true;
		boolean errFlag=true;
		
		
		CommentVO vo=commentService.selectCommentByCommentNo(commentNo);
		logger.info("게시판 댓글삭제 조회 결과, vo={}", vo);
		
		boolean hidePwd=false;
		
		if(vo!=null) {
			//삭제권한 확인
			Map<String, Object> editMap=isEdit(vo, session);
			errFlag = (Boolean)editMap.get("errFlag");
			int memGrade=0;
			if(editMap.get("memGrade")!=null) {
				memGrade=(Integer)editMap.get("memGrade");
			}
			
			if(errFlag) {
				msg="삭제권한이 없습니다.";
			}
			hidePwd=(vo.getMemNo()!=0 
					&& (vo.getCommentPwd()==null || vo.getCommentPwd().isEmpty()))
					|| (session.getAttribute("memId")!=null && memGrade==9);
		}
		
		if(errFlag) {
			model.addAttribute("msg", msg);
			model.addAttribute("close", close);
			return "common/msgPopup";
		}
		
		model.addAttribute("hidePwd", hidePwd);
		return "board/comment/delete";
	}
	
	@RequestMapping(value="/delete.do", method=RequestMethod.POST)
	public String delete_post(@ModelAttribute CommentVO commentVO,
			HttpSession session, Model model) {
		logger.info("게시판 글삭제 처리, 파라미터 commentVO={}", commentVO);
		
		CommentVO vo=commentService.selectCommentByCommentNo(commentVO.getCommentNo());
		logger.info("게시판 댓글삭제 조회 결과, vo={}", vo);
		
		String msg="삭제할 글이 없습니다.";
		boolean back=false;
		boolean close=true;
		boolean errFlag=true;
		
		if(vo!=null) {
			//삭제권한 확인
			Map<String, Object> editMap=isEdit(vo, session);
			errFlag = (Boolean)editMap.get("errFlag");
			boolean isMember=(Boolean)editMap.get("isMember");
			
			if(errFlag) {
				msg="삭제권한이 없습니다.";
				close=true;
				back=false;
			}else if(!isMember) {
				//비회원글일 경우 비밀번호 체크
				int memGrade=0;
				if(editMap.get("memGrade")!=null) {
					memGrade=(Integer)editMap.get("memGrade");
				}
				
				if(memGrade!=9 && ( commentVO.getCommentPwd()==null 
						|| !vo.getCommentPwd().equals(commentVO.getCommentPwd())) ) {
					msg="비밀번호가 일치하지 않습니다.";
					close=false;
					back=true;
					errFlag=true;
				}
			}
			
		}
		
		if(!errFlag) {
			back=true;
			int cnt=commentService.deleteComment(commentVO.getCommentNo());
			logger.info("게시판 댓글삭제 처리 결과, cnt={}", cnt);
			
			if(cnt>0) {
				msg="글삭제 완료";
				back=false;
				close=true;
				model.addAttribute("reloadOpener", true);
			}else {
				msg="글삭제 실패";
				back=true;
				close=false;
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("close", close);
		model.addAttribute("back", back);
		
		return "common/msgPopup";
	}
	
	//수정/삭제 권한 확인
	private Map<String, Object> isEdit(CommentVO commentVO, HttpSession session) {
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
		if(commentVO.getMemNo()!=0
					|| commentVO.getCommentPwd()==null || commentVO.getCommentPwd().isEmpty()) {
			//회원일때 - 요청자 수정권한 확인(본인, 관리자만 수정가능)
			if(memId!=null && !memId.isEmpty()) {
				//요청자 회원 - 정보조회
				
				//요청자가 본인이거나 관리자이면 수정 가능
				if(memGrade==9 || memNo==commentVO.getMemNo()) {
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
	private Map<String, Object> commentVerifi(CommentVO commentVO, HttpSession session){
		Map<String, Object> chkComment=new HashMap<String, Object>();
		String msg="";
		boolean errFlag=false;
		
		String memId=(String)session.getAttribute("memId");
		String memName=(String)session.getAttribute("memName");
		int memNo=0;
		if(memId!=null && !memId.isEmpty()) {
			memNo=(Integer)session.getAttribute("memNo");
		}
		
		//공통사항
		if(commentVO.getCommentContents()==null || commentVO.getCommentContents().isEmpty()) {
			msg="내용이 없습니다";
			errFlag=true;
		}
		
		if(!errFlag){
			if(memId!=null && !memId.isEmpty()) {
				//회원
				commentVO.setCommentName(memName);
				commentVO.setMemNo(memNo);
				commentVO.setCommentPwd("");
				
				errFlag=false;
			}else {
				//비회원
				errFlag=true;
				if(commentVO.getCommentName()==null || commentVO.getCommentName().isEmpty()) {
					msg="이름이 없습니다";
				}else if(commentVO.getCommentPwd()==null || commentVO.getCommentPwd().isEmpty()) {
					msg="비밀번호가 없습니다";
				}else {
					errFlag=false;
				}
			}
		}
		
		chkComment.put("msg", msg);
		chkComment.put("errFlag", errFlag);
		
		return chkComment;
	}
	
}
