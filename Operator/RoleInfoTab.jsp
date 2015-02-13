<div id="tabs" class="tabs" >
	<ul>
		<li><a href="Role/RoleInfo.action?vo.roleID=<%=request.getParameter("vo.roleID")%>">Basic Info</a></li>
		<li><a href="Role/RoleDataPermission.action?vo.roleID=<%=request.getParameter("vo.roleID")%>">Data Permission</a></li>
		<li><a href="#tabs-1">Help</a></li>
	</ul>
	<div id="tabs-1">
		Data Permission settings.
	</div>
</div>

	<script>
	$(function() {
		$( "#tabs" ).tabs({
			cache: false,
			beforeLoad: function( event, ui ) {
				ui.jqXHR.error(function() {
					ui.panel.html(
						"Couldn't load this tab. We'll try to fix this as soon as possible. " +
						"If this wouldn't be a demo." );
				});
			}
		});
	});
	</script>
