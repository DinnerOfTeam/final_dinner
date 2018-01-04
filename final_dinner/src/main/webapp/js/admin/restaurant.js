$(function() {
	$.editRes= function(idx) {
		var inEl= $('#mytable_res tr').eq(idx).find('td input');
		var memNo= inEl.first().val();
		if(inEl.is(':disabled')) {
			inEl.prop('disabled', '');
		}else {
		/*	$.ajax({
				type: "post",
				url: "/dinner/admin/member/AmemberEdit.do",
				data: {
					memNo: $(inEl).eq(0).val(),
					memId: $(inEl).eq(2).val(),
					memPwd: $(inEl).eq(3).val(),
					memName: $(inEl).eq(4).val(),
					memEmail1: $(inEl).eq(5).val(),
					memEmail2: $(inEl).eq(6).val(),
					memTel1: $(inEl).eq(7).val(),
					memTel2: $(inEl).eq(8).val(),
					memTel3: $(inEl).eq(9).val(),
					memGrade: $(inEl).eq(10).val(),
				},
				success: function(res) {
					console.log(res);
				},
				error: function(xhr, sta, err) {
					alert(sta+ ' => '+ err);
				},
			});*/
			inEl.prop('disabled', 'disabled');
		}
		return false;
		event.preventDefault();
	};
	
	$.indexing= function() {
		var count= 0;
		$('table#mytable_res').find('tr').each(function() {
			$(this).find('input').eq(1).val(count);
			count+= 1;
		});
	}
	
	$.deleteRes= function(idx) {
		var trEl= $('#mytable_res tr').eq(idx);
		trEl.hide();
		return false;
		event.preventDefault();
	};
});