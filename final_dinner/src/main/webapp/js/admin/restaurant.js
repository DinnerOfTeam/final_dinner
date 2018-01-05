$(function() {
	$.approveRes= function(idx) {
		var trEl= $('#mytable_res tr').eq(idx);
		var r= trEl.find('input[type=hidden]').val();
		var p= confirm('승인됩니다.');
/*		alert('승인 여부 : '+ p);*/
		if(p) {
			$.ajax({
				type: 'post',
				data: {
					resNo: r,
					type: 'app',
				},
				url: "/dinner/admin/restaurant/update.do",
				success: function(res) {
					var s= $(res).find('result').text();
					if(s== 1) {
						alert('승인성공');
						trEl.hide();
					}else {
						alert('승인실패');
					}
				},
				error: function(xhr, sta, err) {
					alert(sta+ '=>'+ err);
				}
			});
		}
	};
	
	$.banRes= function(idx) {
		var trEl= $('#mytable_res tr').eq(idx);
		var r= trEl.find('input[type=hidden]').val();
		var p= prompt('반려 이유를 적어주세요');
		if(p== null) {
			return false;
		}else if(p != null) {
	/*		alert('반려이유 : '+ p);*/
			$.ajax({
				type: 'post',
				data: {
					resNo: r,
					type: 'ban',
					msg: p,
				},
				url: "/dinner/admin/restaurant/update.do",
				success: function(res) {
					var s= $(res).find('result').text();
					if(s== 1) {
						alert('반려성공');
						trEl.prop('class', 'tr_red');
						trEl.find('td label').prop('style', 'color:red');
					}else {
						alert('승인실패');
					}
				},
				error: function(xhr, sta, err) {
					alert(sta+ '=>'+ err);
				}
			});
		}
	};
});