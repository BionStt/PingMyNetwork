<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="PingMyNetwork._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>IP:</div>
            <asp:TextBox runat="server" ID="txtIP"></asp:TextBox>
            <asp:Label runat="server" ID="lblIP"></asp:Label>
            <asp:Button runat="server" ID="btnIP" OnClick="btnIP_Click" Text="Ping IP" />

        </div>

        <div>
            <div>User:</div>
            <asp:TextBox runat="server" ID="txtUser"></asp:TextBox>
            <div>App:</div>
            <asp:TextBox runat="server" ID="txtApp"></asp:TextBox>
            <asp:Button runat="server" ID="Button2" OnClick="btnPushover_Click" Text="Send Push" />

        </div>
    </form>

</body>
</html>
