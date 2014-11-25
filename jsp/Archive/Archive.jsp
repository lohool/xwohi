<%@ page session="true" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
	<script src="win/jstree/jstree.js"></script>
	<script src="js/modalWindow.js"></script>
	<link rel="stylesheet" href="win/jstree/themes/default/style.min.css" />
<script>
 function selectCatalogue(selField)
  {
	  //alert(getSelectedOption("ArchiveSearch_form",selField))
	  openDialog("jsp/Archive/dialog.jsp?cataId="+ArchiveSearch_form["vo.catalogue.id"].value,"Select Catalogue",true);
  }

function ArchiveSearch_form_submit(form)
{
	if(ArchiveSearch_form.isSearchSub.checked)
	{
		ArchiveSearch_form["vo.absolutePath"].value="/"+ArchiveSearch_form["vo.catalogue.id"].value+"/";
	}
	else
	{
		ArchiveSearch_form["vo.absolutePath"].value="";
		//ArchiveSearch_form["vo.absolutePath"].disabled=true;
	}
	return panelSearch(form,'Archive_panel');
}
</script>

<div class="page" >
	<div id="Archive_search_panel" class="panel" style="height:55px">
	        <ww:form action="ArchiveList" method="post" id="ArchiveSearch_form" name="ArchiveSearch_form" namespace="/Archive" validate="true" theme="simple" onsubmit="return ArchiveSearch_form_submit(this);">

			<p>
			<xwohi:i18n text="Archive.title"/>:<ww:textfield  name="vo.title" />
			Catalogue:
			<INPUT TYPE="text" NAME="cataPath" value="Root$>">
			<INPUT TYPE="button" value="Sel.." class="biground" onclick="selectCatalogue('cataID');">
			<INPUT TYPE="hidden" NAME="vo.catalogue.id" value="1">
			<INPUT TYPE="hidden" NAME="vo.absolutePath">

			<INPUT TYPE="checkbox" NAME="isSearchSub" checked>
			<xwohi:i18n text="search_sub_archioveCatalogue"/>
			<xwohi:i18n text="Archive.timeLimit"/>
			<SELECT NAME="vo.timeLimit">
			<option value="">--</option>
			<option value="1" ><xwohi:i18n text="ArchiveCatalogue.time_limit.forever"/></option>
			<option value="2" ><xwohi:i18n text="ArchiveCatalogue.time_limit.long"/></option>
			<option value="3" ><xwohi:i18n text="ArchiveCatalogue.time_limit.short"/></option>
			</SELECT>
			</p>
			<p>
			<xwohi:i18n text="Archive.content"/>
			<ww:textfield name="vo.content"/>
			<xwohi:i18n text="Archive.editor"/>
			<ww:textfield name="vo.editor"/>
			<xwohi:i18n text="Archive.createTime"/>
			<ww:textfield id="beginTime" name="beginTime" cssClass="datepicker"/>--<ww:textfield name="endTime" cssClass="datepicker"/>

			<INPUT TYPE="submit" class="button biground">
			</p>
            </ww:form>
	</div>
	<div  class="panel" style="position:absolute;left:0px;width:200px;border:solid 0px red;" layoutHeight="78"> 
	<div id="Archive_group_panel" class="panel" style="background-color:#FFFFFF;border:0px;padding:0px;overflow:auto;" layoutHeight="10"> 
	</div>

	</div>
	<div id="Archive_panel" class="panel" style="position:absolute;left:211px;width:100%;border:solid 0px #ccc" layoutWidth="222" layoutHeight="78" > 
		<div  style="top:0px;width:100%;height:100%;border:solid 1px #CAE4FF;background-color:#FFFFFF" > </div>
	</div>
