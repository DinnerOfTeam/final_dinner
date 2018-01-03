package com.finalTotal.dinner.admin.cont;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalTotal.dinner.common.PagingVO;
import com.finalTotal.dinner.common.SearchVO;
import com.finalTotal.dinner.question.model.QuestionService;
import com.finalTotal.dinner.question.model.QuestionVO;

@Controller
@RequestMapping("/admin/qna")
public class AdminQnaCont {
	public static final Logger log= LoggerFactory.getLogger(AdminQnaCont.class);

	@Autowired
	private QuestionService ser;
	
	@RequestMapping("/Aqna.do")
	public void qnaAll(Model model) {
		//1. 출력하기
		log.info("질문 리스트 확인");
		//2.
		
		List<QuestionVO> list= ser.adminSelectAll();
		log.info("목록 조회 결과,list.size()="+list.size());
				
		model.addAttribute("list", list);
	}
}
