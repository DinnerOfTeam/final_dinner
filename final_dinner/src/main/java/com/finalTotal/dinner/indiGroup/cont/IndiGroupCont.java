package com.finalTotal.dinner.indiGroup.cont;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/indiGroup")
public class IndiGroupCont {
	private Logger logger= LoggerFactory.getLogger(IndiGroupCont.class);
	private int[] date_arr= new int[28];
	private String[] work_arr= new String[28];

	@RequestMapping(value= "/main.do", method= RequestMethod.GET)
	public void main(@RequestParam(required=false, defaultValue= "0") int year,
			@RequestParam(required=false, defaultValue= "0") int month,
			@RequestParam(required=false, defaultValue= "0") int p_date, Model model) {
		logger.info("indiGroup main page");
		Date d= null;
		if((year* month* p_date)== 0) {
			System.out.println("오늘");
			d= new Date();
		}else {
			System.out.println("다른달");
			d= new Date(year, month, p_date);
		}
		int startDay= d.getDate()- 7- d.getDay();
		for(int i= 0; i< date_arr.length; i++) {
			int date= startDay+ i;
			if(date< 1) {
				int beforeLastDay= getLastDay(d.getYear()+ 1900, d.getMonth()- 1);
				date_arr[i]= date+ beforeLastDay;
			}else {
				date_arr[i]= date;
			}
		}
		work_arr[04]= "점심약속";
		work_arr[15]= "점심약속";
		work_arr[19]= "저녁약속";
		work_arr[26]= "점심약속";
		
		model.addAttribute("date_arr", date_arr);
		model.addAttribute("work_arr", work_arr);
		model.addAttribute("today", d);
	}
	
	public int getLastDay(int year, int month) {
		switch(month) {
			case -1: return 31;
			case 0: return 31;
			case 1: return yearcalc(year)?29:28;
			case 2: return 31;
			case 3: return 30;
			case 4: return 31;
			case 5: return 30;
			case 6: return 31;
			case 7: return 31;
			case 8: return 30;
			case 9: return 31;
			case 10: return 30;
			default: return 30;
		}
	}
	public static boolean yearcalc(int year){
		if(year%4==0 && (!(year%100==0) && !(year%400==0))){
			return true;
		}
		return false;
	}
}
