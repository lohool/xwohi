function GetIeVersion()
{
    var reg = new RegExp("MSIE ([^;]*);", "i");
    if (reg.test(navigator.appVersion)) return parseInt(RegExp.$1);
    return 0;
}

function setCookie(name, value, expires, path, domain, secure){
	var strCookie = name + "=" + value;
	if (!expires){
		expires=7;
	}
		var dtmNow = new Date();
		dtmNow.setTime(dtmNow.getTime() + expires*24*60*60*1000);
		strCookie += "; expires=" + dtmNow.toGMTString();

	strCookie +=  (path) ? "; path=" + path : "";
	strCookie +=  (domain) ? "; domain=" + domain : "";
	strCookie +=  (secure) ? "; secure" : "";
	document.cookie = strCookie;
}

function getCookie(name){	
	var strCookies = document.cookie;
	var cookieName = name + "=";
	var intBegin, intEnd, strValue;
	intBegin = strCookies.indexOf(cookieName);
	if (intBegin == -1) return null;
	intEnd = strCookies.indexOf(";", intBegin);
	if (intEnd == -1) intEnd = strCookies.length;
	strValue = strCookies.substring(intBegin+cookieName.length,intEnd);
	return strValue;
}

var ieVersion = GetIeVersion();

function openNamedWindows(id, url, name)
{
	var content, title, features;
	if(url) { id = "url"; content = "[url]" + url; title = name; }
	else { content = "[id]" + id; title = windows[id].title; }
	features = windows[id].features;

	var win = windows[id].object, mode=0;
	if(win) switch(win.status)
	{
		case 0: win.Show(); if(url) mode=1; else mode=2; break;
		case 1: win.Focus(); if(url) mode=1; else mode=2; break;
	}

	switch(mode)
	{
		case 0:
			switch(windows[id].type)
			{
				case 0: win = _window.Open(content, title, features); break;
				case 1: win = _window.Alert(content, title, features); break;
				case 2: win = _window.Confirm(content, title, features); break;
			}
			if(_window.ClassName == "VISTA")
			{
				if(ieVersion > 0 && ieVersion < 7) UseVistaInIE6(win);
				win.SetTitle("<span>" + win.title + "</span>");
			}
			if(_window.Timer > 0) win.ActMoveTo(windows[id].x, windows[id].y, win.left, win.top);
			else win.MoveTo(windows[id].x, windows[id].y);

			win.OnCANCEL = win.Hidden;	
			switch(id)
			{
				case "Option":
					win.OnOK = function()
					{
						var timer = parseInt(win.form.Timer.value);
						if(!isNaN(timer))
						{
							_window.Timer = timer>100 ? 100 : (timer<0 ? 0 : timer);
							setCookie("FonshenTimer", timer, 180);
						}
						for(var i=0;i<win.form.WinStyle.length;i++)if(win.form.WinStyle[i].checked)break;
						var cname = win.form.WinStyle[i].value;
						if(cname != _window.ClassName)
						{
							_window.ClassName = cname;
							setCookie("FonshenStyle", cname, 180);
						}
						win.Close();
					};
					break;
				case "Welcome":
					win.OnOK = function(){ win.Close(); openNamedWindows("Works"); };
					win.OnCANCEL = win.Close;
					break;
			}
			break;
		case 1:
			win.SetContent(content);
			win.SetTitle(title);
	}

	if(id == "Option")
	{
		win.form.Timer.value = _window.Timer;
		for(var i=0;i<win.form.WinStyle.length;i++)
		{
			if(win.form.WinStyle[i].value == _window.ClassName) { win.form.WinStyle[i].checked = true; break; }
		}
	}

	windows[id].object = win;
}

//openNamedWindows("Welcome");

