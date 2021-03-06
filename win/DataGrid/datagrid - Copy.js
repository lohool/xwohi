 (function($) { 
$.fn.datagrid= function (options){
	var defaults=
	{
	callname : "dhdg",
	width : 0,
	_width : 0,
	height : 0,
	_height : 0,
	rid : "datagrid",
	multiple : false,
	toolbar:[],
	columns : [],
	colwidth : [],
	data : [],
	dblclick_fun : function(){},
	contextmenu_fun : function(){},
	parentNode : document.body,
	 dh : this,
	 framediv : null,
	 zerobj : null,
	 leftobj : null,
	 titleobj : null,
	 dataobj : null,
	 hbar : null,
	 vbar : null,
	 bgbar : null,
	 pager: null,
	 pageObj: null,
	 editable:false,
	 isMSIE : true,

	//改变列宽初始位置
	 ml : 0,
	//改变列宽对象初始宽度
	 ow : 0,
	//改变列宽对象
	 tdobj : null,
	//当前选定行索引
	 nowrow : null,
	//是否更改垂直滚动条位置
	 changeposv : true
	}
	defaults.rid=$(this).attr("id");

	defaults.isMSIE =navigator.appName == "Microsoft Internet Explorer";
    var opts = $.extend({}, defaults, options); 
	$.fn.datagrid.config =opts;
    $(this).data("options",opts);

	    return this.each(function(i) {     
			var sw=$(this).width();
			var sh=$(this).height();
			
			//init the size of the grad
			if(opts.width==0)opts._width=sw;
            else if((""+opts.width).indexOf("%")>0)
			{
				opts._width=sw * opts.width.substring(0,(""+opts.width).indexOf('%'))/100;
			}
			else
			{
				opts._width=opts.width;
			}

			if(opts.height==0)opts._height=sh;
            else if((""+opts.height).indexOf("%")>0)
			{
				opts._height=sh * opts.height.substring(0,(""+opts.height).indexOf('%'))/100;
			}
			else
			{
				opts._height=opts.height;
			}

			$(this).css("width",opts._width);
			$(this).css("height",opts._height);


			if(opts.url)
			{
				$.fn.datagrid.loadData($(this),opts);
			}
			else 
				$.fn.datagrid.init($(this),opts);
			


		});
		

}
	//全选
	$.fn.datagrid.selectall = function(checked){
		var objbox = document.getElementsByName("dhdgchkbox");
		var objboxl = objbox.length;
		for(var i=0;i<objboxl;i++){
			objbox[i].checked = checked;
		}
	}
	function gen_toolbar(opts)
	 {
		if(opts.toolbar.length==0)return null;
		var bar = "<div class='toolbar'>";
		for(i in opts.toolbar)
		 {
			if(opts.toolbar[i].text=="Separator")bar+="<span  class=\""+opts.toolbar[i].text+"\" />";
			else bar+="<a  class=\""+opts.toolbar[i].text+"\" btnIndex='"+i+"'>"+"</a>";
		 }

		bar+="</div>";
		return bar;

	 }
	$.fn.datagrid.init = function($this,opts){
		//var $this=$(this);
			$this.css("width",opts._width);
			$this.css("height",opts._height);
		//init the data 初始数据
		var dgc = "";
		var avgw = opts._width-20
		avgw = Math.floor(avgw/opts.columns.length);
		if(opts.columns.length>0){
			//dgc = '<thead><tr><td class="firstcolumn">&nbsp;</td>';
			dgc = '<thead><tr class="title">';
			/*
			if(opts.multiple){
				dgc += '<td class="column" style="width:30px;text-align:center;padding:0;text-indent:0;text-align:center;"><input id="selectAll" type="checkbox" style="margin:0;" ></td>';
			}
			*/
			for(var cc=0;cc<opts.columns.length;cc++){
				if(opts.colwidth.length>cc){
					dgc += '<td class="column" width="'+opts.colwidth[cc]+'"  >'+opts.columns[cc]+'<span class="arrow"></span></td>';
				}else{
					dgc += '<td class="column" width="'+avgw+'" >'+opts.columns[cc]+'<span class="arrow"></span></td>';
					//dgc += '<td class="column" >'+opts.columns[cc]+'<span class="arrow"></span></td>';
				}
			}
			dgc += '<td class="lastcolumn" width="10">&nbsp;</td></tr></thead>';
		}

		var dgs = "";
		var dgd = "";
		
		if(opts.data.length>0){
			//第一列
			dgs = '<tr><td>&nbsp;</td></tr>';
			dgd="<tbody>";
			
			for(var r=0;r<opts.data.length;r++){
				dgs += '<tr rel='+r+'><td>'+(r+1)+'</td></tr>';
				//dgd += '<tr onmouseover="'+opts.callname+'.dataover(opts);" onmouseout="'+opts.callname+'.dataout(opts);" ondblclick="'+opts.callname+'.dblclick_fun(opts);" oncontextmenu="'+opts.callname+'.contextmenu_fun(opts,event);"><td class="firstcolumn">&nbsp;</td>';
				//dgd += '<tr ><td class="firstcolumn">&nbsp;</td>';
				dgd += '<tr rowid='+r+'>';
				/*
				if(opts.multiple){
					dgd += '<td style="width:30px;text-align:center;overflow:hidden;padding:0;text-align:center;"><input type="checkbox" style="margin:0;" name="dhdgchkbox"></td>';
				}
				*/
				//only show the data with columns
				//for(var c=0;c<opts.data[r].length;c++){
				for(var c=0;c<opts.columns.length;c++){
					if(opts.colwidth.length>c){
						//alert(opts.colwidth[c])
						//alert(opts.data[r])
						dgd += '<td width="'+opts.colwidth[c]+'">'+opts.data[r][c]+'</td>';
						//dgd += '<td width="'+opts.colwidth[c]+'"><input value="'+opts.data[r][c]+'"></td>';
					}else{
						dgd += '<td width="'+avgw+'">'+opts.data[r][c]+'</td>';
						//dgd += '<td>'+opts.data[r][c]+'</td>';
					}
				}
				dgd += '<td class="lastdata" width="10">&nbsp;</td></tr>';
			}
			dgd+="</tbody>";
			if(dgc==""){
				//dgc = '<thead>';
				dgc = '<thead><tr><td class="firstcolumn">&nbsp;</td>';
				/*
				if(opts.multiple){
					dgc += '<td class="column title" style="width:30px;text-align:center;padding:0;text-indent:0;text-align:center;"><input type="checkbox" style="margin:0;" onclick="'+opts.callname+'.selectall(opts.checked);"></td>';
				}
				*/
				for(var dc=0;dc<opts.columns.length;dc++){
					if(opts.colwidth.length>dc){
						dgc += '<td class="column title" width="'+opts.colwidth[dc]+'" onmouseover="'+opts.callname+'.over(opts);" onmouseout="'+opts.callname+'.out(opts);" onmousemove="'+opts.callname+'.cc(event,opts);" onmousedown="'+opts.callname+'.rsc_d(event,opts);" onmouseup="'+opts.callname+'.mouseup(opts);">Expr'+(dc+1)+'<span class="arrow"></span></td>';
					}else{
						dgc += '<td class="column title" width="'+avgw+'" onmouseover="'+opts.callname+'.over(opts);" onmouseout="'+opts.callname+'.out(opts);" onmousemove="'+opts.callname+'.cc(event,opts);" onmousedown="'+opts.callname+'.rsc_d(event,opts);" onmouseup="'+opts.callname+'.mouseup(opts);">Expr'+(dc+1)+'<span class="arrow"></span></td>';
						//dgc += '<td class="column title" onmouseover="'+opts.callname+'.over(opts);" onmouseout="'+opts.callname+'.out(opts);" onmousemove="'+opts.callname+'.cc(event,opts);" onmousedown="'+opts.callname+'.rsc_d(event,opts);" onmouseup="'+opts.callname+'.mouseup(opts);">Expr'+(dc+1)+'<span class="arrow"></span></td>';
					}
				}
				dgc += '<td class="lastcolumn">&nbsp;</td></tr></thead>';
			}
		}
		var pager=null;
		//if(opts.pager!=null)opts.pageObj=$(paginate(opts.pager.current_page*opts.pager.pagesize,opts.pager.pagesize,opts.pager.total));
		if(opts.pager!=null)opts.pageObj=$(paginate(opts.pager.current_page,opts.pager.pagesize,opts.pager.total));
		
		var toolbar_html=gen_toolbar(opts);
		var toolbar=null;
		if(toolbar_html!=null)toolbar=$(gen_toolbar(opts));

		//datagrid frame 框架
		var mainframe=$this;
		mainframe.empty();
		var dgframe = $("<div class='datapanel'></div>")//document.createElement("DIV");
		//dgframe.id = this.rid;
		dgframe.css("width", mainframe.width());
		//var barHight=0;
		//if(pager)barHight+=pager.height();
		//dgframe.css("height", mainframe.height()-barHight);
		//dgframe.onmousedown = function(e){e=e||window.event;getrow(e,opts);}
		//dgframe.onmousemove = function(e){e=e||window.event;rsc_m(e,opts);}
		dgframe.bind("mousedown",function(e){e=e||window.event;getrow(e,opts);});
		dgframe.bind("mousemove",function(e){e=e||window.event;rsc_m(e,opts);});

		if(document.attachEvent){
			document.attachEvent("onmouseup",function(e){e=e||window.event;rsc_u(e,opts);});
		}else{
			document.addEventListener("mouseup",rsc_u,false);
		}
		dgframe.oncontextmenu = function(){return false}
		dgframe.onselectstart = function(){return false}
		ae(dgframe,opts);

		//datagrid zero point 零点
		//var dgzero = "<div id=\"zero\"></div>"
		var dgzero = document.createElement("div");
		dgzero.id="zreo";
		dgzero.className="zreo";
		//datagrid slidecolumn 第一列
		var dgslide = $("<table cellpadding=\"0\" cellspacing=\"0\" id=\"slidecolumn\" class=\"slidecolumn\">"+dgs+"</table>");

		//datagrid column 标题栏
		var dgcolumn = $("<table cellpadding=\"0\" cellspacing=\"0\" id=\"titlecolumn\" class=\"titlecolumn datacolumn\">"+dgc+"</table>");

		//datagrid data 数据
		var dgdata = $("<table cellpadding=\"0\" cellspacing=\"0\" id=\"datacolumn\" class=\"datacolumn\">"+dgc+dgd+"</table>");
		//var dgdata=document.createElement("<table cellpadding=\"0\" cellspacing=\"0\" id=\"datacolumn\"><tr><td>aaaaaaaaa</td></tr></table>");
		/*
		dgdata.id="datacolumn";
		dgdata.style.cellpadding="0";
		dgdata.style.cellspacing="0";
		alert(document.createElement(dgc).tagName);
		document.getElementById("text").appendChild(document.createElement(dgd));
		alert(dgc);
		//dgdata.appendChild(document.createElement(dgc));
		dgdata.appendChild(document.createElement("<tbody>"+dgd+"</body>"));
		//dgdata.innerHTML=dgc+dgd;
		*/

		//datagrid hbar 水平滚动条
		var dghbar = document.createElement("DIV");
		dghbar.id = "hbar";
		dghbar.style.position = "absolute";
		dghbar.style.width = "100%";
		dghbar.style.height = "17px";
		dghbar.style.top = (opts._height-17)+"px";
		dghbar.style.left = "0px";
		dghbar.style.overflowX = "auto";
		dghbar.style.zIndex = "10";
		dghbar.onscroll = function(){scrh(opts);}
		dghbar.innerHTML = "<div style=\"width:100%;height:1px;overflow-y:hidden;border:solid 1px red\">&nbsp;</div>";
		//datagrid vbar 垂直滚动条
		var dgvbar = document.createElement("DIV");
		dgvbar.id = "vbar";
		dgvbar.style.position = "absolute";
		dgvbar.style.width = "17px";
		dgvbar.style.height = "100%";
		dgvbar.style.top = "0px";
		dgvbar.style.left = (opts._width-17)+"px";
		dgvbar.style.overflowY = "auto";
		dgvbar.style.zIndex = "10";
		dgvbar.onscroll = function(){scrv(opts);}
		dgvbar.innerHTML = "<div style=\"width:1px;height:100%;overflow-x:hidden;border:solid 1px red\">&nbsp;</div>";
		//datagrid bgbar 滚动条背景
		var dgbgbar = document.createElement("DIV");
		dgbgbar.id = "bgbar";
		dgbgbar.style.background = "buttonface";
		dgbgbar.style.position = "absolute";
		dgbgbar.style.width = "100%";
		dgbgbar.style.height = "17px";
		dgbgbar.style.top = (opts._height-17)+"px";
		dgbgbar.style.overflowX = "auto";
		dgbgbar.style.zIndex = "9";
		dgbgbar.style.display = "none";
		dgbgbar.innerHTML = "&nbsp;";
		//appendChild
		//dgframe.append( dgzero,dgslide,dgcolumn);
		if(toolbar!=null)dgframe.append( toolbar);
		dgframe.append( dgzero);
		dgframe.append( dgcolumn);
		dgframe.append( dgdata);
		dgframe.append(dghbar);
		dgframe.append(dgvbar);
		dgframe.append(dgbgbar);


		mainframe.append(toolbar);
		mainframe.append(dgframe);
		if(opts.pageObj!=null)
		{
			mainframe.append(opts.pageObj);
		}
		//opts.parentNode.appendChild(dgframe);
		document.getElementById("text").value=mainframe.html();

		$("document").keydown(function(){
			 updown();
		});



/*
		if(document.attachEvent){
			document.attachEvent("onkeydown",updown);
		}else{
			document.addEventListener("keydown",updown,false);
		}
*/
		framediv = dgframe;
		//zerobj = document.getElementById("zero");
		opts.leftobj = dgslide.get(0);//document.getElementById("slidecolumn");
		opts.titleobj = dgcolumn.get(0);//document.getElementById("titlecolumn");
		opts.dataobj = dgdata.get(0);//document.getElementById("datacolumn");
		opts.hbar = dghbar;
		opts.vbar = dgvbar;
		opts.bgbar = dgbgbar;

		var btt = mainframe.css("borderTopWidth");//getCurrentStyle(framediv,"borderTopWidth");
		var btr = mainframe.css("borderRightWidth");//getCurrentStyle(framediv,"borderRightWidth");
		var btb = mainframe.css("borderBottomWidth");//getCurrentStyle(framediv,"borderBottomWidth");
		var btl = mainframe.css("borderLeftWidth");//getCurrentStyle(framediv,"borderLeftWidth");
		var fh = framediv.css("height");//getCurrentStyle(framediv,"height");
		var zh =dgzero.style.height; //getCurrentStyle(dgzero,"height");
		var zbt = getCurrentStyle(dgzero,"borderTopWidth");
		var zbb = getCurrentStyle(dgzero,"borderBottomWidth");


		var toolbarHeight =0;
		if(toolbar!=null)toolbarHeight=toolbar.outerHeight();

		var pageBarHeight=0;
		if(opts.pageObj!=null)pageBarHeight+=opts.pageObj.outerHeight();
		
		dgframe.css("height", mainframe.height()-pageBarHeight-toolbarHeight);

		//dgframe.css("top", toolbarHeight);
		//dgframe.get(0).style.top=toolbarHeight;


		//if(isMSIE){
			//opts.vbar.style.left = (parseInt(opts.vbar.style.left)-parseInt(btr)-parseInt(btl))+"px";
		//}else{
			//framediv.height( parseInt(fh)-parseInt(btb)-parseInt(btt));
			//dgzero.style.height = parseInt(zh)-parseInt(zbb)-parseInt(zbt);
		//}

		//opts.hbar.style.top = (parseInt(opts.hbar.style.top)-parseInt(btb)-parseInt(btt)-pageBarHeight-toolbarHeight)+"px";
		opts.hbar.style.top = (parseInt(opts.hbar.style.top)-pageBarHeight-toolbarHeight)+"px";
		//opts.bgbar.style.top = (parseInt(dgbgbar.style.top)-parseInt(btb)-parseInt(btt)-pageBarHeight-toolbarHeight)+"px";
		opts.bgbar.style.top = (parseInt(dgbgbar.style.top)-pageBarHeight-toolbarHeight)+"px";
		

		$.fn.datagrid.setwh($this,opts);
		//bind event
			var column=$this.find('.datacolumn thead tr td.column');
			column.bind("mouseover",function(){$.fn.datagrid.over(this);});
			column.bind("mouseout",function(){$.fn.datagrid.out(this);});
			column.bind("mousemove",function(){$.fn.datagrid.cc(event,this);});
			column.bind("mousedown",function(){$.fn.datagrid.rsc_d(event,this,opts);});
			column.bind("mouseup",function(){$.fn.datagrid.mouseup(this);});
			//$(this).find('#selectAll').bind("click",function(){$.fn.datagrid.selectall(this.checked);});
		//make the data in the grid can edited
		if(opts.editable)
		{
			var dataColumn=$this.find('.datacolumn tbody tr td');
			dataColumn.dblclick(function(){
				  //alert(this.innerText);
				  var td=$(this);
				  var input=$("<input id='dynamicText' style='border:0;' value='"+this.innerText+"'>");
				  input.css("width",td.width());
				  td.empty();
				  td.append(input);
				  input.focus();
				  input.blur(function(){td.html(this.value)});
					
				});
		}

			var dataRow=$this.find('.datacolumn tbody tr');
			dataRow.bind("mouseover",function(){
				this.className="over";
			});
			dataRow.bind("mouseout",function(){
				if(this.selected=="true")this.className = "selectedrow";
				else this.className="";
			});

			$this.find('.paginate .navigator').bind("click",function(){
				page=$(this).attr("page");
				if(page)
				{
					opts.pager.current_page=page;
					$.fn.datagrid.loadData($this,opts);
				}
			});

			$this.find('.paginate .navigator_longstring').bind("click",function(){
				if(this.page)
				{
					opts.pager.current_page=this.page;
					$.fn.datagrid.loadData($this,opts);
				}
			});
			$this.find('.toolbar a').bind("click",function(){
					var btnIndex=$(this).attr("btnIndex");
					var bn=this.className;
					//if(bn=="Refresh")$.fn.datagrid.loadData($this,opts);
					//if(bn=="Add")openDialog(inputAction,"Add");
					var text=opts.toolbar[btnIndex].text;
					var src=opts.toolbar[btnIndex].src;
					var width=opts.toolbar[btnIndex].width;
					var height=opts.toolbar[btnIndex].height;
					openDialog(src,text,width,height);
					
			});
	}
	 /*
	function paginate(startRow,rows, totalRecords)
	 {
		var pager="";
        if (totalRecords<0)
            totalRecords = 0;
        if (startRow<0)
            startRow = 0;
        if (startRow >=totalRecords-1 )
            startRow =totalRecords-1;
        if (rows<1)
            rows = 1;
        startRow = startRow - startRow%rows;
        var pageIndex = startRow / rows ;
        var pages = (totalRecords +rows -1 ) / rows ;
        pager+=("<table id=paginate class=paginate><tbody><tr><td >") ;
        
        pager+=("<a>共" + totalRecords + "条记录</a>");
       // pager+=("  " + (pageIndex + 1) + "/" + pages + " ");
        if (pageIndex <= 0) {
            pager+=("<a class=\"navigator_longstring\" page=\"0\"><span class=\"ico\">9</span>首页</a>");
            pager+=("<a class=\"navigator\" page=\"0\"><span class=\"ico\">3</span></a>");
        } else {
            pager+=("<a class=\"navigator_longstring\" page=\"0\"><span class=\"ico\">9</span>首页</a>");
            if(pageIndex-4>=0)
            {
                pager+=("<a class=\"navigator\" page=\""+(pageIndex-6)+"\"><span class=\"ico\">3</span></a>");
            }
            else
            {
                pager+=("<a class=\"navigator\"><span class=\"ico\">3</span></a>");
            }
        }

        for(var i=pageIndex-5>=0?pageIndex-5:0;i<pageIndex;i++)
        {
            pager+=("<a class=\"navigator\"page=\""+i+"\">"+(i+1)+"</a>");
        }
        pager+=("<a class=\"navigator_current\">"+(pageIndex+1)+"</a>");
            
        for(var i=pageIndex+1;i<pageIndex+6 && i<pages;i++)
        {
            pager+=("<a class=\"navigator\"page=\""+i+"\">"+(i+1)+"</a>");
        }

        if (pageIndex >= pages - 1) 
        {
            pager+=("<a class=\"navigator\"><span class=\"ico\">4</span></a>");
            pager+=("<a class=\"navigator_longstring\">末页<span class=\"ico\">:</span></a>");
        } 
        else 
        {
           if(pageIndex+4<=pages-1)
            {
                pager+=("<a class=\"navigator\" page=\""+(pageIndex+6)+"\"><span class=\"ico\">4</span></a>");
            }
           else
           {
                pager+=("<a class=\"navigator\"\"><span class=\"ico\">4</span></a>");
           }
            pager+=("<a class=\"navigator_longstring\" page=\"" + (pages - 1) +  "\">末页<span class=\"ico\">:</span></a>");
        }
        
        pager+=("</td></tr></tbody></table>") ;
		return pager;



	 }
	 */
	 	function paginate(currentPage,pagesize, totalRecords)
	 {
		var pager="";
        if (totalRecords<0)
            totalRecords = 0;
        if (currentPage<0)
            currentPage = 0;
        if (pagesize <=0 )
            pagesize=10;
        var pages = Math.floor((totalRecords +pagesize -1 ) / pagesize) ;
        pager+=("<table id=paginate class=paginate><tbody><tr><td >") ;
        
        pager+=("<a class=\"string\">共" + totalRecords + "条记录</a>");

        if (currentPage <= 0) {
            pager+=("<a class=\"navigator_longstring\" page=\"0\"><span class=\"ico\">9</span>首页</a>");
            pager+=("<a class=\"navigator\" page=\"0\"><span class=\"ico\">3</span></a>");
        } else {
            pager+=("<a class=\"navigator_longstring\" page=\"0\"><span class=\"ico\">9</span>首页</a>");
            if(currentPage-4>=0)
            {
                pager+=("<a class=\"navigator\" page=\""+(currentPage-6)+"\"><span class=\"ico\">3</span></a>");
            }
            else
            {
                pager+=("<a class=\"navigator\" ><span class=\"ico\">3</span></a>");
            }
        }

        for(var i=currentPage-5>=0?currentPage-5:0;i<currentPage;i++)
        {
            pager+="<a class=\"navigator\"page=\""+i+"\">"+(i+1)+"</a>";
        }
        pager+="<a class=\"navigator_current\">"+(currentPage+1)+"</a>";
            
        for(var i=Number(currentPage)+1;i<currentPage+6 && i<pages;i++)
        {
            pager+="<a class=\"navigator\"page=\""+i+"\">"+(i+1)+"</a>";
        }

        if (currentPage >= pages - 1) 
        {
            pager+=("<a class=\"navigator\"><span class=\"ico\">4</span></a>");
            pager+=("<a class=\"navigator_longstring\">末页<span class=\"ico\">:</span></a>");
        } 
        else 
        {
           if(currentPage+4<=pages-1)
            {
                pager+=("<a class=\"navigator\" page=\""+(currentPage+6)+"\"><span class=\"ico\">4</span></a>");
            }
           else
           {
                pager+=("<a class=\"navigator\"\"><span class=\"ico\">4</span></a>");
           }
            pager+=("<a class=\"navigator_longstring\" page=\"" + (pages - 1) +  "\">末页<span class=\"ico\">:</span></a>");
        }
        
        pager+=("</td></tr></tbody></table>") ;

		return pager;



	 }

	//获得当前样式
	function getCurrentStyle(oElement, sProperty) {   
		if(oElement.currentStyle){   
			return oElement.currentStyle[sProperty];   
		}else if(window.getComputedStyle){   
			sProperty = sProperty.replace(/([A-Z])/g, "-$1").toLowerCase();   
			return window.getComputedStyle(oElement, null).getPropertyValue(sProperty);   
		}else{   
			return null;   
		}   
	}
	//设置块滚动条
	$.fn.datagrid.setwh = function($this,opts){
		opts.hbar.style.display = "block";
		opts.vbar.style.display = "block";
		opts.hbar.childNodes[0].style.width = opts.dataobj.offsetWidth+"px";
		opts.vbar.childNodes[0].style.height = opts.dataobj.offsetHeight+"px";
		if(opts.hbar.childNodes[0].offsetWidth<=opts.hbar.offsetWidth){
			opts.hbar.style.display = "none";
		}else{
			opts.hbar.style.display = "block";
		}

		if(opts.vbar.childNodes[0].offsetHeight<=opts.vbar.offsetHeight){
			opts.vbar.style.display = "none";
		}else{
			opts.vbar.style.display = "block";
		}
		if(opts.hbar.childNodes[0].offsetWidth>opts.hbar.offsetWidth && opts.vbar.childNodes[0].offsetHeight>opts.vbar.offsetHeight && opts.changeposv){
			opts.bgbar.style.display = "block";
			opts.hbar.style.width = (opts.hbar.offsetWidth-17)+"px";
			opts.vbar.style.height = (opts.vbar.offsetHeight-17)+"px";
			opts.vbar.childNodes[0].style.height = (opts.vbar.childNodes[0].offsetHeight+17)+"px";
			opts.changeposv = false;
		}

		if(opts.hbar.childNodes[0].offsetWidth<=opts.hbar.offsetWidth+17 && !opts.changeposv){
			opts.bgbar.style.display = "none";
			opts.hbar.childNodes[0].style.width = "0px";
			opts.hbar.style.width = (opts.hbar.offsetWidth+17)+"px";
			opts.vbar.style.height = (opts.vbar.offsetHeight+17)+"px";
			opts.changeposv = true;
			/*
			if(opts.vbar.offsetHeight-opts.dataobj.offsetHeight>opts.dataobj.offsetTop){// && isMSIE){
				//opts.leftobj.style.top = opts.leftobj.offsetTop+17;
				opts.dataobj.style.top = opts.dataobj.offsetTop+17;
			}\*/
		}
		//alert("opts.hbar.style.width:"+opts.hbar.style.width+";opts.vbar.style.height:"+opts.vbar.style.height )
	}
	//鼠标滚轮，列表滚动事件
	function mwEvent(e,delta,opts){
		
		e=e||window.event;
		e.preventDefault();
		e=e.originalEvent;
		if(e.wheelDelta<=0 || e.detail>0){
			opts.vbar.scrollTop += 18;
		}else {
			opts.vbar.scrollTop = opts.vbar.scrollTop-18;
		}
	}
	function ae(obj,opts){
		obj.bind("mousewheel", function(e,delta,deltaX, deltaY){e=e||window.event;mwEvent(e,delta,opts)});
		/*
		if(document.attachEvent){
			obj.attachEvent("onmousewheel",mwEvent);
		}else{
			obj.addEventListener("DOMMouseScroll",mwEvent,false);
		}
		*/
	}

	//滚动条事件
	function scrv(opts){
		//opts.leftobj.style.top = -(opts.vbar.scrollTop);
		opts.dataobj.style.top = (-opts.vbar.scrollTop)+"px";
	}

	function scrh(opts){
		//alert("scrh")
		//alert(parseInt($(opts.titleobj).css("left"))+":"+opts.hbar.scrollLeft)
		opts.titleobj.style.left = (-opts.hbar.scrollLeft)+"px";
		opts.dataobj.style.left = (-opts.hbar.scrollLeft)+"px";
		//opts.titleobj.style.left = -(opts.hbar.scrollLeft);
		//opts.dataobj.style.left = -(opts.hbar.scrollLeft);
		//document.getElementById("text").value=document.getElementById("text").value+parseInt($(opts.titleobj).css("left"))+":"+$(opts.hbar).scrollLeft()+"\n";
	}

	//选择行
	function getrow(e,opts){
		e=e||window.event;
		var esrcobj = e.srcElement?e.srcElement:e.target;
		if(esrcobj.parentNode.tagName=="TR"){
			var epobj = esrcobj.parentNode;
			var eprowindex = epobj.rowIndex;
			if(opts.multiple==true)
			{
			if(epobj.selected!="true")
			{
				epobj.selected="true";
				opts.dataobj.rows[eprowindex].className = "selectedrow";
			}
			else 
			{
				epobj.selected="false";
				opts.dataobj.rows[eprowindex].className = "";
			}
			}
			else
			{
			if(eprowindex!=0){
				if(opts.nowrow!=null){
					opts.dataobj.rows[opts.nowrow].selected="false";
					opts.dataobj.rows[opts.nowrow].className = "";
				}
				epobj.selected="true";
				opts.dataobj.rows[eprowindex].className = "selectedrow";
				opts.nowrow = eprowindex;
			}
			}
			
		}
	}

	//更改列宽
	$.fn.datagrid.rsc_d = function(e,obj,opts){
		//var px = isMSIE?e.offsetX:e.layerX-obj.offsetLeft;
		var px = e.offsetX;
		if(px>obj.offsetWidth-6 && px<obj.offsetWidth){
			e=e||window.event;
			obj=obj||this;
			opts.ml = e.clientX;
			opts.ow = obj.offsetWidth;
			opts.tdobj = obj;
			if(obj.setCapture){
				obj.setCapture();
			}else{
				e.preventDefault();
			}
		}else{
			if(opts.nowrow!=null){
				opts.dataobj.rows[nowrow].className = "";
			}
			if(obj.getAttribute("sort")==null){
				obj.setAttribute("sort",0);
			}
			var sort = obj.getAttribute("sort");
			if(sort==1){
				dgsort(obj,true,opts);
				obj.setAttribute("sort",0);
			}else{
				dgsort(obj,false,opts);
				obj.setAttribute("sort",1);
			}
			obj.className = "sortdown";
		}
	}
	$.fn.datagrid.mouseup = function(obj){
		obj.className = "over";
	}
	function rsc_m(e,opts){
		if(opts.tdobj!=null){
			e=e||window.event;
			var newwidth = opts.ow-(opts.ml-e.clientX);
			if(newwidth>5){
				opts.tdobj.style.width = newwidth+"px";
				opts.dataobj.rows[0].cells[opts.tdobj.cellIndex].style.width = newwidth+"px";
			}else{
				opts.tdobj.style.width = 5+"px";
				opts.dataobj.rows[0].cells[opts.tdobj.cellIndex].style.width = 5+"px";
			}
		$.fn.datagrid.setwh(this,opts);
			scrh(opts);
		}
	}
	function rsc_u(e){
		opts=$.fn.datagrid.config;
		if(opts!=null && opts.tdobj!=null){
			e=e||window.event;
			var newwidth = opts.ow-(opts.ml-e.clientX);
			if(newwidth>5){
				opts.tdobj.style.width = newwidth+"px";
				opts.dataobj.rows[0].cells[opts.tdobj.cellIndex].style.width = newwidth+"px";
			}else{
				opts.tdobj.style.width = 5+"px";
				opts.dataobj.rows[0].cells[opts.tdobj.cellIndex].style.width = 5+"px";
			}
			if(opts.tdobj.releaseCapture){
				opts.tdobj.releaseCapture();
			}
			opts.ml = 0;
			opts.ow = 0;
			opts.tdobj = null;
		}
		$.fn.datagrid.setwh(this,opts);
		scrh(opts);
	}

	$.fn.datagrid.cc = function(e,obj){
		//var px = isMSIE?e.offsetX:e.layerX-obj.offsetLeft;
		var px = e.offsetX;
		if(px>obj.offsetWidth-6 && px<obj.offsetWidth){
			obj.style.cursor = "col-resize";
		}else{
			obj.style.cursor = "default";
		}
	}

	$.fn.datagrid.over = function(obj){
		obj.className = "over";
	}

	$.fn.datagrid.out = function(obj){
		obj.className = "column";
	}

	$.fn.datagrid.dataover = function(obj){
		if(obj.rowIndex!=nowrow){
			obj.className = "dataover";
		}
	}

	$.fn.datagrid.dataout = function(obj){
		if(obj.rowIndex!=nowrow){
			obj.className = "";
		}
	}

	//键盘Up & Down事件
	function updown(e){
		e=e||window.event;
		c=e.which||e.keyCode;
		var rl = dh.data.length;
		switch(c){
			case 38://Up;
				if(nowrow!=null && nowrow>1){
					vbar.scrollTop -= 18;
					opts.dataobj.rows[nowrow].className = "";
					nowrow -= 1;
					opts.dataobj.rows[nowrow].className = "selectedrow";
				};
				if(isMSIE){
					e.keyCode = 0;
				}
				break;
			case 40://Down;
				if(nowrow!=null && nowrow<rl){
					vbar.scrollTop += 18;
					opts.dataobj.rows[nowrow].className = "";
					nowrow += 1;
					opts.dataobj.rows[nowrow].className = "selectedrow";
				};
				if(isMSIE){
					e.keyCode = 0;
				}
				break;
			case 13://enter;
				if(nowrow!=null){
					dh.dblclick_fun(opts.dataobj.rows[nowrow]);
				};
				if(isMSIE){
					e.keyCode = 0;
				}
				break;
			default:break;
		}
	}

	function dti(s){
		var tmpstr = "";
		var n = 0;
		var tmp = s.split(/\./);
		if(tmp.length>0){
			tmpstr = tmp[0]+"."+tmp.slice(1,tmp.length).join("");
		}else{
			tmpstr = s
		}
		var a = tmpstr.match(/(\d+\.\d+)|(\d+)/g);
		for(var i=0;i<a.length;i++){
			if(a[i].length<2){
				a[i] = "0"+a[i];
			}
		}
		n = a.join("");
		return n;
	}

	//排序
	function dgsort(obj,asc,opts){
		var rl = opts.data.length;
		var ci = obj.cellIndex;
		var rowsobj = [];
		for(var i=0;i<opts.dataobj.childNodes[1].rows.length;i++){
			rowsobj[i] = opts.dataobj.childNodes[1].rows[i];
		}
		rowsobj.sort(function(trObj1,trObj2){
				if(!isNaN(trObj1.cells[ci].innerHTML.charAt(0)) && !isNaN(trObj2.cells[ci].innerHTML.charAt(0))){
					if(asc){
						return dti(trObj1.cells[ci].innerHTML)-dti(trObj2.cells[ci].innerHTML);
					}else{
						return dti(trObj2.cells[ci].innerHTML)-dti(trObj1.cells[ci].innerHTML);
					}
				}else{
					if(asc){
						return trObj1.cells[ci].innerHTML.localeCompare(trObj2.cells[ci].innerHTML);
					}else{
						return trObj2.cells[ci].innerHTML.localeCompare(trObj1.cells[ci].innerHTML);
					}
				}
			});
		for(var i=0;i<rowsobj.length;i++){
			opts.dataobj.childNodes[1].appendChild(rowsobj[i]);
		}
		rowsobj = null;
		for(var c=(opts.multiple)?2:1;c<obj.parentNode.cells.length-1;c++){
			obj.parentNode.cells[c].childNodes[1].innerHTML = "";
		}
		if(asc){
			obj.childNodes[1].innerHTML = "▲";
		}else{
			obj.childNodes[1].innerHTML = "▼";
		}
	}

	//查找
	$.fn.datagrid.findkey = function(keys,opts){
		//e=e || window.event; e=e.which || e.keyCode;
		keys = keys.toLowerCase();
		if(keys.replace(/\s/g,"").length>0){
			var rowsobjT = [];
			var rowsobjB = [];
			for(var i=0;i<opts.data.length;i++){
				if(-1 != opts.dataobj.childNodes[0].rows[i+1].innerHTML.replace(/<td[^>]*>|<\/td>/ig,"").toLowerCase().indexOf(keys)){
					rowsobjT[rowsobjT.length] = opts.dataobj.childNodes[0].rows[i+1];
				}else{
					rowsobjB[rowsobjB.length] = opts.dataobj.childNodes[0].rows[i+1];
				}
			}
			if(rowsobjT.length>0){
				if(nowrow!=null){
					opts.dataobj.childNodes[0].rows[nowrow].className = "";
				}
				var fobj = rowsobjT.concat(rowsobjB);
				for(var i=0;i<fobj.length;i++){
					opts.dataobj.childNodes[0].appendChild(fobj[i]);
				}
				fobj = null;
			}
			rowsobjT = null;
			rowsobjB = null;
		}
	}

	//加载数据
	$.fn.datagrid.setdata = function($this,opts,arrdata){
		if(arrdata && arrdata.length>0){
			$this.html("");
			opts.data = arrdata;
			changeposv = true;
			nowrow = null;
			this.init($this,opts);
		}
	}

	$.fn.datagrid.loadData = function($this,opts) {
		var param={};
		//if(opts.url.indexOf('?')<=0)param+="?";

		if(opts.pager)param={page:opts.pager.current_page,pagesize:opts.pager.pagesize};
		if(opts.params)param= $.extend(param, opts.params); 
		$.getJSON(opts.url,param,function(data) {		
				if(data.pager)
					opts.pager = {
						current_page: data.pager.current,
						pagesize: 	  data.pager.pagesize,
						total:		  data.pager.total
					};
				if(data.rowwidth)
				$.each(data.rowwidth, function(i, width) {
					opts.colwidth[i]=width;
				});

				$.each(data.rows, function(i, row) {
					if(i==0)
					{
						var index=0;
						for(j in row)
						{
						   opts.columns[index++]=j;
						}
					}
					var rowData=[];
					for (a=0; a < opts.columns.length; a++) {
						rowData[a]=row[opts.columns[a]];
					}	
					opts.data[i]=rowData;
				});
				$.fn.datagrid.setdata($this,opts,opts.data);
			}
		);

	}
	$.fn.datagrid.getSelected = function(datagrid) {
		alert($(this).attr("id"));

		//var datarows=$.fn.datagrid.config.dataobj.rows;
		//var datarows=$(this).find(".datacolumn");
		$.each(datagrid.find(".datacolumn tbody tr"), function(i, row){
			alert("AA:"+row.selected);
		});
		/*
		$.each($.fn.datagrid.config.dataobj.rows, function(i, row) 
		{
					//row[opts.columns[a]]
					//alert(row.selected);
		});
		*/
	}

	$.fn.extend({         
   	refresh :function()
	 {
		$this=$(this);
		alert($this.data("options"));
		$.fn.datagrid.loadData($this,$this.data("options"));

	 },
	resizeGrid : function(w,h){
			var sw=w;//document.body.clientWidth-parseInt($(document.body).css("margin-left"))-parseInt($(document.body).css("margin-right"));
			var sh=h;//$(this).height();
			//alert($(document.body).css("margin-left"))
			//alert(sw)
		var opts=$(this).data("options");
		if(opts.width==0)opts._width=sw;
        else if((""+opts.width).indexOf("%")>0)
		{
				opts._width=sw * opts.width.substring(0,(""+opts.width).indexOf('%'))/100;
		}
		else
		{
			opts._width=opts.width;
		}
		if(opts.height==0)opts._height=sh;
            else if((""+opts.height).indexOf("%")>0)
			{
				opts._height=sh * opts.height.substring(0,(""+opts.height).indexOf('%'))/100;
			}
			else
			{
				opts._height=opts.height;
			}

		$.fn.datagrid.init($(this),opts);
	},

    getSelected:function(){        
		if($(this).attr("class")!="datagrid" && $(this).attr("class")!="treegrid")return;
		var selected=[];
         //$(this).click(function(){       
		var dg=$(this);
		var j=0;
		//alert($this.data("options").pager.current_page);
        $.each(dg.find(".datacolumn tbody tr"), function(i, row){
			if(row.selected=="true")
			{
				//selected[j++]=row;
				var rowid=row.rowid;
				selected[j++]=dg.data("options").data[rowid];
			}
		});    
		//if(selected.length>0)selected=selected.substring(0,selected.length-1);
		return selected;
         // });        

      }        

}); 
/*
$(document).ready(function(){ 
	var resize_num=0
	$(window).resize(function(){
		$("div.datagrid").each(function(i,ele){
			//ele.resizeGrid();
			if(resize_num%2==0)$(ele).resizeGrid();
		})
			resize_num++;
	})
});
*/
})(jQuery);  
/*
window.attachEvent("onresize",re); 
function re()
{
	$(".datagrid").each(function(i,ele){
			//ele.resizeGrid();
			alert(ele.id);
		})
		
}
*/