</div>
	<script>
	$(document).ready(function() {
		//$('.datepicker').timepicker({
		$('.datepicker').datetimepicker({
		dateFormat:"yy-mm-dd",
		timeFormat: 'HH:mm:ss',
		stepHour: 1,
		stepMinute: 1,
		stepSecond: 1

		});
	});
	$('#Archive_group_panel').jstree({
			"core" : 
			{
				"animation" : 0,
				'data' : {
					'url' : 'Archive/ArchiveCatalogueList.action',
					'data' : function (node) {
						return { 'parentId' : node.id=="#"?1:node.id,"pageSize":"100"};
					}
				},
				'check_callback' : function (operation, node, node_parent, node_position) 
				{
					// operation can be 'create_node', 'rename_node', 'delete_node', 'move_node' or 'copy_node'
					// in case of 'rename_node' node_position is filled with the new node name     
					return true;			
				},
				'themes' : {
						'responsive' : false,
						'variant' : 'small',
						'stripes' : true
				}
			},
			"plugins" : ["types", "contextmenu", "dnd", "search", "state",  "wholerow", "unique"],
			"contextmenu": {items: customMenu}

	}).bind('click.jstree', function(event) {               
        var eventNodeName = event.target.nodeName;       
            if (eventNodeName == 'INS') {                   
                return;               
            } else if (eventNodeName == 'A') {                   
                var $subject = $(event.target).parent();                   
                if ($subject.find('ul').length > 0) {            
                    var id=$(event.target).parents('li').attr('id');   
					loadContentToPanel("Archive_panel","Archive/ArchiveList.action","vo.catalogue.id="+id);
               } else { 
                    var id=$(event.target).parents('li').attr('id');   
					loadContentToPanel("Archive_panel","Archive/ArchiveList.action","vo.catalogue.id="+id);
                }               
            }           
    }).on('rename_node.jstree', function (e, data) {
		$.get('Archive/ArchiveCatalogueModify.action', { 'vo.id' : data.node.id, 'vo.name' : data.text })
		.fail(function () {
				data.instance.refresh();
		});
	})
	;

	function demo_create() {
							var ref = $('#Archive_group_panel').jstree(true),
								sel = ref.get_selected();
							if(!sel.length) { return false; }
							sel = sel[0];
							sel = ref.create_node(sel, {"type":"file"});
							if(sel) {
								ref.edit(sel);
							}
	};
	function refreshNode(id) {
		var ref = $('#Archive_group_panel').jstree(true);
		//var node=ref.get_node(id);
		ref.refresh_node(id);
	}
	function customMenu(node) {
	 // The default set of all items
	 var items = {
		  openItem:
		  {
		    label: "Open",
			"separator_after"	: true,
			action:function(data){
				var inst = $.jstree.reference(data.reference);
				var obj = inst.get_node(data.reference);
				var id=obj.id;   
				loadContentToPanel("Archive_panel","Archive/ArchiveList.action","vo.catalogue.id="+id);
			}
		  },
		  createItem:{
		    label: "Create",
			action:function(data){
				var inst = $.jstree.reference(data.reference),
					obj = inst.get_node(data.reference);
				openDialog("Archive/ArchiveCatalogueInput.action?vo.id="+obj.id,"Create Catalogue");
				/*
					inst.create_node(obj, {}, "last", function (new_node) {
							setTimeout(function () { inst.edit(new_node); },0);
					});
					*/
			}
		  },
		  editItem:
		  {
		    label: "Edit",
			action:function(data){
			}
		  },
		  renameItem: { // The "rename" menu item
		   label: "Rename",
			action		: function (data) {
						var inst = $.jstree.reference(data.reference),
							obj = inst.get_node(data.reference);
						inst.edit(obj);
					}
		  },
		  deleteItem: { // The "delete" menu item
		   label: "Delete",
			action		: function (data) {
					var inst = $.jstree.reference(data.reference),
							obj = inst.get_node(data.reference);
						if(inst.is_selected(obj)) {
							inst.delete_node(inst.get_selected());
						}
						else {
							inst.delete_node(obj);
						}
					$.get('Archive/ArchiveCatalogueDelete.action', { 'vo.id' : obj.id })
					.fail(function () {
							data.instance.refresh();
					});
				}
		  },
		  refreshItem:
		  {
		    label: "Refresh",
			"separator_before"	: true,
			action:function(data){
				var inst = $.jstree.reference(data.reference);
				var obj = inst.get_node(data.reference);
				inst.refresh_node(obj);
			}
		  },
		  infoItem:{
		   label: "Properties",
			action		: function (data) {
			}
		  }
	 };
	 if (node.id==1) {
	  // Delete the "delete" menu item
	  //delete items.deleteItem;
	  items.deleteItem._disabled = true;
	  items.renameItem._disabled = true;
	  items.editItem._disabled = true;
	 }

	 return items;
	}
	</script>
