<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-sm-12 col-md-12 col-lg-12">
			<div>
				<div class="widget-body">
					<fieldset>
						<div class="form-group" id="insti_list_div"></div>
					</fieldset>
				</div>
				<br />
				<div class="col-sm-12 text-center">
					<a href="javascript:f_setInstiList();" class="btn btn-warning">가맹기관 선택 적용</a>
				</div>
			</div>
		</article>
	</div>
</section>

<script type="text/javascript">

// 가맹 기관 목록 조회
function f_getInstiList() {
	$.ajax({
	    url: api_url+"/bo/merchant/npmt_bo_02006", //this is the submit URL
	    type: "GET", // GET or POST
	    async: true,
	    cache: true,
	    datatype: 'json',
	    beforeSend : function() {},
	    success: function(obj){
	    	var instiList = obj.data.insti_list;
	    	
	    	$('#insti_list_div').empty();
	    	if (instiList.length > 0) {
    			var rowDiv;
    			
	    		$.each(instiList, function(idx, data) {
	    			var label = $('<label/>').addClass('col-md-3 checkbox-inline').css('width', "23%");
	    			var input = $('<input/>').attr('type', 'checkbox').attr('name', 'chk_insti_id').val(data.insti_id);
	    			var span  = $('<span/>').html(data.insti_nm);
	    			
	    			if(idx == 0) {
	    				rowDiv = $('<div/>').addClass('col-md-12');
	    			}
	    			else if(idx%4 == 0) {
	    				$('#insti_list_div').append(rowDiv);
	    				rowDiv = $('<div/>').addClass('col-md-12');
	    			}
	    			else {
	    				$('#insti_list_div').append(rowDiv);
	    			}
	    			
	    			if($('#insti_id_list').val().indexOf(data.insti_id) > -1) {
	    				input.attr('checked', 'checked');
	    			}
	    			
	    			label.append(input).append(span)
	    			rowDiv.append(label)
	    		});
	    	}
	    	else {
	    		$('#insti_list_div').append($('<div/>').addClass('col-md-12').html("선택 가능 가맹기관 데이터 없음."));
	    	}
	    },
	    error: function(obj) {
	    	var serverObj = obj.responseJSON;
	    	alert('code:'+serverObj.code+'\n'+'message:'+cf_msg(serverObj.message)+'\n');
	    	return;
	    }
	});
}

function f_setInstiList() {
	var instiIdList = "";
	var instiNmList = "";
	
	var firstFlag = true;
	
	$.each($('input[name=chk_insti_id]'), function() {
		if($(this).is(':checked')) {
			if(firstFlag) {
				instiIdList += $(this).val();
				instiNmList += $(this).parent().children('span').html();
				
				firstFlag = false;
			}
			else {
				instiNmList += ", " + $(this).parent().children('span').html();
				instiIdList += "," + $(this).val();
			}
		}
	});
		
	$('#insti_id_list').val(instiIdList);
	$('#insti_nm_list').val(instiNmList);
	
	$('#insti_list_cd').dialog('close');
}

pageSetUp();

f_getInstiList();

</script>