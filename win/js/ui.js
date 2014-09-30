function GetIeVersion()
{
    var reg = new RegExp("MSIE ([^;]*);", "i");
    if (reg.test(navigator.appVersion)) return parseInt(RegExp.$1);
    return 0;
}

function setCookie(name, value, expires, path, domain, secure){
	var strCookie = name + "=" + value;
	if (expires){
		var dtmNow = new Date();
		dtmNow.setTime(dtmNow.getTime() + expires*24*60*60*1000);
		strCookie += "; expires=" + dtmNow.toGMTString();
	}
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

function UseVistaInIE6(obj)
{
	var s = obj.button ? "_BY_BUTTON" : "";
	obj.sides[0].style.cssText += ";filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/vista/LEFT_TOP.png', sizingMethod='scale');background-image:url('images/vista/LEFT_TOP.png') !important;background-image:none;";
	obj.sides[1].style.cssText += ";filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/vista/TOP.png', sizingMethod='scale');background-image:url('images/vista/TOP.png') !important;background-image:none;";
	obj.sides[2].style.cssText += ";filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/vista/RIGHT_TOP.png', sizingMethod='scale');background-image:url('images/vista/RIGHT_TOP.png') !important;background-image:none;";
	obj.sides[3].style.cssText += ";filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/vista/RIGHT.png', sizingMethod='scale');background-image:url('images/vista/RIGHT.png') !important;background-image:none;";
	obj.sides[4].style.cssText += ";filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/vista/RIGHT_BOTTOM.png', sizingMethod='scale');background-image:url('images/vista/RIGHT_BOTTOM.png') !important;background-image:none;";
	obj.sides[5].style.cssText += ";filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/vista/BOTTOM" + s + ".png', sizingMethod='scale');background-image:url('images/vista/BOTTOM.png') !important;background-image:none;";
	obj.sides[6].style.cssText += ";filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/vista/LEFT_BOTTOM.png', sizingMethod='scale');background-image:url('images/vista/LEFT_BOTTOM.png') !important;background-image:none;";
	obj.sides[7].style.cssText += ";filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='images/vista/LEFT.png', sizingMethod='scale');background-image:url('images/vista/LEFT.png') !important;background-image:none;";
}

var windows = new Array();
windows["Works"]       = { object:null, type:0, title:"terrence作品", features:"move=no,resize=no,left=0,top=300,width=305,height=-1", x:0, y:0 };
windows["UpLoadClass"] = { object:null, type:0, title:"terrence  无组件上传类", features:"height=-1", x:335, y:parseInt(Math.random() * 300) };
windows["FonshenASP"]  = { object:null, type:0, title:"terrence 上传组件", features:"height=-1", x:335, y:parseInt(Math.random() * 300) };
windows["ListPager"]   = { object:null, type:0, title:"terrence  列表分页类", features:"height=-1", x:335, y:parseInt(Math.random() * 300) };
windows["MenuTree"]    = { object:null, type:0, title:"terrence JS 菜单树", features:"height=-1", x:335, y:parseInt(Math.random() * 300) };
windows["FlcSelect"]   = { object:null, type:0, title:"terrence无限级联下拉列表/菜单", features:"height=-1", x:335, y:parseInt(Math.random() * 300) };
windows["FbaFrameset"] = { object:null, type:0, title:"terrence后台管理框架集", features:"height=-1", x:335, y:parseInt(Math.random() * 300) };
windows["Others"]      = { object:null, type:0, title:"terrence日期时间选择器及其它", features:"height=-1", x:335, y:parseInt(Math.random() * 300) };
windows["Option"]      = { object:null, type:2, title:"选项", features:"isModal=yea,width=360,height=-1,button=OK|CANCEL", x:335, y:parseInt(Math.random() * 300) };
windows["Welcome"]     = { object:null, type:2, title:"欢迎光临", features:"isModal=yes,width=380,height=-1,button=OK|CANCEL", x:335, y:parseInt(Math.random() * 300) };
windows["url"]         = { object:null, type:0, title:"", features:"move=move-x,resize=resize-y,width=802,height=" + (document.documentElement.scrollHeight - 56), x:170, y:0 };
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

var dialog, contents, titles;
function NewWindow()
{
	contents = new Array("[id]step1","[id]step2");
	titles = new Array("测试步骤1", "测试步骤2", "完成");
	dialog = _window.Open(contents[0], titles[0], "isModal=yes,button=HELP|BACK|NEXT|OK|CANCEL,class=NOKIA,width=420,height=200");
	dialog.DisableButton("BACK","DISABLED2");
	if(!dialog.form.agree.checked) dialog.DisableButton("NEXT");
	dialog.DisableButton("OK");
	
	dialog.OnHELP = function()
	{
		_window.Alert("[id]AboutWindow", "关于terrence JS 窗口", "isModal=yes,width=360,height=180,right=100,top=100");
	}

	var yourname,yoursign;
	var NextToStep02 = function()
	{
		yourname = dialog.form.yourname.value;
		if(yourname == '')
		{
			alert("请先输入您的姓名！");
			dialog.form.yourname.focus();
			dialog.step--;
			return false;
		}
		dialog.SetContent(contents[1]);
		dialog.SetTitle(titles[1]);
		dialog.DisableButton("NEXT");
		dialog.EnableButton("BACK");
		if(dialog.form.yoursign.value!='')dialog.EnableButton("OK");
	}
	var BackToStep01 = function()
	{
		dialog.SetContent(contents[0]);
		dialog.SetTitle(titles[0]);
		dialog.EnableButton("NEXT");
		dialog.DisableButton("OK");
		dialog.DisableButton("BACK");
	}
	dialog.OnNEXTS = new Array(NextToStep02);
	dialog.OnBACKS = new Array(BackToStep01);
	dialog.OnOK = function()
	{
		yoursign = dialog.form.yoursign.value;
		dialog.SetContent("Your Name is:" + yourname + "<br />Your Sign is:" + yoursign + "<br /><p>简单测试结束</p>");
		dialog.SetTitle(titles[2]);
		dialog.DisableButton("BACK","DISABLED2");
		dialog.DisableButton("NEXT","DISABLED2");
		dialog.DisableButton("CANCEL");
		dialog.OnOK = dialog.Close;
	}	
}
function WindowInit()
{
	_window.ClassName = getCookie("WindowStyle") || "BLUE";
	_window.Timer = parseInt(getCookie("WindowTimer") || 10);
	_window.parent=document.getElementById("MainFrame");
	_window.Width = 600;
}
//openNamedWindows("Welcome");

function openWindow(content, title, feature)
{
	_window.Open(content, title, feature,_window.parent);
}
/**
callback: example:function(btn){if(btn=="OK"){alert("OK");}}
*/
function openAlertWindow(content, title, feature,callback)
{
	_window.Alert(content, title, feature,null,null,callback);
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

function openWorkWindow(url,title,icon)
{
	if(!icon)icon="";
	openWindow('[url]'+url, title, 'move=yes,resize=yes,width=500px,height=300,icon='+icon);
}
function openDialog(url,title,isFullScreenDialog,width,height)
{
	var w=width?width:470;
	var h=height?height:350;
	if(isFullScreenDialog==true)
	{
		_openWindowDialog('[url]'+url, title ,'maximize=no,minimize=no,width='+w+'px,height='+h+'px,minWidth='+w+',minHeight='+h);
	}
	else
	{
		_openScreenDialog('[url]'+url, title ,'maximize=no,minimize=no,width='+w+'px,height='+h+'px,minWidth='+w+',minHeight='+h);
	}
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
	if(formId)eldId=formId;
	else 
	{
		win =_window.windows[_window.focusWindowId];
		eleId=win.parentWindowId;
	}
	$.each(data,function(n, v){
		$("#"+eleId).find(":input[name="+n+"]").val(v);
	});
	if(win)win.Close();
}


function openAlert(content,title,callback)
{
	openAlertWindow(content, title, 'maximize=no,minimize=no,resize=no,width=400px,height=150px',callback);
}


function sumbitAjaxForm(form,targetGrid)
{
		$.ajax({ 
			url: form.action, 
			//context: document.body, 
			data :   $(form).find(":input").serialize()  ,
			type:"post",
			dataType:"json",
			success: function(data){
				parseJsonResponse(data,targetGrid)

			},
			error: function(XMLHttpRequest, textStatus, errorThrown) 
			{
				//$('#'+id).html(xhr.responseText);
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

function submitForm(form,targetPanel)
{
	if(targetPanel)
	{
		$("#"+targetPanel).empty();
		//$("#"+target).load(form.action,$(form).find(":input").serialize(),function(){reDefineHTMLActions(target)});
		loadContentToPanel(targetPanel,form.action,$(form).find(":input").serialize());
	}
	else
	{
		var win =_window.windows[_window.focusWindowId];
		win.SetContent("[url]"+form.action,$(form).find(":input").serialize());
	}
		return false;
}
function submitGridForm(form,gridId)
{
		$("#"+gridId).datagrid("search",form);
		return false;
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

function parseJsonResponse(data,targetGrid)
{
	if(data.code=="200")
	{
		var win =_window.windows[_window.focusWindowId];
		if(data.message && data.message!=""){ openAlert(data.message,"Successful Message");}
		if(data.refresh && data.refresh!="")targetGrid=data.refresh;
		if(targetGrid)	{$("#"+targetGrid).datagrid("refresh")}
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
	else
	{
		 openAlert(data.message, "Error");
	}

}

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
			//alert(response)
			return true;
		}
		//document.body.removeChild(iframe);
	});
}
