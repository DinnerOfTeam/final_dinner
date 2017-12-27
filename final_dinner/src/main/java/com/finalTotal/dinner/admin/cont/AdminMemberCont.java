package com.finalTotal.dinner.admin.cont;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalTotal.dinner.member.model.MemberService;
import com.finalTotal.dinner.member.model.MemberVO;

@Controller
@RequestMapping("/admin/member")
public class AdminMemberCont {
	public static final Logger log= LoggerFactory.getLogger(AdminMemberCont.class);
	
	@Autowired
	MemberService mem_ser;
	
	@RequestMapping("/Amember.do")
	public void memList(Model model) {
		log.info("admin member page");
		
		List<MemberVO> list= mem_ser.showAll();
		model.addAttribute("mem_list", list);
	}

	@RequestMapping("/AmemberEdit.do")
	public String editting(@ModelAttribute MemberVO vo) {
		log.info("edtting parameter : vo= {}", vo);
		
		return "redirect:/admin/main.do";
	}
}
