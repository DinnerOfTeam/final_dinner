<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<script src="<c:url value='/codebase/dhtmlxscheduler.js'/>"></script>
	<link rel="stylesheet" type="text/css" href="<c:url value='/codebase/dhtmlxscheduler.css'/>">


<title>Insert title here</title>
	<style type="text/css" >
		html, body{
			margin:0;
			padding:0;
			height:100%;
			overflow:hidden;
		}

		.dhx_cal_event div.dhx_footer,
		.dhx_cal_event.past_event div.dhx_footer,
		.dhx_cal_event.event_english div.dhx_footer,
		.dhx_cal_event.event_math div.dhx_footer,
		.dhx_cal_event.event_science div.dhx_footer{
			background-color: transparent !important;
		}
		.dhx_cal_event .dhx_body{
			-webkit-transition: opacity 0.1s;
			transition: opacity 0.1s;
			opacity: 0.7;
		}
		.dhx_cal_event .dhx_title{
			line-height: 12px;
		}
		.dhx_cal_event_line:hover,
		.dhx_cal_event:hover .dhx_body,
		.dhx_cal_event.selected .dhx_body,
		.dhx_cal_event.dhx_cal_select_menu .dhx_body{
			opacity: 1;
		}

		.dhx_cal_event.event_math div, .dhx_cal_event_line.event_math{
			background-color: orange !important;
			border-color: #a36800 !important;
		}
		.dhx_cal_event_clear.event_math{
			color:orange !important;
		}

		.dhx_cal_event.event_science div, .dhx_cal_event_line.event_science{
			background-color: #36BD14 !important;
			border-color: #698490 !important;
		}
		.dhx_cal_event_clear.event_science{
			color:#36BD14 !important;
		}

		.dhx_cal_event.event_english div, .dhx_cal_event_line.event_english{
			background-color: #FC5BD5 !important;
			border-color: #839595 !important;
		}
		.dhx_cal_event_clear.event_english{
			color:#B82594 !important;
		}
	</style>
<script type="text/javascript" charset="utf-8">
		window.onload=function() {
			scheduler.config.xml_date="%Y-%m-%d %H:%i";
			scheduler.config.time_step = 30;
			scheduler.config.multi_day = true;
			scheduler.locale.labels.section_subject = "Subject";
			scheduler.config.first_hour = 6;
			scheduler.config.limit_time_select = true;
			scheduler.config.details_on_dblclick = true;
			scheduler.config.details_on_create = true;

			scheduler.templates.event_class=function(start, end, event){
				var css = "";

				if(event.subject) // if event has subject property then special class should be assigned
					css += "event_"+event.subject;

				if(event.id == scheduler.getState().select_id){
					css += " selected";
				}
				return css; // default return

				/*
					Note that it is possible to create more complex checks
					events with the same properties could have different CSS classes depending on the current view:

					var mode = scheduler.getState().mode;
					if(mode == "day"){
						// custom logic here
					}
					else {
						// custom logic here
					}
				*/
			};

			var subject = [
				{ key: '', label: 'Appointment' },
				{ key: 'english', label: 'English' },
				{ key: 'math', label: 'Math' },
				{ key: 'science', label: 'Science' }
			];

			scheduler.config.lightbox.sections=[
				{name:"description", height:43, map_to:"text", type:"textarea" , focus:true},
				{name:"subject", height:20, type:"select", options: subject, map_to:"subject" },
				{name:"time", height:72, type:"time", map_to:"auto" }
			];

			scheduler.init('scheduler_here', new Date(2017, 3, 20), "week");

			scheduler.parse([
				{ start_date: "2017-04-18 09:00", end_date: "2017-04-18 12:00", text:"English lesson", subject: 'english' },
				{ start_date: "2017-04-20 10:00", end_date: "2017-04-21 16:00", text:"Math exam", subject: 'math' },
				{ start_date: "2017-04-21 10:00", end_date: "2017-04-21 14:00", text:"Science lesson", subject: 'science' },
				{ start_date: "2017-04-23 16:00", end_date: "2017-04-23 17:00", text:"English lesson", subject: 'english' },
				{ start_date: "2017-04-22 09:00", end_date: "2017-04-22 17:00", text:"Usual event" }
			], "json");

		}
	</script>



</head>
<body>
	<div id="scheduler_here" class="dhx_cal_container" style='width:100%; height:100%;'>
		<div class="dhx_cal_navline">
			<div class="dhx_cal_prev_button">&nbsp;</div>
			<div class="dhx_cal_next_button">&nbsp;</div>
			<div class="dhx_cal_today_button"></div>
			<div class="dhx_cal_date"></div>
			<div class="dhx_cal_tab" name="day_tab" style="right:204px;"></div>
			<div class="dhx_cal_tab" name="week_tab" style="right:140px;"></div>
			<div class="dhx_cal_tab" name="month_tab" style="right:76px;"></div>
		</div>
		<div class="dhx_cal_header">
		</div>
		<div class="dhx_cal_data">
		</div>		
	</div>


</body>
</html>