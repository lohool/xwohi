
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
		{ //IE5+ ���¼�ģ��
        document.attachEvent("onmouseup",dragEnd);
		}

        //���Ǵ����˸��¼�,��Ҫ��������Ԫ�ؿ���.
        if(event.stopPropagation) event.stopPropagation(); //2 ��DOM
        else event.cancelBubble=true;        //IE
        
        //�����ִֹ��Ĭ�϶���
        if(event.preventDefault) event.preventDefault();  //2��DOM
        else event.returnValue=false;        //IE
        function dragEnd()
        {        
                dragObj.style.left=event.clientX-parseInt(parent.style.left)-imgX;        
                dragObj.style.top=event.clientY-parseInt(parent.style.top)-imgY;
                $(moveDiv).style.display="none"
                 document.detachEvent("onmouseup",dragEnd);
                         //��Ҫ�����¼���һ������.
                if(event.stopPropagation) event.stopPropagation();  //2��DOM
                else event.cancelBubble=true;        //IE
        }
}
//�϶�
function BeginDrag(elementToDrag,event,parent)  {

        //����Ԫ��ԭ���Ͻ������ľ���
        //moveHandlerҪ��ֵ

        var delatX=event.clientX-parseInt(elementToDrag.style.left)+parseInt(parent.style.left);
        //alert(event.offsetX+":"+parseInt(elementToDrag.style.left)+":"+parseInt(parent.style.left));
		//	alert(delatX);
        var delatY=event.clientY-parseInt(elementToDrag.style.top)+parseInt(parent.style.top);
        //ע����Ӧmousemove��mousedown�¼����mouseup�¼��Ĵ������

        if(document.addEventListener) {  //2��DOM�¼�ģ��
        //ע�Ჶ׽�¼��������
        document.addEventListener("mousemove",moveHandler,true);
        document.addEventListener("mouseup",upHandler,true);
        }
        else if(document.attachEvent) { //IE5+ ���¼�ģ��
        //��IE�¼�ģ���У����ǲ��ܲ�׽�¼�������ֻ�е��¼����ݵ���Щ�������ʱ,
        //���ǲű�����. ���費���ڸ���Ԫ��, �������¼������Ǿ�ֹͣ����
        document.attachEvent("onmousemove",moveHandler);
        document.attachEvent("onmouseup",upHandler);
        }
        else { //IE4�¼�ģ��
        //IE4���ǲ���ʹ��attachEvent����,���Դ洢����ǰ����Ĵ���
        //�����,ֱ�Ӹ����µ��¼��������,�������Իָ��ɵĴ������.
        //ע��,�����������¼�����.
        var oldmovehandler=document.onmousemove;
        var olduphandler=document.onmouseup;
        document.onmousemove=moveHandler;
        document.onmouseup=upHandler;
        }

        //���Ǵ����˸��¼�,��Ҫ��������Ԫ�ؿ���.
        if(event.stopPropagation) event.stopPropagation(); //2 ��DOM
        else event.cancelBubble=true;        //IE
        
        //�����ִֹ��Ĭ�϶���
        if(event.preventDefault) event.preventDefault();  //2��DOM
        else event.returnValue=false;        //IE

        /*  ����Ԫ�ر��϶�ʱ��׽mousemove�¼��Ĵ������.
         *  �������ƶ�Ԫ��
         */
        
        function moveHandler(e)  {
        if(!e) e=window.event;        //IE�¼�ģ��;
        //��Ԫ���ƶ�����굱ǰ��λ��,���ݳ�ʼ�������ƫ�������е���
        //alert(delatX)
        //alert(e.offsetX)
		//alert(e.offsetX-delatX)
        elementToDrag.style.left=(e.clientX-delatX+parseInt(parent.style.left))+"px";
        elementToDrag.style.top=(e.clientY-delatY+parseInt(parent.style.top))+"px";
		//alert(elementToDrag.style.left+":"+elementToDrag.style.top);
        //window.status=e.clientX;//delatX+":"+delatY+";"+elementToDrag.style.left+":"+elementToDrag.style.top;

        //��Ҫ��������Ԫ�ؿ������¼�.
        if(e.stopPropagation) e.stopPropagation();  //2��DOM
        else e.cancelBubble=true;        //IE
        }

        /*  ���ǲ�׽���ƽ����������mouseup�¼��Ĵ������.
         */
        function upHandler(e) {
        if(!e) e=window.event;        //IE�¼�ģ��.
        //ע����׽�¼�����.
        if(document.removeEventListener) {        //DOM�¼�ģ��
        document.removeEventListener("mouseup",upHandler,true);
        document.removeEventListener("mousemove",moveHandler,true);        
        }
        else if(document.detachEvent) {        //IE5+ �¼�ģ��
        document.detachEvent("onmouseup",upHandler);
        document.detachEvent("onmousemove",moveHandler);
        }
        else  {        //IE�¼�ģ��
        document.onmouseup=olduphandler;
        document.onousemove=oldmovehandler;
        }
        //��Ҫ�����¼���һ������.
        if(e.stopPropagation) e.stopPropagation();  //2��DOM
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
