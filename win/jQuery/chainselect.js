(function ($) {  
$.fn.CascadingSelect = function (options) {   
	//Ĭ�ϲ�������    
	var defaults = {     
		url: null,  //����·��     
		data: "0",     //��ʼֵ(�ַ�����ʽ)      
		split: ",",       //�ָ��      
		cssName: "CascadingSelect",   //��ʽ����      
		val: "id",       //<option value="id">name</option>      
		text: "name",      //<option value="id">name</option>     
		refId:null
	}    
	//�ϲ�����    
	//��ʽԭ��    
	return this.each(function () {      
		var settings=      $.extend({},defaults, options);    
		init($(this), settings.data);      
			/*      ��ʼ��      @param container  ��������      @param data     ��ʼֵ      */      
			function init(container, data) 
			{        
				//�������������,������ʼֵ        
				var _input = $("<input type='hidden' name='" + settings.hiddenName + "' />").appendTo(container).val(settings.data);    
				/*
				var arr = data.split(settings.split);       
				for (var i = 0; i < arr.length; i++)
				{      
					//����������        
					createSelect(container, arr[i], arr[i + 1] || -1);   
				}     
				*/
				settings.refId=container.attr("refId");
				settings.url=container.attr("refUrl");
				//Ϊselect��change�¼�  
				if(settings.refId && settings.url)
				{
					container.bind("change", function () { _onchange( $(this), $(this).val()) });   
					//init the select's data
					// _onchange( $(this), $(this).val());
				}


			}     
			/*      ����������      @param container  ��������      @param parentid   ��ID��      @param id      ����ID��      */   
			function createSelect(container, parentid, id) 
			{       
				//����select���󣬲���select�������container��       
				var _select = $("<select></select>").appendTo(container).addClass(settings.cssName);       
				//���parentidΪ�գ���_parentidֵΪ0        
				var _parentid = parentid || 0;      
				//����AJAX����,���ص�data����Ϊjson��ʽ     
				$.getJSON(settings.url, { parentid: _parentid }, function (data) 
				{         
					//����ӽڵ�<option>        
					addOptions(container, _select, data).val(id || -1)       
				});     
			}      
			/*      Ϊ���������<option>�ӽڵ�      @param container  ��������      @param select    ���������      @param data     �ӽڵ�����(Ҫ������Ϊjson��ʽ)      */ 
			function addOptions( select, data) 
			{    
				select.append($('<option value="-1">=Select=</option>'));     
				for (var i = 0; i < data.length; i++) 
				{        
					select.append($('<option value="' + data[i][settings.val] + '">' + data[i][settings.text] + '</option>'));        
				}       
				return select;     
			}     
			/*      select��change�¼�����      @param container  ��������      @param select    ���������      @param id      ��ǰ�������ֵ      */   
			function _onchange( select, val) 
			{     
				var nextAll = $("#"+settings.refId);//select.nextAll("select");        
				//�����ǰselect�����ֵ�ǿջ�-1������==��ѡ��==������������select����ȫ���Ƴ�        
				if (val || val == "-1") {        
				}     
				nextAll.find("option").remove();      
				var url=settings.url.replace(new RegExp("\\{val\\}","g"),val);
				$.getJSON(url, { }, function (data) {      
					nextAll.find("option").remove();           
					if (data.length > 0) {         
						var _select = addOptions(nextAll, data);            
       
					}    
					nextAll.change();
				});
			}     
  
	});  
}
})(jQuery);