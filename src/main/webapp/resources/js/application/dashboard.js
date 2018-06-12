
/** 메뉴 이동 */
function f_openMenu(path, params) {

	$('nav li.active').removeClass('active');
	
	$('nav li.open').has('ul').not(':has(a[href="' + path + '"])').each(function() {
		$(this).children('ul').slideUp(200);
		$(this).find('a b').html('<em class="fa fa-plus-square-o"></em>');
		$(this).removeClass('open');
	});
	
	var targetMenu = $('nav li a[href="' + path + '"]');
	
	targetMenu.parents('li').has('ul').addClass('active');
	targetMenu.parents('li').has('ul').find('a b').html('<em class="fa fa-minus-square-o"></em>');
	targetMenu.parent().addClass('active');
	
	targetMenu.parents('li').has('ul').each(function() {
		if(!$(this).hasClass('open')) {
			$(this).addClass('open'); 
			$(this).children('ul').slideDown(200);
		}
	});

	f_loadPage(path, params);

}
	
/** 페이지 로드 */
function f_loadPage(path, params) {	
	
	window.location.hash = path + params;
	var url = location.href.split('#').splice(1).join('#');
	if (!url) {
		try {
			var documentUrl = window.document.URL;
			if (documentUrl) {
				if (documentUrl.indexOf('#', 0) > 0 && documentUrl.indexOf('#', 0) < (documentUrl.length + 1)) {
					url = documentUrl.substring(documentUrl.indexOf('#', 0) + 1);
				}
			}
		} catch (err) {}
	}
	container = $('#content');
	
	var title = ($('nav a[href="' + url + '"]').attr('title'));
	document.title = (title || document.title);
	
	$.ajax({
		type : "GET",
		url : url + location.search,
		dataType : 'html',
		async : true,
		cache : true,
		success : function(data) {
			container.css({
				opacity : '0.0'
			}).html(data).delay(50).animate({
				opacity : '1.0'
			}, 300);
			data = null;
			container = null;
		},
		error : function(xhr, status, thrownError, error) {
			container.html('<h4 class="ajax-loading-error"><i class="fa fa-warning txt-color-orangeDark"></i>'+
					'Error requesting <span class="txt-color-red">' + url + '</span>: ' + xhr.status + ' <span style="text-transform: capitalize;">'  + thrownError + '</span></h4>');
		},
		complete: function() {
		}
	});
	
}


/** 공지사항 목록 화면 이동 */
function f_noticeList() {
	f_openMenu('/application/merchant/notice/noticePN.do', '');
}

/** 공지사항 상세 화면 이동  */
function f_readNoticeDetail(id) {
	f_openMenu('/application/merchant/notice/noticePN.do' , '?p=R&noti_id=' + id);
}

/** 가맹점 상세 화면 이동  */
function f_unreadMcht(obj) {
	var mcht_id = $(obj).attr('data-mcht-id');
	f_openMenu('/application/merchant/merchant/merchantPN.do' , '?p=R&mcht_id=' + mcht_id)
}


/** 공지사항 첨부파일 다운로드  */
function f_atchDownload(id) {
	var url = api_url+"/bo/dashboard/npmt_bo_01001?";
	var data = {
			noti_id: id,
			access_token: localStorage.getItem('access_token')
		};
	var params = encodeURI('params='+JSON.stringify(data));
	
	$.fileDownload(url + params);
}


/** 조회 기준 시간 (오늘, 어제) (YYYY-MM-DD hh:mm:ss) */
function f_getTargetDate() {
	var to = new Date();
	
	var todayDate = to.getFullYear() + "-" + ("0" + (to.getMonth()+1)).slice(-2) + "-" + ("0" + to.getDate()).slice(-2);
	var currentTime = ("0" + to.getHours()).slice(-2) + ":" + ("0" + to.getMinutes()).substr(-2,1) + "0:00";
	
	to.setDate(to.getDate()-1); //하루 전
	var yesterdayDate = to.getFullYear() + "-" + ("0" + (to.getMonth()+1)).slice(-2) + "-" + ("0" + to.getDate()).slice(-2);
	
	result = { 
			view_start_date : yesterdayDate + " " + currentTime 
			, view_end_date : todayDate + " " + currentTime 
			, start_date : yesterdayDate.replace(/-/g, '') + currentTime.replace(/:/g, '')
			, end_date : todayDate.replace(/-/g, '') + currentTime.replace(/:/g, '')
		};
	
	return result;
}


/** 테이블 고정 헤더 세팅 */
function f_setFixedHeader() {
	$('.table-fixed-header').each(function (h_index, h_obj) {
		var oriHeaderObj = $(h_obj).parent().find('.table thead');
		var headHtml = oriHeaderObj.html();
		oriHeaderObj.remove();
		$(h_obj).html('<thead>' + headHtml + '</thead>');
	});
	
	f_calculateFixedHeaderSize();
}

/** active 테이블 고정 헤더 크기 조정 */
function f_calculateFixedHeaderSize() {
	
	var h_obj = $('.tab-content .active .table-fixed-header');

	var bodyWidth = h_obj.parent().find('.table-fixed-body').width();
	var bodyTd = h_obj.parent().find('.table-fixed-body tr:eq(0) td');
	
	h_obj.width(bodyWidth);
	
	if (bodyTd.size() > 1) {
		bodyTd.each(function (td_index, td_obj) {
			h_obj.find('th:eq(' + td_index + ')').css("width", $(td_obj).outerWidth());
		});
	}
		
}
