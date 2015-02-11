(function ($) {  
$.fn.CascadingSelect = function (options) {   
	//默认参数设置    
	var defaults = {     
		url: null,  //请求路径     
		data: "0",     //初始值(字符串格式)      
		split: ",",       //分割符      
		cssName: "combox",   //样式名称      
		val: "id",       //<option value="id">name</option>      
		text: "name",      //<option value="id">name</option>     
		refId:null
	}    
	//合并参数    
	//链式原则    
	return this.each(function () {      
		var settings=      $.extend({},defaults, options);    
		init($(this), settings.data);      
			/*      初始化      @param container  容器对象      @param data     初始值      */      
			function init(container, data) 
			{        
				//创建隐藏域对象,并赋初始值        
				//var _input = $("<input type='hidden' name='" + settings.hiddenName + "' />").appendTo(container).val(settings.data);    
				/*
				var arr = data.split(settings.split);       
				for (var i = 0; i < arr.length; i++)
				{      
					//创建下拉框        
					createSelect(container, arr[i], arr[i + 1] || -1);   
				}     
				*/
				settings.refId=container.attr("refId");
				settings.url=container.attr("refUrl");
				//为select绑定change事件  
				if(settings.refId && settings.url)
				{
					container.bind("change", function () { _onchange( $(this), $(this).val()) });   
					//init the select's data
					// _onchange( $(this), $(this).val());
				}


			}     
			/*      创建下拉框      @param container  容器对象      @param parentid   父ID号      @param id      自身ID号      */   
			function createSelect(container, parentid, id) 
			{       
				//创建select对象，并将select对象放入container内       
				var _select = $("<select></select>").appendTo(container).addClass(settings.cssName);       
				//如果parentid为空，则_parentid值为0        
				var _parentid = parentid || 0;      
				//发送AJAX请求,返回的data必须为json格式     
				$.getJSON(settings.url, { parentid: _parentid }, function (data) 
				{         
					//添加子节点<option>        
					addOptions(container, _select, data).val(id || -1)       
				});     
			}      
			/*      为下拉框添加<option>子节点      @param container  容器对象      @param select    下拉框对象      @param data     子节点数据(要求数据为json格式)      */ 
			function addOptions( select, data) 
			{    
				//select.append($('<option value="-1">=Select=</option>'));     
				for (var i = 0; i < data.length; i++) 
				{        
					select.append($('<option value="' + data[i][settings.val] + '">' + data[i][settings.text] + '</option>'));        
				}       
				return select;     
			}     
			/*      select的change事件函数      @param container  容器对象      @param select    下拉框对象      @param id      当前下拉框的值      */   
			function _onchange( select, val) 
			{     
				var nextAll = $("#"+settings.refId);//select.nextAll("select");        
				//如果当前select对象的值是空或-1（即：==请选择==），则将其后面的select对象全部移除        
				if (val || val == "-1") {        
				}     
				nextAll.find("option").remove();      
				var url=settings.url.replace(new RegExp("\\{val\\}","g"),val);
				 $.ajaxSetup({
                     error: function (x, e) {
                         alert("JSON Data error");
                         return false;
                     }
                 });
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