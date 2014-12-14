 (function($) { 
$.fn.datagrid= function (options){
	var defaults=
	{
	callname : "datagrid",
	width : 0,
	_width : 0,
	height : 0,
	_height : 0,
	minus_width:0,
	minus_height:0,
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
	 titleobj : null,
	 dataobj : null,
	 pager: null,
	 pageObj: null,
	 
	 toolObj:null,//jquery obj
	 editable:false,
	 isMSIE : true,

	//改变列宽初始位置
	 ml : 0,
	//改变列宽对象初始宽度
	 ow : 0,
	//改变列宽对象
	 tdobj : null,
	//当前选定行索引
	 nowrow : null
	}
	defaults.rid=$(this).attr("id");

	defaults.isMSIE =navigator.appName == "Microsoft Internet Explorer";
	var methods={
		init:function(){
		var opts = $.extend({}, defaults, options); 
		$(this).data("options",opts);
	    return this.each(function(i) {     
			var sw=this.parentNode.clientWidth-2;//$(this).width();
			var sh=this.parentNode.clientHeight-2;
			//init the size of the grad
			if(opts.width==0)
			{
				opts._width=sw;
				if(opts.minus_width>0)opts._width-=opts.minus_width;
			}
            else if((""+opts.width).indexOf("%")>0)
			{
				opts._width=sw * opts.width.substring(0,(""+opts.width).indexOf('%'))/100;
			}
			else
			{
				opts._width=opts.width;
			}
			if(opts.height==0)
			{
				opts._height=sh;
				if(opts.minus_height>0)opts._height-=opts.minus_height;
			}
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
				loadData($(this),opts);
			}
			else 
				init($(this),opts);
		});
		},
		select: function() {
			if($(this).attr("class")!="datagrid" && $(this).attr("class")!="treegrid")return;
			var selected=[];
			var $this=$(this);
			var j=0;
			$.each($this.find(".datacolumn tbody tr"), function(i, row){
				if(row.selected=="true")
				{
					//var rowid=row.rowid;
					var rowid=$(row).attr("rowid");
					selected[j++]=$this.data("options").data[rowid];
				}
			});    
			return selected;
		  },
		refresh :function()
		 {
			$this=$(this);
				var opts=$this.data("options");
				var form=document.getElementById(opts.linkedForm);
				if(opts.url)loadData($this);
				else
				{
					form.onsubmit();
				}
		 },
		search:function(form)
		{
			$this=$(this);
			form.page.value=0;
			loadData($this,null,form);
		},
		jumpTo:function(page)
		{
			$this=$(this);
			jumpToPage($this,page,$this.data("options"));
		},
		resize : function(w,h){
			var sw=w;
			var sh=h;//$(this).height();
			var opts=$(this).data("options");
			if((""+opts.width).indexOf("%")>0)
			{
					opts._width=sw * opts._width.substring(0,(""+opts._width).indexOf('%'))/100;
			}
			else
				{
					opts._width=sw;
				}
			if((""+opts.height).indexOf("%")>0)
			{
					opts._height=sh * opts._height.substring(0,(""+opts._height).indexOf('%'))/100;
			}
			else
			{
					opts._height=sh;
			}
			setSize($(this),opts,opts._width,opts._height);
		}


	}


	if (methods[options]) {
            return methods[options].apply(this, Array.prototype.slice.call(arguments, 1));
    } else if (typeof options === 'object' || !options) {
            return methods.init.apply(this, arguments);
    } else {
            $.error('Method ' + options + ' does not exist on jQuery.DataGrid');
    }



}
	function gen_toolbar(opts)
	 {
		if(opts.toolbar.length==0)return null;
		var bar = "<div class='toolbar'>";
		for(i in opts.toolbar)
		 {
			//show a message at the right of the toolbar
			if(opts.toolbar[i].btnClass=="text")bar+="<span  class='paginate.string' style='float:right'>"+opts.toolbar[i].text+"</span>";
			//separator
			else if(opts.toolbar[i].btnClass=="Separator")bar+="<div  class=\""+opts.toolbar[i].btnClass+"\" />";
			else 
			{
				var value="";
				var className=opts.toolbar[i].btnClass;
				//show button text
				if(opts.toolbar[i].display=="text")
				{
					//only has button text, but no ico
					value=opts.toolbar[i].text;
				}
				else if(opts.showToolbarText==true)
				{
					//show ico and text
					value=opts.toolbar[i].text;
					className+=" display_text";
				}
				bar+="<span  class=\""+className+"\" btnIndex='"+i+"' title='"+opts.toolbar[i].text+"'>"+value+"</span>";
			}
		 }
		bar+="</div>";
		return bar;

	 }
	init = function($this,opts){
		//var $this=$(this);
		$this.css("width",opts._width);
		$this.css("height",opts._height);
		//init the data 
		var dgc = "";
		var avgw = opts._width-20
		if(opts.multiple){
			avgw = avgw-30		
		}
		avgw = Math.floor(avgw/opts.columns.length);
		if(opts.columns.length>0){
			dgc = '<thead><tr class="title">';
			
			if(opts.multiple){
				dgc += '<td class="column" style="width:30px;text-align:center;padding:0;text-indent:0;text-align:center;"><input id="selectAll" type="checkbox" style="margin:0;" ></td>';
			}
			
			for(var cc=0;cc<opts.columns.length;cc++){
				if(opts.colwidth.length>cc){
					dgc += '<td class="column" width="'+opts.colwidth[cc]+'"  >'+opts.columns[cc]+'<span class="arrow"></span></td>';
				}else{
					dgc += '<td class="column" width="'+avgw+'" >'+opts.columns[cc]+'<span class="arrow"></span></td>';
				}
			}
			dgc += '<td class="lastcolumn" >&nbsp;</td></tr></thead>';
		}

		var dgd = "<tbody><tr></tr></tbody>";
		
		if(opts.data.length>0){
			dgd="<tbody>";
			for(var r=0;r<opts.data.length;r++){
				if(!opts.data[r])continue;
				dgd += '<tr rowid='+r+'>';
				
				if(opts.multiple){
					dgd += '<td class="checkboxColumn"><input type="checkbox" style="margin:0;" class="dgchkbox"></td>';
				}
				
				//only show the data with columns
				for(var c=0;c<opts.columns.length;c++){
					if(opts.colwidth.length>c){
						dgd += '<td >'+opts.data[r][c]+'</td>';
						//dgd += '<td width="'+opts.colwidth[c]+'"><input value="'+opts.data[r][c]+'"></td>';
					}else{
						dgd += '<td >'+opts.data[r][c]+'</td>';
						//dgd += '<td>'+opts.data[r][c]+'</td>';
					}
				}
				dgd += '<td class="lastdata" >&nbsp;</td></tr>';
			}
			dgd+="</tbody>";
		}
		var pager=null;
		if(opts.pager!=null && opts.pager.total>0)opts.pageObj=$(paginate(opts.pager.current_page,opts.pager.pagesize,opts.pager.total));
		
		var toolbar_html=gen_toolbar(opts);
		var toolbar=null;
		if(toolbar_html!=null)toolbar=$(gen_toolbar(opts));

		//datagrid frame 
		var mainframe=$this;
		mainframe.empty();
		var dgframe = $("<div class='datapanel' style='padding:0px;margin:0px;overflow-x:auto;overflow-y:auto;overflow:auto;'></div>")//document.createElement("DIV");

		dgframe.oncontextmenu = function(){return false}
		dgframe.onselectstart = function(){return false}
		ae(dgframe,opts);

		var dgzero = document.createElement("div");
		dgzero.id="zreo";
		dgzero.className="zreo";

		//datagrid column 标题栏
		var dgcolumn = $("<table cellpadding=\"0\" cellspacing=\"0\" id=\"titlecolumn\" class=\"titlecolumn datacolumn\">"+dgc+"</table>");
		var titlebarMask = $("<div cellpadding=\"0\" cellspacing=\"0\" class=\"titlecolumn_mask\" > </div>");

		//datagrid data 数据
		var dgdata = $("<table cellpadding=\"0\" cellspacing=\"0\" id=\"datacolumn\" class=\"datacolumn\">"+dgd+"</table>");
		if(toolbar!=null)dgframe.append( toolbar);
		mainframe.append(toolbar);
		mainframe.append( dgcolumn);
		mainframe.append( titlebarMask);
		dgframe.append( dgdata);

		mainframe.append(dgframe);
		if(opts.pageObj!=null)
		{
			mainframe.append(opts.pageObj);
		}

		$("document").keydown(function(){
			 updown();
		});
		opts.framediv = dgframe;
		opts.titlebarMask=titlebarMask;
		opts.titleobj = dgcolumn.get(0);//document.getElementById("titlecolumn");
		opts.dataobj = dgdata.get(0);//document.getElementById("datacolumn");
		opts.toolObj=toolbar;
		opts.titlebarMask.css("height",dgcolumn.height()+1);
		setSize($this,opts,mainframe.outerWidth(),mainframe.outerHeight());


		//dgframe.bind("click",function(e){e=e||window.event;getrow(e,opts);});
		dgframe.bind("mousemove",function(e){e=e||window.event;onMoveColumnWidth(e,opts);});
		dgcolumn.bind("mousemove",function(e){e=e||window.event;onMoveColumnWidth(e,opts);});
		$(document).bind("mouseup",function(e){e=e||window.event;setColumnWidth(e,opts);});
		
		dgframe.bind("scroll",function(e){
			//if($(this).scrollTop()>=0){
			//	$(opts.titleobj).css("top",$(this).scrollTop()-1);
			//}
			if($(this).scrollLeft()>=0)
			{
				$(dgcolumn).css("left",-$(this).scrollLeft());
			}
		});
		
		//document.getElementById("text").value=mainframe.prop("outerHTML");

		//bind event
		var column=$this.find('.datacolumn thead tr td.column');
		column.bind("mouseover",function(){onTitleMouseOver(this);});
		column.bind("mouseout",function(){onTitleMouseOut(this);});
		column.bind("mousemove",function(){onTitlePanelMouseMove(event,this);});
		column.bind("mousedown",function(){onTitlePanelMouseDown(event,this,opts);});
		column.bind("mouseup",function(){onTitlePanelMouseUp(this);});
		//$(this).find('#selectAll').bind("click",function(){selectAll(this.checked);});
		//make the data in the grid can edited
		if(opts.editable)
		{
			var dataColumn=$this.find('.datacolumn tbody tr td');
			dataColumn.dblclick(function(){
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
		dataRow.bind("click",function(e){
			e=e||window.event;getrow(e,opts);
			if(opts.onclick)
			{
				var rowid=$(this).attr("rowid");
				var data=opts.data[rowid];
				opts.onclick(this,data);
			}
		});
		dataRow.bind("mouseover",function(){
			this.className="over";
			if(opts.onmouseover)
			{
				var rowid=$(this).attr("rowid");
				var data=opts.data[rowid];
				opts.onmouseover(this,data);
			}
		});
		dataRow.bind("mouseout",function(){
			if(this.selected=="true")this.className = "selectedrow";
			else this.className="";
			if(opts.onmouseout)
			{
				var rowid=$(this).attr("rowid");
				var data=opts.data[rowid];
				opts.onmouseout(this,data);
			}
		});
		$this.find('#selectAll').bind("click",function(){
			selectAll(opts,this.checked)
		});

		$this.find('.dgchkbox').bind("click",function(e){
			var row=this.parentNode;
			row.click();
				//e=e||window.event;getrow(e,opts);
		});

		$this.find('.paginate .pagesize').bind("change",function(){
			var pagesize=$(this).val();
			//jumpToPage($this,page,opts);
			var form=document.getElementById(opts.linkedForm);
			form["pageSize"].value=pagesize;
			setCookie("PageSize",pagesize);
			if(opts.url)loadData($this);
			else
			{
				form.onsubmit();
			}
		});
		$this.find('.paginate .navigator').bind("click",function(){
			var page=$(this).attr("page");
			jumpToPage($this,page,opts);
		});
		$this.find('.paginate .navigator_longstring').bind("click",function(){
			var page=$(this).attr("page");
			jumpToPage ($this,page,opts);
		});
		$this.find('.toolbar span').bind("click",function(){
			var btnIndex=$(this).attr("btnIndex");
			var bn=this.className;
			var text=opts.toolbar[btnIndex].text;
			var className=opts.toolbar[btnIndex].btnClass;
			var src=opts.toolbar[btnIndex].src;
			var width=opts.toolbar[btnIndex].width;
			var height=opts.toolbar[btnIndex].height;
			var target=opts.toolbar[btnIndex].target;
			var rowid=null;
			if(opts.multiple==true)
			{
				var selected=[];
				var dg=$this;
				var j=0;
				var nowrow=null;
				$.each(dg.find(".datacolumn tbody tr"), function(i, row){
					if(row.selected=="true")
					{
						rowid=$(row).attr("rowid");
						return false;
					}
				});    
			}
			else
			{
				rowid=$(opts.dataobj.rows[opts.nowrow ]).attr("rowid");
			}
			var row=opts.data[rowid];
			if(rowid && rowid!="" && src)
			{
				for( var i=0;i<opts.data[rowid].length; i++)
				{
					src=src.replace(new RegExp("\\{"+i+"\\}","g"),row[i]);
				}
			}

			if((/^javascript *:/i).test(src))
			{
				var sc=src.replace(/^javascript *:/i,"");
				eval(sc);
				return false;
			}
			if(className=="Home")
			{
				var win =_window.windows[_window.focusWindowId];
				win.SetContent("[url]"+src);

			}
			else if(className=="Refresh")
			{
				if(target)
				{
					//load into a named panel by ID
					$('#'+target).empty();
					$('#'+target).load(src);
					reDefineHTMLActions(target);
				}
				else
				{
					if(opts.url)loadData($this);
					else
					{
						var form=document.getElementById(opts.linkedForm);
						//alert($(form).find(":input").serialize())
						form.onsubmit();
					}
				}
			}
			else if(className=="Edit")
			{
				if(opts.multiple==true)
				{
					var selected=[];
					var dg=$this;
					var j=0;
					var nowrow=null;
					$.each(dg.find(".datacolumn tbody tr"), function(i, row){
						if(row.selected=="true")
						{
							//var rowid=row.rowid;
							var rowid=$(row).attr("rowid");
							selected[j++]=opts.data[rowid];
							nowrow=row;
						}
					});    
					if(selected.length!=1)
					{
						openAlert(JSMsg_Datagrid.selectOneRow,"Edit",function(btn){return false;});
					}
					else
					{
						if(!target)target="dialog";
						if(target=="dialog")openDialog(src,text,true,width,height);
						else openWorkWindow(src,text)
					}
				}
				else
				{
					if(opts.nowrow==null)
					{
						openAlert(JSMsg_Datagrid.selectOneRow,"Edit",function(btn){return false;});
					}else
					{
						if(!target)target="dialog";
						if(target=="dialog")openDialog(src,text,true,width,height);
						else openWorkWindow(src,text)
					}
				}

			}
			else if(className=="Delete")
			{
				if(opts.multiple==true)
				{
					var selected=[];
					var dg=$this;
					var j=0;
					$.each(dg.find(".datacolumn tbody tr"), function(i, row){
						if(row.selected=="true")
						{
							//var rowid=row.rowid;
							var rowid=$(row).attr("rowid");
							selected[j++]=opts.data[rowid];
						}
					});    
					if(selected.length<=0)
					{
						openAlert(JSMsg_Datagrid.selectOneRow,"Delete",function(btn){return false;});
					}
					else
					{
						var ids="";
						src=opts.toolbar[btnIndex].src;
						//src=src.replace(new RegExp("\\{ids\\}","g"),ids);
						for( var i=0;i<selected[0].length; i++)
						{
							var rowData="";
							for( var j=0;j<selected.length; j++)rowData+=selected[j][i]+",";
							if(rowData.length>0)rowData=rowData.substring(0,rowData.length-1);
							src=src.replace(new RegExp("\\{"+i+"\\}","g"),rowData);
						alert(src);
						}
						openConfirm({
							content:JSMsg_Datagrid.confirmDelete,
							title:'Confirm',
							ok:function(){
								$.ajax({ 
									url: src, 
									//context: document.body, 
									//data :   $(form).find(":input").serialize()  ,
									type:"POST",
									dataType:"json",
									success: function(data){
										parseJsonResponse(data,opts.rid);
										
									},
									error: function(XMLHttpRequest, textStatus, errorThrown) 
									{
										openAlert(XMLHttpRequest.responseText,"Error",function(btn){return false;});
									}

							  });
							},
							cancel:function(){}
						});
					}
					return false;

				}
				else
				{
					if(opts.nowrow==null)
					{
						openAlert(JSMsg_Datagrid.selectOneRow,"Delete",function(btn){return false;});
					}
					else
					{
						openConfirm({
							content:JSMsg_Datagrid.confirmDelete,
							title:'Confirm',
							ok:function(){
								$.ajax({ 
									url: src, 
									//context: document.body, 
									//data :   $(form).find(":input").serialize()  ,
									type:"POST",
									dataType:"json",
									success: function(data){
										parseJsonResponse(data,opts.rid);
										
									},
									error: function(XMLHttpRequest, textStatus, errorThrown) 
									{
										openAlert(XMLHttpRequest.responseText,"Error",function(btn){return false;});
									}

							  });
							},
							cancel:function(){}
						});
					}
				}

			}
			else if(className=="Help")
			{
				openDialog(src,text,true);
			}
			else 
			{
				//not a pre-defined button
				var re =new RegExp("\{[0-9]{1,3}\}"); 
				if(re.test(src))
				{
					//if still has parameters:"{N}"
					openAlert(JSMsg_Datagrid.selectOneRow,"Delete",function(btn){return false;});
				}
				else
				{
					if(!target)target="dialog";
					if(target=="dialog")openDialog(src,text,true,width,height);
					else if(target=="window")openWorkWindow(src,text);
					else if(target=="self")
					{
						var win =_window.windows[_window.focusWindowId];
						win.SetContent("[url]"+src);
					}
					else
					{
						//load into a named panel by ID
						$('#'+target).load(src,null,function(response,status,xhr){
							alert(xhr.responseText);
						});
					}
				}
			}
			
		});
	}

		setSize = function($this,opts,w,h){
			opts._width=w;
			opts._height=h;
			$this.css("width",opts._width);
			$this.css("height",opts._height);
			var toolbarHeight =0;
			if(opts.toolObj!=null)
			{
				toolbarHeight=opts.toolObj.outerHeight();
				opts.titleobj.style.top=toolbarHeight+"px";
				opts.titlebarMask.css("top", $(opts.toolObj).outerHeight());
				opts.titlebarMask.css("height", $(opts.titleobj).height()-1);
			}
			else if(opts.titlebarMask!=null)
			{
				opts.titlebarMask.css("height", $(opts.titleobj).height()-1);
			}
			var pageBarHeight=0;
			if(opts.pageObj!=null && opts.pager.total>0)
			{
				if(opts.pageObj.css("width")>w)opts.pageObj.css("width",w);
				pageBarHeight=opts.pageObj.outerHeight();
			}

			if(opts.titleobj!=null && opts.dataobj!=null)
			{
				var dgc = "";
				var avgw = opts._width-20;
				if(opts.multiple)avgw=avgw-30;
				avgw = Math.floor(avgw/opts.columns.length);
				opts.framediv.css("width",w);
				opts.framediv.css("top", $(opts.titleobj).outerHeight());
				opts.framediv.css("height", h-pageBarHeight-toolbarHeight-$(opts.titleobj).outerHeight());

				var startIndex=0;
				if(opts.multiple)startIndex=1;
				for(var cc=startIndex;cc<=opts.columns.length+startIndex-1;cc++){
					if(cc-startIndex<opts.colwidth.length){
						opts.titleobj.rows[0].children[cc].style.width=opts.colwidth[cc-startIndex]+"px";
						if(opts.dataobj.rows[0].children[cc])opts.dataobj.rows[0].children[cc].style.width=opts.colwidth[cc-startIndex]+"px";
					}else{
						opts.titleobj.rows[0].children[cc].style.width=avgw+"px";
						if(opts.dataobj.rows[0].children[cc])opts.dataobj.rows[0].children[cc].style.width=avgw+"px";
					}
				}
			}
		}

	 function paginate(currentPage,pagesize, totalRecords)
	 {
		var pager="";
        if (totalRecords<0)
            totalRecords = 0;
        if (currentPage<0)
            currentPage = 0;
        if (pagesize <=0 )
            pagesize=10;
        var pages = Math.ceil(totalRecords / pagesize) ;
        pager+=("<table id='paginate' class='paginate'><tbody><tr><td>") ;
        var pageSel="<select id='paginate_pagesize' class='pagesize'>";
		var sizes=[2, 5, 10, 20, 50, 100];
        for(var i in sizes)
		{
			var selected="";
			if(sizes[i]==pagesize)selected="selected";
			pageSel+="<option value='"+sizes[i]+"' "+selected+">"+sizes[i]+"</option>";
		}
		pageSel+="</select>";

		pager+=("<span class=\"string\">"+JSMsg_Paginate.total + totalRecords + JSMsg_Paginate.records+","+Math.ceil(totalRecords/pagesize)+ JSMsg_Paginate.page+" /  "+ JSMsg_Paginate.everyPage+JSMsg_Paginate.display+pageSel+ JSMsg_Paginate.records+"</span><span class='navigator_panel'>");

        pager+=("<a class=\"navigator_longstring\" page=\"0\"><span class=\"ico\">9</span>"+JSMsg_Paginate.firstPage +"</a>");
        if(currentPage-4>=0)
        {
            pager+=("<a class=\"navigator\" page=\""+(currentPage-5)+"\"><span class=\"ico\">3</span></a>");
        }
        else
        {
            pager+=("<a class=\"navigator\" ><span class=\"ico\">3</span></a>");
        }
		//pages before current
        for(var i=currentPage-4>=0?currentPage-4:0;i<currentPage;i++)
        {
            pager+="<a class=\"navigator\" page=\""+i+"\">"+(i+1)+"</a>";
        }
		//current page
        pager+="<a class=\"navigator_current\">"+(currentPage+1)+"</a>";
        //pages after current
        for(var i=Number(currentPage)+1;i<currentPage+5 && i<pages;i++)
        {
            pager+="<a class=\"navigator\" page=\""+i+"\">"+(i+1)+"</a>";
        }
		//the last page
        if (currentPage >= pages - 1) 
        {
            pager+=("<a class=\"navigator\"><span class=\"ico\">4</span></a>");
            pager+=("<a class=\"navigator_longstring\">"+JSMsg_Paginate.lastPage +"<span class=\"ico\">:</span></a>");
        } 
        else 
        {
           if(currentPage+3<=pages-1)
            {
                pager+=("<a class=\"navigator\" page=\""+(currentPage+5)+"\"><span class=\"ico\">4</span></a>");
            }
           else
           {
                pager+=("<a class=\"navigator\"><span class=\"ico\">4</span></a>");
           }
            pager+=("<a class=\"navigator_longstring\" page=\"" + (pages - 1) +  "\">"+JSMsg_Paginate.lastPage +"<span class=\"ico\">:</span></a>");
        }
        
        pager+=("</span></td></tr></tbody></table>") ;

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
	//鼠标滚轮，列表滚动事件
	function mwEvent(e,delta,opts){
		
		e=e||window.event;
		e.preventDefault();
		e=e.originalEvent;
		if(e.wheelDelta<=0 || e.detail>0){
			//opts.vbar.scrollTop += 18;
			opts.framediv.scrollTop(opts.framediv.scrollTop()+17);
		}else {
			//opts.vbar.scrollTop = opts.vbar.scrollTop-18;
			opts.framediv.scrollTop(opts.framediv.scrollTop()-17);
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



	//选择行
	function getrow(e,opts){
		e=e||window.event;
		var esrcobj = e.srcElement?e.srcElement:e.target;
		if(esrcobj.parentNode.tagName=="TR"){
			var epobj = esrcobj.parentNode;
			var eprowindex = epobj.rowIndex;
			var checkbox=epobj.childNodes[0].childNodes[0];


			if(opts.multiple==true)
			{
				if(epobj.selected!="true")
				{
					checkbox.checked = true;
					epobj.selected="true";
					opts.dataobj.rows[eprowindex].className = "selectedrow";
				}
				else 
				{
					checkbox.checked = false;
					epobj.selected="false";
					opts.dataobj.rows[eprowindex].className = "";
				}
			}
			else
			{
				//if(eprowindex!=0)
				{
					if(opts.nowrow!=null)
					{
						opts.dataobj.rows[opts.nowrow].selected="false";
						opts.dataobj.rows[opts.nowrow].className = "";
					}
					if(opts.nowrow==eprowindex)
					{
						//deselect the row
						epobj.selected="false";
						opts.dataobj.rows[eprowindex].className = "";
						opts.nowrow = null;
					}
					else
					{
						//select the row
						epobj.selected="true";
						opts.dataobj.rows[eprowindex].className = "selectedrow";
						opts.nowrow = eprowindex;
					}
				}
			}
			
		}
	}

	function selectAll(opts,checked){
		for(var i=0;i<opts.dataobj.childNodes[0].rows.length;i++){
			var rowsobj = opts.dataobj.childNodes[0].rows[i];
			var checkbox=rowsobj.childNodes[0].childNodes[0];
			checkbox.checked = checked;
			if(checked)
			{
				rowsobj.selected="true";
				rowsobj.className = "selectedrow";
			}
			else 
			{
				rowsobj.selected="false";
				rowsobj.className = "";
			}
		}
	}

	//change the column's width
	function onTitlePanelMouseDown  (e,obj,opts){
		//var px = opts.isMSIE?e.offsetX:e.layerX-obj.offsetLeft;
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
			/*
			if(opts.nowrow!=null){
				opts.dataobj.rows[opts.nowrow].className = "";
			}
			*/
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
	function onTitlePanelMouseUp  (obj){
		obj.className = "over";
	}
	function onMoveColumnWidth(e,opts){
		if(opts.tdobj!=null){
			e=e||window.event;
			var newwidth = opts.ow-(opts.ml-e.clientX);

			if(newwidth>5){
				opts.tdobj.style.width = newwidth+"px";
				opts.dataobj.rows[0].cells[opts.tdobj.cellIndex].style.width = newwidth+"px";
				opts.colwidth[opts.tdobj.cellIndex]=newwidth;
			}else{
				opts.tdobj.style.width = 5+"px";
				opts.dataobj.rows[0].cells[opts.tdobj.cellIndex].style.width = 5+"px";
				opts.colwidth[opts.tdobj.cellIndex]=5;
			}
		}
	}
	function setColumnWidth(e,opts){
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
	}

	function onTitlePanelMouseMove(e,obj){
		//var px = isMSIE?e.offsetX:e.layerX-obj.offsetLeft;
		var px = e.offsetX;
		if(px>obj.offsetWidth-6 && px<obj.offsetWidth){
			obj.style.cursor = "col-resize";
		}else{
			obj.style.cursor = "default";
		}
	}

	onTitleMouseOver = function(obj){
		obj.className = "over";
	}

	onTitleMouseOut = function(obj){
		obj.className = "column";
	}

	onDataCellsMouseOver = function(obj){
		if(obj.rowIndex!=nowrow){
			obj.className = "dataover";
		}
	}

	onDataCellsMouseOut = function(obj){
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

	//sort the data grid
	function dgsort(obj,asc,opts){
		var rl = opts.data.length;
		var ci = obj.cellIndex;
		
		var colsWidths=[];
		var cells=opts.dataobj.rows[0].cells;
		for(var i=0;i<cells.length;i++)
		{
			colsWidths[i]=cells[i].style.width;
		}

		var rowsobj = [];
		for(var i=0;i<opts.dataobj.childNodes[0].rows.length;i++){
			rowsobj[i] = opts.dataobj.childNodes[0].rows[i];
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
			opts.dataobj.childNodes[0].appendChild(rowsobj[i]);
			if(rowsobj[i].className == "selectedrow"){opts.nowrow=i;};
		}
		//set the first row's width
		for(var cc=0;cc<colsWidths.length;cc++){
				opts.dataobj.rows[0].children[cc].style.width=colsWidths[cc];
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
	findKey = function(keys,opts){
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
	jumpToPage = function($this,page,opts){
		if(page)
		{
			opts.pager.current_page=page;
			if(opts.url)
			{
				//refresh data from a From
				if(opts.linkedForm)
				{
					var form=document.getElementById(opts.linkedForm);
					form["page"].value=opts.pager.current_page;
					loadData($this,null,form);
				}
				else
				{
					loadData($this,opts);
				}
			}
			else
			{
				var form=$("#"+opts.linkedForm);
				form.find(":input[name=page]").val(opts.pager.current_page);
				form.submit();
			}
		}
	}


	//加载数据
	setdata = function($this,opts,arrdata){
		if(arrdata){
			//$this.empty();
			opts.data = arrdata;
			nowrow = null;
			init($this,opts);
			reDefineHTMLActions($this.attr("id"));
		}
	}
	loadData = function($this,options,form) {
		var param="";
		var opts=options;
		if(!opts && !form) form=document.getElementById($this.data("options").linkedForm);
		if(opts && opts.pager)param="page="+(opts.pager.current_page)+"&pagesize="+opts.pager.pagesize;
		if(opts && opts.params)param= param +"&"+opts.params; 

		var url=""
		if(opts)url=opts.url;
		else if(form)
		{
			url=form.action;
			param=$(form).find(":input").serialize();
		}
		if(!opts)opts=$this.data("options");
		jQuery.ajax({
            type: "post",
            async: false,
            url: url,
            data: param,
            //contentType: "application/json; charset=utf-8",
            dataType: "JSON",
            cache: false,
            success: function (data) {
				if(data.pager)
					opts.pager = {
						current_page: data.pager.current_page,
						pagesize: 	  data.pager.pagesize,
						total:		  data.pager.total,
						form:		  data.pager.form
					};
				if(data.colwidth)
				$.each(data.colwidth, function(i, width) {
					opts.colwidth[i]=width;
				});
				opts.data=[];
				$.each(data.data, function(i, row) {
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
				opts.nowrow=null;
				setdata($this,opts,opts.data);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                //alert("Error:"+err);
				$this.html(XMLHttpRequest.responseText);
            }
        });

	}

	$.fn.extend({         
	}); 
})(jQuery);  