function openWindow(url, title, feature)
{
	_window.Open('[url]'+url, title, feature,_window.parent,_window.focusWindowId);
}
function openWorkWindow(url,title,icon)
{
	if(!icon)icon="";
	var w=_window.parent.offsetWidth/2;
	var h=_window.parent.offsetHeight/2;
	openWindow(url, title, 'move=yes,resize=yes,width='+w+'px,height='+h+'px,icon='+icon);
}
/**
callback: example:function(btn){if(btn=="OK"){alert("OK");}}
*/
function openAlertWindow(content, title, feature,callback)
{
	var con="<div class='alert_content'>"+content+"</div>";
	_window.Alert(con, title, feature,null,null,callback);
}
function openAlert(content,title,callback)
{
	openAlertWindow(content, title, 'taskbar=no,maximize=no,minimize=no,resize=no,width=500px,height=150px',callback);
}
function openConfirm(data)
{
	var feature='maximize=no,minimize=no,resize=no,width=500px,height=150px';
	if(data.feature)feature=feature+","+data.feature;
	_window.Confirm(data.content, data.title, feature,null,null,function(btn){
		if(btn=="OK")
		{
			if(data.ok)data.ok();
		}
		else if(btn=="CANCEL")
		{
			if(data.cancel)data.cancel();
		}

	});
}

function _openScreenDialog(content, title,feature)
{
	_window.Dialog(content, title, feature,null,_window.focusWindowId);
}
function _openWindowDialog(content, title,feature)
{
	 var parent=_window.parent;
	_window.Dialog(content, title, feature,parent,_window.focusWindowId);
}

function openDialog(url,title,isWindowDialog,width,height,feature)
{
	var w=width?width:570;
	var h=height?height:350;
	if(!feature)feature="";
	if(isWindowDialog==true)
	{
		//open a dialog whose parent is the xWindow's owner
		_openWindowDialog('[url]'+url, title ,'taskbar=no,maximize=no,minimize=no,width='+w+'px,height='+h+'px,minWidth='+w+',minHeight='+h+","+feature);
	}
	else
	{
		//open a dialog whose parent is the Body screen
		_openScreenDialog('[url]'+url, title ,'taskbar=no,maximize=no,minimize=no,width='+w+'px,height='+h+'px,minWidth='+w+',minHeight='+h+","+feature);
	}
}
function openOwneredDialog(url,title,owner,width,height)
{
	var w=width?width:570;
	var h=height?height:350;
	var win=_window.windows[_window.focusWindowId];
	_window.InnerDialog('[url]'+url, title ,'maximize=no,minimize=no,width='+w+'px,height='+h+'px,minWidth='+w+',minHeight='+h,win.contentCase,_window.focusWindowId);
}

/** 
in an opened lookuping dialog, send back values for its parent window's Input elements
feedback: return the selected values to the parent's Form
data:JSON data
formId:the data will be sent back to the named Form. If no form is defined, the data will be sent to the parent window
*/
function feedback(data,formId)
{
	var eleId="";
	var win;
	if(formId)eleId=formId;
	else 
	{
		win =_window.windows[_window.focusWindowId];
		eleId=win.parentWindowId;
	}
	$.each(data,function(n, v){
		//JQuery does not work for OGNL names
		var name=n.replace(/\./g,"\\.");
		//if(win)	
		$("#"+eleId).find(":input[name="+name+"]").val(v);
		//else document.forms[eleId][n].value=v;
	});
	if(win)win.Close();
}


function panelSearch(form,targetPanel,callback)
{
	$("#"+targetPanel).empty();
	loadContentToPanel(targetPanel,form.action,$(form).find(":input").serialize());
	if(callback)callback();
	return false;
}

/**
search result will be displayed in the same window
*/
function windowSearch(form,callback)
{
	var win =_window.windows[_window.getWindowId(form)];
	win.SetContent("[url]"+form.action,$(form).find(":input").serialize());
	if(callback)callback();
	return false;
}


function ajaxSubmit(form,callback)
{
		$.ajax({ 
			url: form.action, 
			//context: document.body, 
			data :   $(form).find(":input").serialize()  ,
			type:"post",
			dataType:"json",
			success: function(data){
				parseJsonResponse(data,null,form);
				if(callback)callback();

			},
			error: function(XMLHttpRequest, textStatus, errorThrown) 
			{
				var win =_window.windows[_window.focusWindowId];
				win.SetContent(XMLHttpRequest.responseText)
					/*
                        alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
						alert(XMLHttpRequest.responseText)
						*/
            }
	  });
		
	return false;
}

