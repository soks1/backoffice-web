;(function($){
    $.jtable = function(el, options){
        // To avoid scope issues, use 'base' instead of 'this'
        // to reference this class from internal events and functions.
        var base = this;
        
        // Access to jQuery and DOM versions of element
        base.$el = $(el);
        base.el = el;
        
        // Add a reverse reference to the DOM object
        base.$el.data("jtable", base);
        
        fn_ajax = function(settings) {
    		var rtn_obj = null;    		
    		var ajax_data = {};
    		
    		ajax_data = settings.data;
    		ajax_data['search'] = settings.search;
    		
    		// 페이지 정보 및 정렬 정보 셋팅 
    		var page_info = {};
    		page_info['page'] = settings.page || 1;
    		page_info['rows'] = settings.rows || 10;
    		page_info['sortname'] = settings.sort.sortname || '';
    		page_info['sortorder'] = settings.sort.sortorder || '';
    		ajax_data['page_info'] = page_info;
    		
    		$.ajax({
    			url: settings.url,
    			type: settings.type,
    			datatype: settings.datatype,
    			async: false,
    		    cache: settings.cache,
    			data: JSON.stringify(ajax_data),
    			success: function(obj) {
    				rtn_obj = obj;
    			},
    			error: function(obj) {
    		    }
    		});
    		return rtn_obj;
    	};
    	
    	fn_makeThead = function(table, settings) {
    		var width = table.parent().width();
    		var col_name = settings.colName;
    		var col_model = settings.colModel;
    		var thead = $('<thead>');
    		var tr = $('<tr>');
    		
    		if(settings.multiselect == true) {
    			width = width - 30;
    			var checkbox_th = $('<th>').attr('id', base.el.id + '_checkbox').css('width','30px').css('text-align','center');
    			var checkbox_input = $('<input>').attr('type','checkbox').attr('name', base.el.id + '_checkedAll');
    			checkbox_th.append(checkbox_input);
    			tr.append(checkbox_th);
    		}
    		
    		for(var i = 0; i < col_name.length; i++) {
    			var th = $('<th>').attr('id', base.el.id + '_' + col_model[i].name);
    			
    			if(typeof col_model[i].width != 'undefined') {
    				th.css('width', (width*(parseInt(col_model[i].width)/100)) );
    			}
    			th.html( col_name[i] );
    			tr.append(th);
    		}
    		thead.append(tr);
    		table.append(thead);
    	};
    	
    	fn_makeTbody = function(table, settings, json_obj) {
    		var list_data = settings.info.root(json_obj);
    		if(list_data.length > 0) {
    			var col_model = settings.colModel;
    			var tbody = $('<tbody>');
    			
    			for(var i = 0; i < list_data.length; i++) {
    				
    				var tr = $('<tr>').attr('id', list_data[i][settings.info.id]);
    				
    				if(settings.multiselect == true) {
    	    			var checkbox_td = $('<td>').attr('id', base.el.id + '_checkbox').css('width','30px').css('text-align','center');
    	    			var checkbox_input = $('<input>').attr('type','checkbox').attr('name', base.el.id + '_checkbox').val(list_data[i][settings.info.id]);
    	    			checkbox_td.append(checkbox_input);
    	    			tr.append(checkbox_td);
    	    		}
    				
    				for(var j = 0; j < col_model.length; j++) {
    					var td = $('<td>').addClass(base.el.id + '_cell').attr('title', list_data[i][col_model[j].index]).attr('cell_name', col_model[j].name);
    					var align = col_model[j].align;
    					if(typeof align == 'undefined') {
    						align = 'center';
    					}
    					td.css('text-align', align);
    					if(typeof col_model[j].classes != 'undefined') {
    						td.addClass(col_model[j].classes);
    					}
    					td.html( list_data[i][col_model[j].index] );
    					tr.append(td);
    				}
    				tbody.append(tr);
    			}
    			table.append(tbody);
    		}
    		else {
    			var col_name = settings.colName;
    			var colspan = col_name.length;
    			
    			if(settings.multiselect == true) {
    				colspan = colspan + 1;
    			}
    			
    			var td = $('<td>');
    			td.attr('colspan', colspan);
    			td.html('No data');
    			
    			var tr = $('<tr>');
    			tr.append(td);
    			
    			var tbody = $('<tbody>');
    			tbody.append(tr);
    		}
    	};
    	
        // 파라미터 가지고 오기
        base.getParams = function(obj){
            if(obj == 'search_info') {
            	return base.options.data.search_info;
            }
            else if(obj == 'sort_info') {
            	return base.options.data.sort_info;
            }
            else if(obj == 'data') {
            	return base.options.data;
            }
            else if(obj == 'search') {
            	return base.options.search;
            }
            else if(obj == 'checked') {
            	var checkbox_array = new Array();
        		base.$el.find('tbody input[type=checkbox]:checked').each(function(i){
        			checkbox_array[i] = $(this).val();
        		});
        		return checkbox_array;
            }
        };
        
        base.getCell = function(row_id, cell_name) {
        	return base.$el.find('tr[id=' + row_id + ']').find('td[cell_name=' + cell_name + ']').html();
        };
        
        
        // 파리미터 셋팅
        base.setParams = function(params){
        	base.options = $.extend(true, base.options, params);
        };
        
        
        // 새로 고침
        base.reload = function(){
    		base.$el.find('tbody').remove();
    		fn_makeTbody(base.$el, base.options, fn_ajax(base.options));
        };
        
        
        // 초기화
        base.init = function(){
        	base.options = $.extend({}, $.jtable.settings, options);
        	
        	if(base.options.initLoad == true) {
    	    	fn_makeThead(base.$el, base.options);
    	    	fn_makeTbody(base.$el, base.options, fn_ajax(base.options));
        	} 
        	else {
        		fn_makeThead(base.$el, base.options);
        	}
            
        };
        
        // Run initializer
        base.init();
    };
    
    $.jtable.settings = {
		url : null,
    	type: 'GET',
    	datatype: 'json',
	    cache: false,
	    data: null,
	    search: false,
	    colName: null,
	    colModel: null,
	    page: null,
	    rows: null,
	    initLoad : true,
	    multiselect : false,
	    pager : null,
		sort : {
			sortname : null,
			sortorder : null
		},
		info : {
			id : null,
			root : null,
			page : null,
			block : null,
			total : null
		},
		onselect : function(row_id, cell_index, cell_data) {
			
		}
    };
    
    $.fn.jtable = function(options){
        return this.each(function(){
            (new $.jtable(this, options));
            
            $('.' + this.id + '_cell').click(function(){
            	var tr = $(this).parent();
            	var td = $(this);
            	var cell_index = 0;
            	
            	tr.find('td').each(function(i){
            		if( $(this).attr('title') == td.attr('title') ) {
            			cell_index = i;
            		}
            	});
            	
            	options.onselect(tr.attr('id'), cell_index, td.html());
            });
        });
    };
    
    $.fn.extend({
    	jtable_fn : function(mode, main_obj, sub_obj) {
    		if(mode == 'reload') {
    			this.data("jtable").reload();
    		}
    		else if(mode == 'setParams') {
    			this.data("jtable").setParams(main_obj);
    		}
    		else if(mode == 'getParams') {
    			return this.data("jtable").getParams(main_obj);
    		}
    		else if(mode == 'getCell') {
    			return this.data("jtable").getCell(main_obj, sub_obj);
    		}
    	}
    });
    
    // This function breaks the chain, but returns
    // the jtable if it has been attached to the object.
    $.fn.getjtable = function(){
        this.data("jtable");
    };
    
})(jQuery);
