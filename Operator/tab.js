
  
// Global vars to hold the object in the panel.
tabPanelArray = new Array(3);
tabMenuArray = new Array(3);
currentMenuIndex = 0;

/**
 * This MUST be called on page load to fill up the shared global values.
 * Having the panes object accessible by index makes things easier.
 * This is also a good place to display the first page.
 */
function bodyOnLoad()
   {
   tabPanelArray[0] = getItemObj('tabPane0');
   tabPanelArray[1] = getItemObj('tabPane1');
   //tabPanelArray[2] = getItemObj('tabPane2');

   tabMenuArray[0] = getItemObj('tabMenu0');
   tabMenuArray[1] = getItemObj('tabMenu1');
   //tabMenuArray[2] = getItemObj('tabMenu2');

   raisePanel ( currentMenuIndex );
   }

/**
 * Utility function just to show an error if I try to get non existen objects
 */
function getItemObj ( itemId )
   {
   obj = document.getElementById(itemId);

   if ( obj == null ) alert('Script Error: id='+itemId+' does not exist');

   return obj;
   }


/**
 * raising a panel means setting all the other panels to a lower level
 * and setting the raided panel to a higher level
 * note that also the size must be set correctly !
 * to activate a menu i switch the class between active and not active.
 */
function raisePanel ( panelIndex )
   {
   for (index=0; index<2; index++ )
      {
      // the panel with the index == wantedIndex gets raised.
		 target=tabPanelArray[index];
      if (index == panelIndex )
         {
         raiseObject (target, 4);
         tabMenuArray[index].className = 'tabMenuActive';
		 if(target.src && target.src!="")
		{
			http(target.src,new showTabContent(target));
			target.src="";
		}
         }
      else
         {
         raiseObject (target, 2);
         tabMenuArray[index].className = 'tabMenu';
         }
      }

   currentMenuIndex=panelIndex;

   return true;
   }

   function showTabContent(target)
   {
		this.content="";
		this.execute=function()
		{
   			target.innerHTML=this.content;
		}

   }

/**
 * When I raise a panel I may as well check for the correct size and fix it.
 * it is a bit of doubling work, but it does not happens often !
 */
function raiseObject ( target, level )
   {
   /* the number of pixels we shave to the outside filler to fit everything in
    * this value depends on the border set for the filler div and possible padding
    * it is best to experiment a bit with it.
    */
   safeMargin = 6;

   // the size of the panels depends on the size of the tabFiller
   obj = getItemObj('tabFiller');

   newWidth = obj.offsetWidth - safeMargin;

   if ( newWidth < safeMargin ) newWidth = safeMargin;
   target.style.width = newWidth+'px';

   newHeight =obj.offsetHeight - safeMargin;
   if ( newHeight < safeMargin ) newHeight = safeMargin;
   target.style.height = newHeight+'px';
	
   // setting the z-index last should optimize possible resize.
   target.style.zIndex=level;
   }

/**
 * When we mouse out of the span we restore the class to the default value
 * But this only if we are not over the current selected menu
 */
function mouseOut ( menuIndex )
   {
   if ( menuIndex == currentMenuIndex ) return true;

   tabMenuArray[menuIndex].className = 'tabMenu';
   }

/**
 * When we mouse over of the span we set the class of the span to the over one
 * But this only if we are not over the current selected menu
 */
function mouseOver ( menuIndex )
   {
   if ( menuIndex == currentMenuIndex ) return true;

   tabMenuArray[menuIndex].className = 'tabMenuOver';
   }



function http(url,method){ 
   var xmlHttp ;
    // if (window.ActionXObject)//判断浏览器的兼容性
     {
         xmlHttp =new ActiveXObject("Microsoft.XMLHTTP");  /*IE浏览器创建异步对象的方法*/
     }
     //else if (window.XMLHttpRequest) {
     //    xmlHttp = new XMLHttpRequest(); /*标准的DOM中创建异步对象的方法*/
     //}

   xmlHttp.Open("GET",url, true); //true 异步; false 同步

   xmlHttp.setRequestHeader("Content-Type","text/html"); 
   xmlHttp.setRequestHeader("Cache-Control","no-cache"); 


  xmlHttp.onreadystatechange = function() //onreadystatechange事件判断异步对象与服务器之间交互的状态，当服务器的交互状态变化时调用该函数
     {
         if (xmlHttp.readyState == 4 && xmlHttp.status == 200) //xmlHttp.readyState == 4表示与服务器交互的状态是否成功，xmlHttp.status == 200表示服务器的准备状态
         {
             	//alert("hello");
				//var m;
				//alert("m= new "+method);
				//eval("m= new "+method);
				method.content= xmlHttp.responseText;
				method.execute();
			 //return xmlHttp.responseText;

         }
     }


   //var dom = new ActiveXObject("Microsoft.XMLDOM") 
   xmlHttp.Send(url); 
   //dom.async=false //设置为同步方式获取数据 
   //dom.loadXML(http.responseXML) ;
} 


