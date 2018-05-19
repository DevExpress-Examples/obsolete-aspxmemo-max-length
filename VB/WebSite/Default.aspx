<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.1, Version=10.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>ASPxMemo - MaxLength</title>

	<script type="text/javascript">
		function SetMaxLength(memo, maxLength) {
			if(!memo)
				return;
			if(typeof(maxLength) != "undefined" && maxLength >= 0) {
				memo.maxLength = maxLength;
				memo.maxLengthTimerToken = window.setInterval(function() {
					var text = memo.GetText();
					if(text && text.length > memo.maxLength)
						memo.SetText(text.substr(0, memo.maxLength));
				}, 10);
			} else if(memo.maxLengthTimerToken) {
				window.clearInterval(memo.maxLengthTimerToken);
				delete memo.maxLengthTimerToken;
				delete memo.maxLength;
			}
		}
		function OnMaxLengthChanged(s, e) {
			var maxLength = s.GetNumber();
			SetMaxLength(memo, maxLength);
		}
	</script>

</head>
<body>
	<form id="form1" runat="server">
		<div>
			<dx:ASPxMemo ID="txtMemo" runat="server" Height="71px" Width="170px" ClientInstanceName="memo" />
			<br />
			<table>
				<tr>
					<td>
						Max Value:
					</td>
					<td>
						<dx:ASPxSpinEdit ID="spnMaxLength" runat="server" Height="21px" MinValue="0" MaxValue="255"
							Width="50px">
							<ClientSideEvents NumberChanged="OnMaxLengthChanged" />
						</dx:ASPxSpinEdit>
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
