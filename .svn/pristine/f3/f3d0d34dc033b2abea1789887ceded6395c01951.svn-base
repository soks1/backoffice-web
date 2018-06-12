$.fn.gridCss = function() {
	$('.navtable .ui-pg-button').tooltip({
		container : 'body'
	});
	
	// remove classes
	$(".ui-jqgrid").removeClass("ui-widget ui-widget-content");
    $(".ui-jqgrid-view").children().removeClass("ui-widget-header ui-state-default");
    $(".ui-jqgrid-labels, .ui-search-toolbar").children().removeClass("ui-state-default ui-th-column ui-th-ltr");
    $(".ui-jqgrid-pager").removeClass("ui-state-default");
    $(".ui-jqgrid").removeClass("ui-widget-content");
    
    // add classes
    $(".ui-jqgrid-htable").addClass("table table-bordered table-hover");
    $(".ui-jqgrid-btable").addClass("table table-bordered table-striped");

    $(".ui-pg-div").removeClass().addClass("btn btn-sm btn-primary");
    
    $(".ui-icon.ui-icon-plus").removeClass();
    $(".ui-icon.ui-icon-trash").removeClass().parent(".btn-primary").removeClass("btn-primary").addClass("btn-danger");
    $(".ui-icon.ui-icon-check").removeClass().parent(".btn-primary").removeClass("btn-primary").addClass("btn-success");
    $(".ui-icon.ui-icon-excel").removeClass().parent(".btn-primary").removeClass("btn-primary").addClass("btn-warning");
    

	$(".ui-icon.ui-icon-seek-prev").wrap( "<div class='btn btn-sm btn-default'></div>" );
	$(".ui-icon.ui-icon-seek-prev").removeClass().addClass("fa fa-backward");
	$(".ui-icon.ui-icon-seek-first").wrap( "<div class='btn btn-sm btn-default'></div>" );
  	$(".ui-icon.ui-icon-seek-first").removeClass().addClass("fa fa-fast-backward");		  	
  	$(".ui-icon.ui-icon-seek-next").wrap( "<div class='btn btn-sm btn-default'></div>" );
  	$(".ui-icon.ui-icon-seek-next").removeClass().addClass("fa fa-forward");
  	$(".ui-icon.ui-icon-seek-end").wrap( "<div class='btn btn-sm btn-default'></div>" );
  	$(".ui-icon.ui-icon-seek-end").removeClass().addClass("fa fa-fast-forward");
  	
  	$(".ui-jqgrid-sortable").css("padding","7px 0");
  	$(".ui-jqgrid-labels th").css("text-align","center");
};

$.fn.gridPageCss = function() {
	
};