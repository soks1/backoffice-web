<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-sm-12 col-md-12 col-lg-12">
			<div>
				<div class="widget-body">
					<fieldset>
						<div class="form-group" style="text-align:left;">
							<div class="col-md-12">
								<label class="col-md-3 checkbox-inline">
									<input type="checkbox" id="chk_all_mcht" /><span>전체 선택/취소</span>
								</label>
							</div>
						</div>
						<div class="form-group">
							<span class="form-control cs-css-03" style="height:1px;"></span>
						</div>
						<div class="form-group" style="text-align:left;" id="mcht_list_div"></div>
					</fieldset>
				</div>
				<br />
				<div class="col-sm-12 text-center">
					<a href="javascript:f_setMchtList();" class="btn btn-warning">가맹점 선택 적용</a>
				</div>
			</div>
		</article>
	</div>
</section>

<script type="text/javascript">

$('#chk_all_mcht').on('change', function() {
	if($('#chk_all_mcht').is(":checked")) {
		$("input[name=chk_mcht_id]").prop("checked",true);
	}
	else {
		$("input[name=chk_mcht_id]").prop("checked",false);
	}
});

// 가맹 기관 목록 조회
function f_getMchtList() {
	$.ajax({
	    url: api_url+"/bo/notice/npmt_bo_02206", //this is the submit URL
	    type: "GET", // GET or POST
	    async: true,
	    cache: true,
	    datatype: 'json',
	    beforeSend : function() {},
	    success: function(obj){
	    	var mchtList = obj.data.mcht_list;
	    	
	    	$('#mcht_list_div').empty();
	    	if (mchtList.length > 0) {
    			var rowDiv;
    			
    			var checkLen = 0;
    			var rowCnt   = 1;
	    		$.each(mchtList, function(idx, data) {
	    			var label = $('<label/>').addClass('col-md-2 checkbox-inline');
	    			var input = $('<input/>').attr('type', 'checkbox').attr('name', 'chk_mcht_id').val(data.mcht_id);
	    			var span  = $('<span/>').html(data.mcht_nm);

	    			if(idx == 0) {
	    				rowDiv = $('<div/>').addClass('col-md-12');
	    			}
	    			else if(idx%5 == 0) {
	    				$('#mcht_list_div').append(rowDiv);
	    				rowDiv = $('<div/>').addClass('col-md-12');
	    			}
	    			
	    			if($('#mcht_id_list').val().indexOf(data.mcht_id) > -1) {
	    				input.attr('checked', 'checked');
	    				checkLen++;
	    			}
	    			
	    			label.append(input).append(span);
	    			rowDiv.append(label);
	    			
	    			
	    			if (idx == (mchtList.length-1)) {
	    				$('#mcht_list_div').append(rowDiv);
	    			}
	    		});
	    		
	    		if(mchtList.length == checkLen) {
	    			$('#chk_all_mcht').prop("checked",true);
	    		}
	    	}
	    	else {
	    		$('#mcht_list_div').append($('<div/>').addClass('col-md-12').html("선택 가능 가맹기관 데이터 없음."));
	    	}
	    },
	    error: function(obj) {
	    	var serverObj = obj.responseJSON;
	    	alert('code:'+serverObj.code+'\n'+'message:'+cf_msg(serverObj.message)+'\n');
	    	return;
	    }
	});
}

function f_setMchtList() {
	var mchtIdList = "";
	var mchtNmList = "";
	
	var firstFlag = true;
	
	$.each($('input[name=chk_mcht_id]'), function() {
		if($(this).is(':checked')) {
			if(firstFlag) {
				mchtIdList += $(this).val();
				mchtNmList += $(this).parent().children('span').html();
				
				firstFlag = false;
			}
			else {
				mchtNmList += ", " + $(this).parent().children('span').html();
				mchtIdList += "," + $(this).val();
			}
		}
	});
		
	$('#mcht_id_list').val(mchtIdList);
	$('#mcht_nm_list').val(mchtNmList);
	
	$('#mcht_list_cd').dialog('close');
}

pageSetUp();

f_getMchtList();

</script>