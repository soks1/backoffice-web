;(function ($) {
	$.widget( "custom.uploader", {
		options: {
			'file_divn_cd': '',
			'accept': 'image/*',
			'maxsize': 300
		},
		
		_create: function() {
			console.debug('ready : ', this.element)
			var self = this;
			$.extend(this.options, {
				'file_divn_cd': this.element.data('fileDivnCd'),
				'maxsize': this.element.data('maxsize'),
				'preview': this.element.data('preview'),
				'accept': this.element.attr('accept')
			}, this.options);

			this['preViewElement'] = $(this.options['preview']).length == 0 ? null : $(this.options['preview']).data('defaultUrl', $(this.options['preview']).attr('src'));
			this['removeButton'] = $('<span>').hide().insertAfter( this.element.parent() );
			$('<a>', {'href': '#'}).addClass('btn btn-danger btn-sm')
				.on('click', function(e) {
					e.preventDefault();
					self.refresh();
				})
				.text('파일삭제').appendTo( this['removeButton'] );

			this._on(this.element, {'change': '_filechange'});
		},
		
		_setOptions: function() {
			this._superApply( arguments );
			
			if ('fileInfo' in arguments[0]) this.redraw(arguments[0]['fileInfo']);
			delete this.options['fileInfo'];
		},
		
		_filechange: function(event) {
			var self = this;
			var fileItem = this.element.get(0).files[0];
			
			if (fileItem) {
				var isValid = false;
				if (typeof this.options['validator'] === 'undefined') {
					isValid = this.validator(fileItem.type, fileItem.size);
				}
				else if (typeof this.options['validator'] === 'function') {
					isValid = this._trigger('validator', event, [fileItem.type, fileItem.size]);
				}
				else if (typeof this.options['validator'] === 'object') {
					var __validator;
					for(var _v in this.options['validator']) {
						var _reg = new RegExp(".?(" + _v.replace( /[\-\[\]\/\{\}\(\)\+\?\.\\\^\$\|]/g, "\\$&" ).replace( /,/g, "|" ).replace( "\/*", "/.*" ) + ")$", "i");
						if (fileItem.type.match( _reg )) {
							__validator = this.options['validator'][_v];
							break;
						}
					}
					
					if (__validator) isValid = __validator.apply(event, [fileItem.type, fileItem.size]);
					else isValid = this.validator(fileItem.type, fileItem.size);
				}
				
				if (isValid) {
					if (this.element.hasClass('hasFile')) {
						alert('기존 파일을 삭제하고 업로드 하시기 바랍니다.');
						return false;
					}
					else {
						this.refresh();
						
						var formData = new FormData();
						formData.append('file', fileItem, encodeURI(fileItem['name']));
						formData.append('file_divn_cd', this.options['file_divn_cd']);
						formData.append('empno', $.getSessionData()['empno'] );
						
						$.ajax({
							url: api_img_url+"/backoffice/common/file/upload",
							type: 'POST',
							data: formData,
							dataType: 'json',
							cache: false,
							contentType: false,
							processData: false,
							success: function(data, textStatus, jqXHR) {
								if (data['code'] && data['code'] == 'S0000') self.redraw(data['data']);
								else alert(data['message'] || '파일 업로드 중 오류가 발생했습니다.');
							},
							error: function(jqXHR, textStatus, errorThrown) {
								var data = jqXHR.responseJSON;
						    	alert('code: ' + data['code'] + '\n\n' + 'message: ' + cf_msg(data['message']) + '\n');
						    	return;
							}
						});
					}
				}
			}
		},
		redraw: function(item) {
			// atch_file_nm, file_divn_cd, local_file_nm, prvw_url
			
			var self = this;
			this.element.addClass('hasFile').data(item);

			if (this['preViewElement']) {
				$(this.options['preview']).data('originalName', item['atch_file_nm']).attr('src', item['prvw_url']);
			}
			
			this['originalName'] = $('<p></p>').addClass('alert alert-info bd0').text( item['atch_file_nm'] || '' ).insertAfter( $(this.options['preview']) );
			this['removeButton'].show();
			this.element.parents('span.fileinput-button').attr('disabled', true);
		},
		validator: function(_type, _size) {
			var typeParam = typeof this.options['accept'] === "string" ? this.options['accept'].replace( /\s/g, "" ) : "image/*";
			typeParam = typeParam.replace( /[\-\[\]\/\{\}\(\)\+\?\.\\\^\$\|]/g, "\\$&" ).replace( /,/g, "|" ).replace( "\/*", "/.*" );
			var regex = new RegExp( ".?(" + typeParam + ")$", "i" );

			if (!_type.match( regex )) {
				alert('업로드 가능한 형식이 아닙니다.');
				return false;
			}
			
			if (!this.options['maxsize'] || !(typeof this.options['maxsize'] === 'number') || (this.options['maxsize'] * 1024 < _size)) {
				alert('업로드 가능한 최대파일용량을 초과하였습니다.');
				return false;
			}
			
			return true;
		},
		refresh: function() {
			this.element.removeClass('hasFile').removeData('atch_file_nm').removeData('file_divn_cd').removeData('local_file_nm').removeData('prvw_url');
			this.element.parents('span.fileinput-button').attr('disabled', false);
			
			if (this['originalName']) this['originalName'].remove();
			if (this['removeButton']) this['removeButton'].hide();
			if (this['preViewElement']) this['preViewElement'].attr('src', this['preViewElement'].data('defaultUrl'));
		}
	});
})(jQuery);