/**
	the result will be mapped to the target data grid
*/
function ajaxDatagridSubmit(form,targetGrid,callback)
{
		$.ajax({ 
			url: form.action, 
			//context: document.body, 
			data :   $(form).find(":input").serialize()  ,
			type:"post",
			dataType:"json",
			success: function(data){
				parseJsonResponse(data,targetGrid,form);
				if(callback)callback();

			},
			error: function(XMLHttpRequest, textStatus, errorThrown) 
			{
				var win =_window.windows[_window.focusWindowId];
				win.SetContent(XMLHttpRequest.responseText)
					/*
                        alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
						alert(XMLHttpRequest.responseText)
						*/
            }
	  });
		
	return false;
}

function datagridSearch(form,gridId,callback)
{
		if($("#"+gridId).attr("class")=="treegrid")$("#"+gridId).treegrid("search",form);
		else $("#"+gridId).datagrid("search",form);
		if(callback)callback();
		return false;
}

/**
	for "multipart/form-data" form,example:file upload
*/
function iframeCallback(form, targetGrid,callback){
	var $form = $(form), $iframe = $("#callbackframe");
	//if(!$form.valid()) {return false;}

	if ($iframe.size() == 0) {
		$iframe = $("<iframe id='callbackframe' name='callbackframe' src='about:blank' style='display:none'></iframe>").appendTo("body");
	}
	if(!form.ajax) {
		$form.append('<input type="hidden" name="ajax" value="1" />');
	}
	form.target = "callbackframe";
	
	_iframeResponse($iframe[0], targetGrid, callback );
}
function _iframeResponse(iframe,targetGrid, callback){
	var $iframe = $(iframe), $document = $(document);
	
	$document.trigger("ajaxStart");
	
	$iframe.bind("load", function(event){
		$iframe.unbind("load");
		$document.trigger("ajaxStop");
		
		if (iframe.src == "javascript:'%3Chtml%3E%3C/html%3E';" || // For Safari
			iframe.src == "javascript:'<html></html>';") { // For FF, IE
			return;
		}

		var doc = iframe.contentDocument || iframe.document;

		// fixing Opera 9.26,10.00
		if (doc.readyState && doc.readyState != 'complete') return; 
		// fixing Opera 9.64
		if (doc.body && doc.body.innerHTML == "false") return;
	   
		var response;
		
		if (doc.XMLDocument) {
			// response is a xml document Internet Explorer property
			response = doc.XMLDocument;
		} 
		else if (doc.body)
		{
			try
			{
				response = $iframe.contents().find("body").text();
				response = jQuery.parseJSON(response);
				if(callback)callback(response);
				else
				{
					parseJsonResponse(response,targetGrid);
					return true;
				}
			} catch (e){ // response is html document or plain text
				response = doc.body.innerHTML;
			}
		} else {
			// response is a xml document
			response = doc;
		}
		if(callback)callback(response);
		else
		{
			var win =_window.windows[_window.focusWindowId];
			win.SetContent(response)
			return true;
		}
		document.body.removeChild(iframe);
	});
}

/**
	"code":"200",
	"message":"",
	"forwardUrl":"",
	"refresh":"<%=targetPanel%>",
	"targetType":"self",
	"target":"",
	"callback":"",
	"action":""
*/

