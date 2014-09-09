
function dragSelected(dragObj)
{
	dragObj.selected="true";
	dragObj.cssName="drag-selected";
}

function dragStart(dragObj)
{        
		var parent=dragObj.parentNode;

        if(!document.getElementById("moveDiv"))
        {                    
                document.body.insertAdjacentHTML('beforeEnd','<div id="moveDiv" style="display:none;position:absolute;left:354px; top:17px; height: 18px; filter:Alpha(opacity=60);" ></div>')
        }
        imgX=event.offsetX;//-parseInt(dragObj.style.left);
        imgY=event.offsetY;//-parseInt(dragObj.style.top);
		//alert(event.offsetX+";"+imgX+":"+imgY);
        //$(moveDiv).style.left=(event.offsetX-imgX+20)+"px";    
        //$(moveDiv).style.left=dragObj.style.left;        
        $(moveDiv).style.left=parseInt(dragObj.style.left)+parseInt(parent.style.left);      
        //$(moveDiv).style.top=(event.offsetY-imgY+5)+"px";        
        //$(moveDiv).style.top=dragObj.style.top;        
        $(moveDiv).style.top=parseInt(dragObj.style.top)+parseInt(parent.style.top);      
        $(moveDiv).style.display=""
        $(moveDiv).innerHTML=dragObj.innerHTML
        BeginDrag($(moveDiv),event,parent)
		if(document.attachEvent) 
		{ //IE5+ 的事件模型
        document.attachEvent("onmouseup",dragEnd);
		}

        //我们处理了该事件,不要再让其他元素看见.
        if(event.stopPropagation) event.stopPropagation(); //2 级DOM
        else event.cancelBubble=true;        //IE
        
        //下面禁止执行默认动作
        if(event.preventDefault) event.preventDefault();  //2级DOM
        else event.returnValue=false;        //IE
        function dragEnd()
        {        
                dragObj.style.left=event.clientX-parseInt(parent.style.left)-imgX;        
                dragObj.style.top=event.clientY-parseInt(parent.style.top)-imgY;
                $(moveDiv).style.display="none"
                 document.detachEvent("onmouseup",dragEnd);
                         //不要再让事件进一步传播.
                if(event.stopPropagation) event.stopPropagation();  //2级DOM
                else event.cancelBubble=true;        //IE
        }
}
//拖动
function BeginDrag(elementToDrag,event,parent)  {

        //计算元素原左上角与鼠标的距离
        //moveHandler要这值

        var delatX=event.clientX-parseInt(elementToDrag.style.left)+parseInt(parent.style.left);
        //alert(event.offsetX+":"+parseInt(elementToDrag.style.left)+":"+parseInt(parent.style.left));
		//	alert(delatX);
        var delatY=event.clientY-parseInt(elementToDrag.style.top)+parseInt(parent.style.top);
        //注册响应mousemove和mousedown事件后的mouseup事件的处理程序

        if(document.addEventListener) {  //2级DOM事件模型
        //注册捕捉事件处理程序。
        document.addEventListener("mousemove",moveHandler,true);
        document.addEventListener("mouseup",upHandler,true);
        }
        else if(document.attachEvent) { //IE5+ 的事件模型
        //在IE事件模型中，我们不能捕捉事件，所以只有当事件起泡到这些处理程序时,
        //它们才被触发. 假设不存在干涉元素, 处理了事件后它们就停止传播
        document.attachEvent("onmousemove",moveHandler);
        document.attachEvent("onmouseup",upHandler);
        }
        else { //IE4事件模型
        //IE4我们不能使用attachEvent方法,所以存储了以前赋予的处理
        //程序后,直接赋予新的事件处理程序,这样可以恢复旧的处理程序.
        //注意,这样依赖于事件起泡.
        var oldmovehandler=document.onmousemove;
        var olduphandler=document.onmouseup;
        document.onmousemove=moveHandler;
        document.onmouseup=upHandler;
        }

        //我们处理了该事件,不要再让其他元素看见.
        if(event.stopPropagation) event.stopPropagation(); //2 级DOM
        else event.cancelBubble=true;        //IE
        
        //下面禁止执行默认动作
        if(event.preventDefault) event.preventDefault();  //2级DOM
        else event.returnValue=false;        //IE

        /*  这是元素被拖动时捕捉mousemove事件的处理程序.
         *  它负责移动元素
         */
        
        function moveHandler(e)  {
        if(!e) e=window.event;        //IE事件模型;
        //把元素移动到鼠标当前的位置,根据初始鼠标点击的偏移量进行调整
        //alert(delatX)
        //alert(e.offsetX)
		//alert(e.offsetX-delatX)
        elementToDrag.style.left=(e.clientX-delatX+parseInt(parent.style.left))+"px";
        elementToDrag.style.top=(e.clientY-delatY+parseInt(parent.style.top))+"px";
		//alert(elementToDrag.style.left+":"+elementToDrag.style.top);
        //window.status=e.clientX;//delatX+":"+delatY+";"+elementToDrag.style.left+":"+elementToDrag.style.top;

        //不要再让其他元素看到该事件.
        if(e.stopPropagation) e.stopPropagation();  //2级DOM
        else e.cancelBubble=true;        //IE
        }

        /*  这是捕捉拖移结束最后发生的mouseup事件的处理程序.
         */
        function upHandler(e) {
        if(!e) e=window.event;        //IE事件模型.
        //注销捕捉事件程序.
        if(document.removeEventListener) {        //DOM事件模型
        document.removeEventListener("mouseup",upHandler,true);
        document.removeEventListener("mousemove",moveHandler,true);        
        }
        else if(document.detachEvent) {        //IE5+ 事件模型
        document.detachEvent("onmouseup",upHandler);
        document.detachEvent("onmousemove",moveHandler);
        }
        else  {        //IE事件模型
        document.onmouseup=olduphandler;
        document.onousemove=oldmovehandler;
        }
        //不要再让事件进一步传播.
        if(e.stopPropagation) e.stopPropagation();  //2级DOM
        else e.cancelBubble=true;        //IE
          }        
}
function $() {
  var elements = new Array();
  
  for (var i = 0; i < arguments.length; i++) {
    var element = arguments[i];
    if (typeof(element)== 'string')
      element = document.getElementById(element);

    if (arguments.length == 1) 
      return element;
      
    elements.push(element);
  }  
  return elements;
}
