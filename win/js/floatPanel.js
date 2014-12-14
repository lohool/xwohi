//可以打包为js文件;
FloatPanel.x0=0;
FloatPanel.y0=0;
FloatPanel.x1=0;
FloatPanel.y1=0;
FloatPanel.offx=6;
FloatPanel.offy=6;
FloatPanel.moveable=false;
FloatPanel.hover='orange';
FloatPanel.normal='#D08011';//color;
FloatPanel.index=0;//z-FloatPanel.index;

//创建一个对象;
function FloatPanel(id,w,h,l,t,tit,msg)
{
       FloatPanel.index = FloatPanel.index+2;
       this.id      = id;
       this.width   = w;
       this.height  = h;
       this.left    = l;
       this.top     = t;
       this.zIndex  = FloatPanel.index;
       this.title   = tit;
       this.message = msg;
       this.obj     = null;
}

//开始拖动;
function startDrag(obj)
{
       if(event.button==1)
       {
               //锁定标题栏;
               obj.setCapture();
               //定义对象;
               var win = obj.parentNode;
               var sha = win.nextSibling;
               //记录鼠标和层位置;
               FloatPanel.x0 = event.clientX;
               FloatPanel.y0 = event.clientY;
               FloatPanel.x1 = parseInt(win.style.left);
               FloatPanel.y1 = parseInt(win.style.top);
               //记录颜色;
               FloatPanel.normal = obj.style.backgroundColor;
               //改变风格;
               obj.style.backgroundColor = FloatPanel.hover;
               win.style.borderColor = FloatPanel.hover;
               obj.nextSibling.style.color = FloatPanel.hover;
               sha.style.left = (FloatPanel.x1 + FloatPanel.offx)+"px";
               sha.style.top  = (FloatPanel.y1 + FloatPanel.offy)+"px";
               FloatPanel.moveable = true;
       }
}
//拖动;
function drag(obj)
{
       if(FloatPanel.moveable)
       {
               var win = obj.parentNode;
               var sha = win.nextSibling;
               win.style.left = (FloatPanel.x1 + event.clientX - FloatPanel.x0)+"px";
               win.style.top  = (FloatPanel.y1 + event.clientY - FloatPanel.y0)+"px";
               sha.style.left = (parseInt(win.style.left) + FloatPanel.offx)+"px";
               sha.style.top  = (parseInt(win.style.top) + FloatPanel.offy)+"px";
       }
}
//停止拖动;
function stopDrag(obj)
{
       if(FloatPanel.moveable)
       {
               var win = obj.parentNode;
               var sha = win.nextSibling;
               var msg = obj.nextSibling;
               win.style.borderColor     = FloatPanel.normal;
               obj.style.backgroundColor = FloatPanel.normal;
               msg.style.color           = FloatPanel.normal;
               sha.style.left = obj.parentNode.style.left;
               sha.style.top  = obj.parentNode.style.top;
               obj.releaseCapture();
               FloatPanel.moveable = false;
       }
}
//获得焦点;
function getFocus(obj)
{
       if(obj.style.zIndex!=FloatPanel.index)
       {
               FloatPanel.index = FloatPanel.index + 2;
               var idx = FloatPanel.index;
               obj.style.zIndex=idx;
               obj.nextSibling.style.zIndex=idx-1;
       }
}
//最小化;
function min(obj)
{
       var win = obj.parentNode.parentNode;
       var sha = win.nextSibling;
       var tit = obj.parentNode;
       var msg = tit.nextSibling;
       var flg = msg.style.display=="none";
       if(flg)
       {
               win.style.height  = (parseInt(msg.style.height) + parseInt(tit.style.height) + 3*2)+"px";
               sha.style.height  = win.style.height;
               msg.style.display = "block";
               obj.innerHTML = "0";
       }
       else
       {
               win.style.height  = (parseInt(tit.style.height) + 2*2)+"px";
               sha.style.height  = win.style.height;
               obj.innerHTML = "2";
               msg.style.display = "none";
       }
}
//关闭;
function cls(obj)
{
       var win = obj.parentNode.parentNode;
       var sha = win.nextSibling;
       win.style.visibility = "hidden";
       sha.style.visibility = "hidden";
}
//初始化;
 FloatPanel.prototype.build=function()
{
       var str = ""
               + "<div id=xMsg" + this.id + " "
               + "style='"
               + "z-index:" + this.zIndex + ";"
               + "width:" + this.width + "px;"
               + "height:" + this.height + "px;"
               + "left:" + this.left + "px;"
               + "top:" + this.top + "px;"
               + "background-color:" + FloatPanel.normal + ";"
               + "color:" + FloatPanel.normal + ";"
               + "font-size:10px;"
               + "font-family:Verdana;"
               + "position:absolute;"
               + "cursor:default;"
               + "border:2px solid " + FloatPanel.normal + ";"
               + "' "
               + "onmousedown='getFocus(this)'>"
                       + "<div "
                       + "style='"
                       + "background-color:" + FloatPanel.normal + ";"
                       + "width:" + (this.width) + "px;"
                       + "height:20px;"
                       + "color:white;"
                       + "' "
                       + "onmousedown='startDrag(this)' "
                       + "onmouseup='stopDrag(this)' "
                       + "onmousemove='drag(this)' "
                       + "ondblclick='min(this.childNodes[1])'"
                       + ">"
                               + "<span style='position:relative;float:left;width:" + (this.width-2*12-24) + "px;padding-left:3px;'>" + this.title + "</span>"
                               //+ "<span style='position:relative;float:right;width:12px;top:0px;border-width:0px;color:white;font-family:webdings;' onclick='cls(this)'>r</span>"
                               + "<span style='position:relative;float:right;width:12px;top:0px;border-width:1px;color:white;font-family:webdings;' onclick='min(this)'>0</span>"
                       + "</div>"
                               + "<div style='"
							   + "width:" + (this.width-3*2) + "px;"
                               + "height:" + (this.height-20-6) + "px;"
                               + "background-color:white;"
                               + "line-height:14px;"
                               + "word-break:break-all;"
                               + "padding:3px;"
                               + "'>" + this.message + "</div>"
               + "</div>"
               + "<div style='"
               + "width:" + this.width + "px;"
               + "height:" + this.height + "px;"
               + "top:" + (this.top) + "px;"
               + "left:" + (this.left) + "px;"
               + "z-index:" + (this.zIndex-2) + ";"
               + "position:absolute;"
               + "background-color:black;"
               + "filter:alpha(opacity=40);"
               + "'>by lohool";
			   var parentId="MainFrame";
			   var parent=document.getElementById("MainFrame");
			   if(!parent)parent=document.body;
				parent.insertAdjacentHTML("beforeEnd",str);
}
 FloatPanel.open=function(title,content)
{
    var panel= new FloatPanel("1",500,200,300,300,title,content);
	panel.build();
	return panel;
}

