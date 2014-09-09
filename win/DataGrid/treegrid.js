 (function($) { 
$.fn.treegrid= function (options){
	//author:dh20156; Download by http://down.liehuo.net 
	var defaults=
	{
	callname : "dhdg",
	width : 500,
	height : 200,
	rid : "treegrid",
	multiple : false,
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
	 changeposv : true,
	
	 getSelected:function()
		{
		return "hehe";
		}

	}
	defaults.rid=$(this).attr("id");

	defaults.isMSIE =navigator.appName == "Microsoft Internet Explorer";
    var opts = $.extend({}, defaults, options); 

	$.fn.treegrid.config =opts;


	    return this.each(function(i) {     
			$(this).css("width",opts.width);
			$(this).css("height",opts.height);

			if(opts.url)
			{
				$.fn.treegrid.loadData($(this),opts);
			}
			else 
				$.fn.treegrid.init($(this),opts);
			


		});
		

}
	//全选
	$.fn.treegrid.selectall = function(checked){
		var objbox = document.getElementsByName("dhdgchkbox");
		var objboxl = objbox.length;
		for(var i=0;i<objboxl;i++){
			objbox[i].checked = checked;
		}
	}
	function parseChildren(opts,children,indent)
	 {
		var r=0;
		var dgd="";
		var dgs="";

		var indentString="";
		for(var i=0;i<indent;i++)
		 {
			indentString+="&nbsp;&nbsp;&nbsp;&nbsp;";
		 }
			for(var r=0;r<children.length;r++)
			{
				dgs += '<tr><td>'+(r+1)+'</td></tr>';
				dgd += '<tr children_display="block" parent="p_'+indent+'" self="p_'+(indent+1)+'">';
				/*
				if(opts.multiple){
					dgd += '<td style="width:30px;text-align:center;overflow:hidden;padding:0;text-align:center;"><input type="checkbox" style="margin:0;" name="dhdgchkbox"></td>';
				}
				*/
				var a=0;
				var childrenRow="";
				var hasChildren=children[r].children;
			    for (title in children[r])
				{
						
					if(title!="children")
					//for (a=0; a < opts.columns.length; a++) 
					{
						if(opts.colwidth.length>0)
						{
							dgd += '<td width="'+opts.colwidth[a++]+'">';
						}else{
							dgd += '<td>';
						}
						dgd+=indentString;
						if(a==1)
							if(hasChildren)dgd+='<img class=\"treenode\" src="image/folder.gif" />';
							else dgd+='<img class=\"treeleaf\" src="image/file.gif"/>';
						dgd+=children[r][title];
						dgd+='</td>'
					}	
					else
					{
						childrenRow+=parseChildren(opts,children[r][title],indent+1);
					}
				}
				dgd += '<td class="lastdata">&nbsp;</td></tr>';
				if(childrenRow!="")dgd+=childrenRow;
			}
			return dgd;

	 }
	$.fn.treegrid.init = function($this,opts){
		//var $this=$(this);
		//init the data 初始数据
		var dgc = "";
		var avgw = opts.width-100
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
				if(opts.colwidth.length>0){
					//dgc += '<td class="column" width="'+opts.colwidth[cc]+'"  onmouseout="'+opts.callname+'.out(this);" onmousemove="'+opts.callname+'.cc(event,this);" onmousedown="'+opts.callname+'.rsc_d(event,this);" onmouseup="'+opts.callname+'.mouseup(this);">'+opts.columns[cc]+'<span class="arrow"></span></td>';
					dgc += '<td class="column" width="'+opts.colwidth[cc]+'"  >'+opts.columns[cc]+'<span class="arrow"></span></td>';
				}else{
					//dgc += '<td class="column" width="'+avgw+'" onmouseover="'+opts.callname+'.over(this);" onmouseout="'+opts.callname+'.out(this);" onmousemove="'+opts.callname+'.cc(event,this);" onmousedown="'+opts.callname+'.rsc_d(event,this);" onmouseup="'+opts.callname+'.mouseup(this);">'+opts.columns[cc]+'<span class="arrow"></span></td>';
					dgc += '<td class="column" width="'+avgw+'" >'+opts.columns[cc]+'<span class="arrow"></span></td>';
				}
			}
			dgc += '<td class="lastcolumn">&nbsp;</td></tr></thead>';
		}

		var dgs = "";
		var dgd = "";
		if(opts.data.length>0){
			//第一列
			dgs = '<tr><td>&nbsp;</td></tr>';
			dgd=parseChildren(opts,opts.data,0);

			if(dgc==""){
				//dgc = '<thead>';
				dgc = '<thead><tr><td class="firstcolumn">&nbsp;</td>';
				/*
				if(opts.multiple){
					dgc += '<td class="column title" style="width:30px;text-align:center;padding:0;text-indent:0;text-align:center;"><input type="checkbox" style="margin:0;" onclick="'+opts.callname+'.selectall(opts.checked);"></td>';
				}
				*/
				for(var dc=0;dc<opts.data[0].length;dc++){
					if(opts.colwidth.length>0){
						dgc += '<td class="column title" width="'+opts.colwidth[dc]+'" onmouseover="'+opts.callname+'.over(opts);" onmouseout="'+opts.callname+'.out(opts);" onmousemove="'+opts.callname+'.cc(event,opts);" onmousedown="'+opts.callname+'.rsc_d(event,opts);" onmouseup="'+opts.callname+'.mouseup(opts);">Expr'+(dc+1)+'<span class="arrow"></span></td>';
					}else{
						dgc += '<td class="column title" width="'+avgw+'" onmouseover="'+opts.callname+'.over(opts);" onmouseout="'+opts.callname+'.out(opts);" onmousemove="'+opts.callname+'.cc(event,opts);" onmousedown="'+opts.callname+'.rsc_d(event,opts);" onmouseup="'+opts.callname+'.mouseup(opts);">Expr'+(dc+1)+'<span class="arrow"></span></td>';
					}
				}
				dgc += '<td class="lastcolumn">&nbsp;</td></tr></thead>';
			}
		}

		//treegrid frame 框架
		var dgframe = $this;//document.getElementById("treegrid");//document.createElement("DIV");
		//dgframe.id = this.rid;
		//dgframe.style.width = this.width;
		//dgframe.style.height = this.height;
		//dgframe.onmousedown = function(e){e=e||window.event;getrow(e);}
		//dgframe.onmousemove = function(e){e=e||window.event;rsc_m(e);}
		dgframe.bind("mousedown",function(e){e=e||window.event;getrow(e,opts);});
		dgframe.bind("mousemove",function(e){e=e||window.event;rsc_m(e,opts);});

		if(document.attachEvent){
			document.attachEvent("onmouseup",function(e){e=e||window.event;rsc_u(e,opts);});
		}else{
			document.addEventListener("mouseup",rsc_u,false);
		}
		dgframe.oncontextmenu = function(){return false}
		dgframe.onselectstart = function(){return false}
		ae(dgframe);

		//treegrid zero point 零点
		//var dgzero = "<div id=\"zero\"></div>"
		var dgzero = document.createElement("div");
		dgzero.id="zreo";
		dgzero.className="zreo";
		//treegrid slidecolumn 第一列
		var dgslide = $("<table cellpadding=\"0\" cellspacing=\"0\" id=\"slidecolumn\" class=\"slidecolumn\">"+dgs+"</table>");

		//treegrid column 标题栏
		var dgcolumn = $("<table cellpadding=\"0\" cellspacing=\"0\" id=\"titlecolumn\" class=\"titlecolumn datacolumn\">"+dgc+"</table>");

		//treegrid data 数据
		var dgdata = $("<table cellpadding=\"0\" cellspacing=\"0\" id=\"datacolumn\" class=\"datacolumn\">"+dgc+dgd+"</table>");
		//var dgdata=document.createElement("<table cellpadding=\"0\" cellspacing=\"0\" id=\"datacolumn\"><tr><td>aaaaaaaaa</td></tr></table>");
		//alert(dgdata.tagName);
		/*
		dgdata.id="datacolumn";
		dgdata.style.cellpadding="0";
		dgdata.style.cellspacing="0";
		alert(document.createElement(dgc).tagName);
		alert(dgc);
		//dgdata.appendChild(document.createElement(dgc));
		dgdata.appendChild(document.createElement("<tbody>"+dgd+"</body>"));
		//dgdata.innerHTML=dgc+dgd;
		*/
		//document.getElementById("text").innerHTML=dgd;

		//treegrid hbar 水平滚动条
		var dghbar = document.createElement("DIV");
		dghbar.id = "hbar";
		dghbar.style.position = "absolute";
		dghbar.style.width = "100%";
		dghbar.style.height = "17px";
		dghbar.style.top = opts.height-17;
		dghbar.style.overflowX = "auto";
		dghbar.style.zIndex = "10";
		dghbar.onscroll = function(){scrh(opts);}
		dghbar.innerHTML = "<div style=\"width:100%;height:1px;overflow-y:hidden;\">&nbsp;</div>";

		//treegrid vbar 垂直滚动条
		var dgvbar = document.createElement("DIV");
		dgvbar.id = "vbar";
		dgvbar.style.position = "absolute";
		dgvbar.style.width = "17px";
		dgvbar.style.height = "100%";
		dgvbar.style.left = opts.width-17;
		dgvbar.style.overflowY = "auto";
		dgvbar.style.zIndex = "10";
		dgvbar.onscroll = function(){scrv(opts);}
		dgvbar.innerHTML = "<div style=\"width:1px;height:100%;overflow-x:hidden;\">&nbsp;</div>";

		//treegrid bgbar 滚动条背景
		var dgbgbar = document.createElement("DIV");
		dgbgbar.id = "bgbar";
		dgbgbar.style.background = "buttonface";
		dgbgbar.style.position = "absolute";
		dgbgbar.style.width = "100%";
		dgbgbar.style.height = "17px";
		dgbgbar.style.top = opts.height-17;
		dgbgbar.style.overflowX = "auto";
		dgbgbar.style.zIndex = "9";
		dgbgbar.style.display = "none";
		dgbgbar.innerHTML = "&nbsp;";

		//appendChild
		//dgframe.append( dgzero,dgslide,dgcolumn);
		dgframe.append( dgzero);
		dgframe.append( dgcolumn);
		dgframe.append( dgdata);
		dgframe.append(dghbar);
		dgframe.append(dgvbar);
		dgframe.append(dgbgbar);
		//opts.parentNode.appendChild(dgframe);
		document.getElementById("text").value=dgframe.html();

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

		var btt = framediv.css("borderTopWidth");//getCurrentStyle(framediv,"borderTopWidth");
		var btr = framediv.css("borderRightWidth");//getCurrentStyle(framediv,"borderRightWidth");
		var btb = framediv.css("borderBottomWidth");//getCurrentStyle(framediv,"borderBottomWidth");
		var btl = framediv.css("borderLeftWidth");//getCurrentStyle(framediv,"borderLeftWidth");
		var fh = framediv.css("height");//getCurrentStyle(framediv,"height");
		var zh =dgzero.style.height; //getCurrentStyle(dgzero,"height");
		var zbt = getCurrentStyle(dgzero,"borderTopWidth");
		var zbb = getCurrentStyle(dgzero,"borderBottomWidth");
		//if(isMSIE){
			opts.vbar.style.left = parseInt(opts.vbar.style.left)-parseInt(btr)-parseInt(btl);
		//}else{
			//framediv.height( parseInt(fh)-parseInt(btb)-parseInt(btt));
			//dgzero.style.height = parseInt(zh)-parseInt(zbb)-parseInt(zbt);
		//}

		opts.hbar.style.top = parseInt(opts.hbar.style.top)-parseInt(btb)-parseInt(btt);
		opts.bgbar.style.top = parseInt(dgbgbar.style.top)-parseInt(btb)-parseInt(btt);

		$.fn.treegrid.setwh($this,opts);
		//bind event
			var column=$this.find('.datacolumn thead tr td.column');
			column.bind("mouseover",function(){$.fn.treegrid.over(this);});
			column.bind("mouseout",function(){$.fn.treegrid.out(this);});
			column.bind("mousemove",function(){$.fn.treegrid.cc(event,this);});
			column.bind("mousedown",function(){$.fn.treegrid.rsc_d(event,this,opts);});
			column.bind("mouseup",function(){$.fn.treegrid.mouseup(this);});
			//$(this).find('#selectAll').bind("click",function(){$.fn.treegrid.selectall(this.checked);});

			var dataRow=$this.find('.datacolumn tbody tr');
			dataRow.bind("mouseover",function(){
				this.className="over";
			});
			dataRow.bind("mouseout",function(){
				if(this.selected=="true")this.className = "selectedrow";
				else this.className="";
			});

			$this.find('.datacolumn .treenode').bind("click",function(){toggleNode(this);});

	}
	function toggleNode(obj)
	 {
		var self=obj.parentNode.parentNode;
		self.children_display=self.children_display=="none"?"block":"none";
		//if(self.children_display=="block")
		{
			var next=null;
			next=self;
			while((next=next.nextSibling)!=null)
			{
				if(next.parent==self.parent)break;
				if(next.parent==self.self)
				{
					if(next.style.display=="none")
					{
						next.style.display="block";
						next.children_display="block";
						obj.src=src="image/folder.gif";
					}
					else
					{
						next.style.display="none";
						next.children_display="none";
						obj.src="image/folder-closed.gif";
					}
				}
				else
				{
					//if the node is collapsed, collapse all of its descendant
					if(self.children_display=="none")next.style.display="none";
					//if the node is expent, its descendant should be displayed as their status before they were collapse
					else next.style.display=next.children_display;
				}
			}
	    }

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
	$.fn.treegrid.setwh = function($this,opts){
		opts.hbar.style.display = "block";
		opts.vbar.style.display = "block";
		opts.hbar.childNodes[0].style.width = opts.dataobj.offsetWidth;
		opts.vbar.childNodes[0].style.height = opts.dataobj.offsetHeight;

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
			opts.hbar.style.width = opts.hbar.offsetWidth-17;
			opts.vbar.style.height = opts.vbar.offsetHeight-17;
			opts.vbar.childNodes[0].style.height = opts.vbar.childNodes[0].offsetHeight+17;
			opts.changeposv = false;
		}

		if(opts.hbar.childNodes[0].offsetWidth<=opts.hbar.offsetWidth+17 && !opts.changeposv){
			opts.bgbar.style.display = "none";
			opts.hbar.childNodes[0].style.width = 0;
			opts.hbar.style.width = opts.hbar.offsetWidth+17;
			opts.vbar.style.height = opts.vbar.offsetHeight+17;
			opts.changeposv = true;
			if(opts.vbar.offsetHeight-opts.dataobj.offsetHeight>opts.dataobj.offsetTop){// && isMSIE){
				//opts.leftobj.style.top = opts.leftobj.offsetTop+17;
				opts.dataobj.style.top = opts.dataobj.offsetTop+17;
			}
		}
	}

	//鼠标滚轮，列表滚动事件
	function mwEvent(e){
		e=e||window.event;
		if(e.wheelDelta<=0 || e.detail>0){
			vbar.scrollTop += 18;
		}else {
			vbar.scrollTop -= 18;
		}
	}
	function ae(obj){
		obj.bind("onmousewheel",mwEvent);
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
		opts.dataobj.style.top = -(opts.vbar.scrollTop);
	}

	function scrh(opts){
		opts.titleobj.style.left = -(opts.hbar.scrollLeft);
		opts.dataobj.style.left = -(opts.hbar.scrollLeft);
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
	$.fn.treegrid.rsc_d = function(e,obj,opts){
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
				//dgsort(obj,true,opts);
				obj.setAttribute("sort",0);
			}else{
				//dgsort(obj,false,opts);
				obj.setAttribute("sort",1);
			}
			obj.className = "sortdown";
		}
	}
	$.fn.treegrid.mouseup = function(obj){
		obj.className = "over";
	}
	function rsc_m(e,opts){
		if(opts.tdobj!=null){
			e=e||window.event;
			var newwidth = opts.ow-(opts.ml-e.clientX);
			if(newwidth>5){
				opts.tdobj.style.width = newwidth;
				opts.dataobj.rows[0].cells[opts.tdobj.cellIndex].style.width = newwidth;
			}else{
				opts.tdobj.style.width = 5;
				opts.dataobj.rows[0].cells[opts.tdobj.cellIndex].style.width = 5;
			}
		$.fn.treegrid.setwh(this,opts);
			scrh(opts);
		}
	}
	function rsc_u(e,opts){
		if(opts.tdobj!=null){
			e=e||window.event;
			var newwidth = opts.ow-(opts.ml-e.clientX);
			if(newwidth>5){
				opts.tdobj.style.width = newwidth;
				opts.dataobj.rows[0].cells[opts.tdobj.cellIndex].style.width = newwidth;
			}else{
				opts.tdobj.style.width = 5;
				opts.dataobj.rows[0].cells[opts.tdobj.cellIndex].style.width = 5;
			}
			if(opts.tdobj.releaseCapture){
				opts.tdobj.releaseCapture();
			}
			opts.ml = 0;
			opts.ow = 0;
			opts.tdobj = null;
		}
		$.fn.treegrid.setwh(this,opts);
		scrh(opts);
	}

	$.fn.treegrid.cc = function(e,obj){
		//var px = isMSIE?e.offsetX:e.layerX-obj.offsetLeft;
		var px = e.offsetX;
		if(px>obj.offsetWidth-6 && px<obj.offsetWidth){
			obj.style.cursor = "col-resize";
		}else{
			obj.style.cursor = "default";
		}
	}

	$.fn.treegrid.over = function(obj){
		obj.className = "over";
	}

	$.fn.treegrid.out = function(obj){
		obj.className = "column";
	}

	$.fn.treegrid.dataover = function(obj){
		if(obj.rowIndex!=nowrow){
			obj.className = "dataover";
		}
	}

	$.fn.treegrid.dataout = function(obj){
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
	$.fn.treegrid.findkey = function(keys,opts){
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
	$.fn.treegrid.setdata = function($this,opts,arrdata){
		if(arrdata && arrdata.length>0){
			$this.html("");
			opts.data = arrdata;
			changeposv = true;
			nowrow = null;
			this.init($this,opts);
		}
	}

	$.fn.treegrid.loadData = function($this,opts) {
		$.getJSON(opts.url,function(data) {		
				if(data.rowwidth)
				$.each(data.rowwidth, function(i, width) {
					opts.colwidth[i]=width;
				});
				$.each(data.children, function(i, row) {
					if(i==0)
					{
						var index=0;
						for(j in row)
						{
						   if(j!="children")opts.columns[index++]=j;
						}
					}
				});
				opts.data=data.children;
				$.fn.treegrid.setdata($this,opts,opts.data);
			}
		);

	}
	$.fn.treegrid.getSelected = function(datagrid) {
		//var datarows=$.fn.treegrid.config.dataobj.rows;
		//var datarows=$(this).find(".datacolumn");
		$.each(datagrid.find(".datacolumn tbody tr"), function(i, row){
			alert(row.selected);
		});
		/*
		$.each($.fn.treegrid.config.dataobj.rows, function(i, row) 
		{
					//row[opts.columns[a]]
					//alert(row.selected);
		});
		*/
	}


})(jQuery);  

