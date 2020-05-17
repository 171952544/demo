<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="登陆.aspx.cs" Inherits="实验三.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 264px;
            height: 81px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <h1 align="center"><font color="red" >&nbsp; 欢迎登陆邮箱</font></h1>
        <table align="center" class="auto-style1">
            <tr>
       <td> <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label></td>
        <td><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
        </tr>
            <tr>
        <td><asp:Label ID="Label2" runat="server" Text="密码："></asp:Label></td>
        <td><asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
                </tr>
            <tr>
        <td><asp:Label ID="Label3" runat="server" Text="邮箱："></asp:Label></td>
        <td><asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox></td>
                </tr>
            <tr>
                <td>
                    &nbsp;</td><td>
                    <asp:Button ID="Button1" runat="server" Text="登陆" OnClick="Button1_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="注册" OnClick="Button2_Click" /></td>
            </tr>
            </table>
    </div>
    </form>
</body>
</html>
