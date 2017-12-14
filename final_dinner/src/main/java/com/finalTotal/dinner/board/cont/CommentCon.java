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

import com.finalTotal.dinner.board.model.CommentService;
import com.finalTotal.dinner.board.model.CommentVO;
import com.finalTotal.dinner.member.model.MemberService;

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
		
		String msg="내용이 없습니다", url="/board/write.do";
		boolean back=false;
		boolean errFlag=true;
		
		//유효성검사 - 공통사항
		if(commentVO.getCommentContents()!=null && !commentVO.getCommentContents().isEmpty()) {
			back=true;
			url="";
			errFlag=false;
		}
		
		if(!errFlag) {
			//유효성검사 - 회원, 비회원
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
					msg="댓글쓰기 완료";
					url=request.getHeader("referer");
					if(url==null || url.isEmpty()) {
						url="/board/detail.do?no="+commentVO.getFreeNo();
					}
					back=false;
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
	
	private Map<String, Object> commentVerifi(CommentVO commentVO, HttpSession session){
		Map<String, Object> chkComment=new HashMap<String, Object>();
		String msg="";
		boolean errFlag=false;
		
		String memId=(String)session.getAttribute("memId");
		String memName=(String)session.getAttribute("memName");
		int memNo=0;
		if(memId!=null && memId.isEmpty()) {
			memNo=(Integer)session.getAttribute("memNo");
		}
		
		if(memId!=null && !memId.isEmpty()) {
			//회원
			
			commentVO.setCommentName(memName);
			commentVO.setMemNo(memNo);
			commentVO.setCommentPwd("");
			
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
		
		chkComment.put("msg", msg);
		chkComment.put("errFlag", errFlag);
		
		return chkComment;
	}
	
	
}
