<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<nav>
				<!-- 
				NOTE: Notice the gaps after each icon usage <i></i>..
				Please note that these links work a bit different than
				traditional href="" links. See documentation for details.
				-->

				<ul id="menuTree">
					<li class="">
						<a href="/application/dashboard.do" title="Dashboard"><i class="fa fa-lg fa-fw fa-home"></i> <span class="menu-item-parent">Dashboard</span></a>
					</li>
				</ul>
			</nav>

			<!-- <span class="minifyme" data-action="minifyMenu"> <i class="fa fa-arrow-circle-left hit"></i> </span> -->
			
			
			
<script type="text/javascript">
var getMenuTree = function (itemData,idx) {
	var item = "";

	if (itemData.menu_items.length > 0) {
		var append = "";
		if(idx == 0) {
			append += "<a href='#'><i class='fa fa-lg fa-fw "+itemData.menu_icon_nm+"'></i> <span class='menu-item-parent'>"+itemData.menu_nm+"</span></a>";	
		} else {
			append += "<a href='#'>"+itemData.menu_nm+"</a>";
		}
		item = $("<li>").html(append);	
	} else {
		var append = "";
		if(itemData.menuId == '00010') {
			append += "<a href='"+itemData.url+"' title='"+itemData.menu_nm+"'><i class='fa fa-lg fa-fw fa-home'></i> <span class='menu-item-parent'>"+itemData.menu_nm+"</span></a>";
		}
		else {
			if(idx == 0) {
				append += "<a href='"+itemData.url+"' title='"+itemData.menu_nm+"'><i class='fa fa-lg fa-fw "+itemData.menu_icon_nm+"'></i> "+itemData.menu_nm+"</a>";	
			} else {
				append += "<a href='"+itemData.url+"' title='"+itemData.menu_nm+"'>"+itemData.menu_nm+"</a>";	
			}
		}
		
		item = $("<li>").html(append);
	}
	
    if (itemData.menu_items.length > 0) {
        var subList = $("<ul>");
        $.each(itemData.menu_items, function () {
            subList.append(getMenuTree(this,(idx+1)));
        });
        item.append(subList);
    }
    return item;
};
$(function() {
	$.ajax({
		url: "/left.do",
		type: 'POST',
		async: true,
		cache: false,
		dataType: 'json',
		success: function(obj) {
			var menu = $("#menuTree");
			menu.empty();
			
			var parent = obj.menu_list[0].menu_items;
			
			$.each(parent, function(i, items) {
				menu.append(getMenuTree(items,0));
			});
		},
		complete: function() {
			refreshURL();
			initApp.leftNav();
		}
	});
});
</script>
			
			