function parseJsonResponse(data,targetGrid,form)
{
	if(data.code=="200")
	{
		var win =_window.windows[_window.focusWindowId];
		if(data.message && data.message!=""){ openAlert(data.message,"Successful Message");}
		if(data.refresh && data.refresh!="")targetGrid=data.refresh;
		if(targetGrid)	
		{
			if($("#"+targetGrid).attr("class")=="treegrid")$("#"+targetGrid).treegrid("refresh")
			else $("#"+targetGrid).datagrid("refresh")
		}
		var target=data.target;
		if(target && target!="")
		{
			$("#"+target).empty();
			loadContentToPanel(target,data.forwardUrl,null);
		}
		else
		{
			if(data.targetType=="parent")
			{
				var parentWin=_window.windows[win.parentWindowId];
				if(data.forwardUrl && data.forwardUrl!="")parentWin.SetContent("[url]"+data.forwardUrl);
			}
			else //if(targetType=="self")
			{
				if(data.forwardUrl && data.forwardUrl!="")win.SetContent("[url]"+data.forwardUrl);
			}
		}
		if(data.callback && data.callback!="") eval(data.callback);
		if(data.action=="close")win.Close();
	}
	else if(data.code=="201")
	{
		//parse input error fields.
		
		var msg="";
		$.each(data.fields, function(i, row) {
			if(form)
			{
					field = form.elements[row.key];
					var error = row.value;
					addError(field, error);
			}
			else
			{
					msg+=row.keyText;
					msg+=":";
					msg+=row.value;
					msg+="<br>";
			}

		});
		if(msg!="")openAlert(msg,"Input Error");
	}
	else
	{
		 openAlert(data.message, "Error");
	}

}


function createEditTextarea(textareaEleId)
{
		tinymce.remove("#"+textareaEleId);
		//jQuery.getScript("win/editor/tinymce4/js/tinymce/jquery.tinymce.min.js", function(data, status, jqxhr) {});
		//jQuery.getScript("win/editor/tinymce4/js/tinymce/tinymce.min.js", function(data, status, jqxhr) {});
		$("#"+textareaEleId).tinymce({
		theme: "modern",
		plugins: [
						"advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
						"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
						"table contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker textpattern"
				 ],
		toolbar1: "newdocument fullpage | code preview | undo redo restoredraft | cut copy paste | searchreplace | ",
		toolbar2: "bold italic underline strikethrough | alignleft aligncenter alignright alignjustify | styleselect formatselect fontselect fontsizeselect | bullist numlist | outdent indent blockquote | link unlink anchor image media  | insertdatetime  | forecolor backcolor",
		toolbar3: "table | hr removeformat | subscript superscript | charmap emoticons | print | ltr rtl | spellchecker | visualchars visualblocks nonbreaking template pagebreak ",

		menubar: false,
		toolbar_items_size: 'small',
		font_formats:"黑体=黑体;宋体=宋体",
		//image_list:"jsp/Archive/image.json",//function(){alert("aaa")},//"/Album/AlbumList.action",
		image_advtab:true,
		image_list_src:"Album/FileList.action",
		style_formats: [
				{title: 'Bold text', inline: 'b'},
				{title: 'Red text', inline: 'span', styles: {color: '#ff0000'}},
				{title: 'Red header', block: 'h1', styles: {color: '#ff0000'}},
				{title: 'Example 1', inline: 'span', classes: 'example1'},
				{title: 'Example 2', inline: 'span', classes: 'example2'},
				{title: 'Table styles'},
				{title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
		],
		templates: [
			{title: 'Test template 1', content: 'Test 1'},
			{title: 'Test template 2', content: 'Test 2'}
		]
	});

}

function createSimpleEditTextarea(textareaEleId)
{
		//jQuery.getScript("win/editor/tinymce4/js/tinymce/jquery.tinymce.min.js", function(data, status, jqxhr) {});
		//jQuery.getScript("win/editor/tinymce4/js/tinymce/tinymce.min.js", function(data, status, jqxhr) {});
		tinymce.remove("#"+textareaEleId);
		$("#"+textareaEleId).tinymce({
		theme: "modern",
		plugins: [
						"advlist autolink autosave link image lists charmap print preview hr anchor pagebreak spellchecker",
						"searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
						"table contextmenu directionality emoticons template textcolor paste fullpage textcolor colorpicker textpattern"
				 ],
		toolbar1: "code | undo redo | bold italic underline | alignleft aligncenter alignright alignjustify |  fontsizeselect | bullist numlist | forecolor backcolor | table image",
		menubar: false,
		toolbar_items_size: 'small',
		image_advtab:true,
		image_list_src:"Album/FileList.action"
	});

}
