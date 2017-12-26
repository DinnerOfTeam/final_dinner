$(function() {
	$.editMember= function(idx) {
		var inEl= $('tr').eq(idx).find('td input');
		var memNo= inEl.first().val();
		if(inEl.is(':disabled')) {
			inEl.prop('disabled', '');
		}else {
			inEl.prop('disabled', 'disabled');
		}
		return false;
		event.preventDefault();
	};
	
	$.indexing= function() {
		var count= 0;
		$('table').find('tr').each(function() {
			$(this).find('input').eq(1).val(count);
			count+= 1;
		});
	}
	
	$.deleteMember= function(idx) {
		var trEl= $('tr').eq(idx);
		trEl.hide();
		return false;
		event.preventDefault();
	};
	
	$.addMember= function(idx) {
		var count= 0;
		$('table').find('tr').each(function() {
			count+= 1;
		});
		
		var trEl= $('<tr></tr>');
		var tdEl1= $('<td></td>');
		var inEl1= $('<input id="items.['+ count+ '].memNo" type="hidden"/>'+
				'<input type="text" value="'+ count+ '" size="2"> '+
				'<input id="items.['+ count+ '].memId" size="4"/>');
		tdEl1.append(inEl1);
		var tdEl2= $('<td></td>');
		var inEl2= $('<input id="items.['+ count+ '].memPwd" size="3"/>');
		tdEl2.append(inEl2);
		var tdEl3= $('<td></td>');
		var inEl3= $('<input id= "items.['+ count+ '].memName" size="8"/>');
		tdEl3.append(inEl3);
		var tdEl4= $('<td></td>');
		var inEl4= $('<input id= "items.['+ count+ '].memEmail1" size="8"/>@ '+
				'<input id= "items.['+ count+ '].memEmail2" size="12"/>');
		tdEl4.append(inEl4);
		var tdEl5= $('<td></td>');
		var inEl5= $('<input id= "items.['+ count+ '].memTel1" size="3"/>- '+
				'<input id= "items.['+ count+ '].memTel2" size="4"/>- '+
				'<input id= "items.['+ count+ '].memTel3" size="4"/>');
		tdEl5.append(inEl5);
		var tdEl6= $('<td></td>');
		var inEl6= $('<input id= "items.['+ count+ '].memGrade" size="1"/>');
		tdEl6.append(inEl6);
		var tdEl7= $('<td></td>');
		var inEl7= $('<button class="btn btn-primary" onclick="$.editMember('+ count+ ')">Edit</button> '+ 
				'<button class="btn btn-danger" onclick="$.deleteMember('+ count+ ')">Delete</button>');
		tdEl7.append(inEl7);
		
		trEl.append(tdEl1);
		trEl.append(tdEl2);
		trEl.append(tdEl3);
		trEl.append(tdEl4);
		trEl.append(tdEl5);
		trEl.append(tdEl6);
		trEl.append(tdEl7);
		$('table').append(trEl);
	}
	$.indexing();
});