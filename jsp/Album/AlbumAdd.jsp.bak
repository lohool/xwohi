<%@ page session="true" %>
<%@ page contentType="text/html;charset=gb2312" %> 
<%@ taglib uri="webwork" prefix="ww" %>
<%@ taglib uri="/WEB-INF/xwohi.tld" prefix="xwohi" %>
      <div class="page">
            <ww:form action="AlbumAdd" method="post" name="form1" namespace="/Album" validate="true" onsubmit="return ajaxDatagridSubmit(this,'Album_list')" >
			<div class="container" layoutHeight="32">
				<TABLE>
				<TR>
					<TD><label class="label"><xwohi:i18n text="Album.name"/>:</label></TD>
					<TD><ww:password  name="vo.name"  /></TD>
				</TR>
				<TR>
					<TD><label class="label"><xwohi:i18n text="Album.Type"/>:</label></TD>
					<TD style="text-align:left">
						<INPUT TYPE="radio" NAME="vo.type" value="0" checked><xwohi:i18n text="Album.others" /><br>
                        <INPUT TYPE="radio" NAME="vo.type" value="1"><xwohi:i18n text="Album.images" /><br>
                        <INPUT TYPE="radio" NAME="vo.type" value="2"><xwohi:i18n text="Album.audios" /><br>
                        <INPUT TYPE="radio" NAME="vo.type" value="3"><xwohi:i18n text="Album.videos" /><br>
                        <INPUT TYPE="radio" NAME="vo.type" value="4"><xwohi:i18n text="Album.document" /><br>
					</TD>
				</TR>
				</TABLE>
			</div>
			<div  class="floatpanel"   >
				<input type="submit" class="button" value="<xwohi:i18n text="submit" />">
				<input type="reset" class="button" value="<xwohi:i18n text="reset" />">
				<input type="button" class="button" value="<xwohi:i18n text="close" />" onclick="_window.closeCurrent()">
			</div>

            </ww:form>
      </div>
