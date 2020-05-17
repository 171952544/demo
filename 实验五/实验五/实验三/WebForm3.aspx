<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="实验三.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO users(name, psd, sex, jiguan, email, tel, character, hobby, birth, jieshao) VALUES (@name, @psd, @sex, @jiguan, @email, @tel, @character, @hobby, @birth, @jieshao)" SelectCommand="SELECT [name], [psd], [sex], [jiguan], [email], [tel], [character], [hobby], [birth], [jieshao] FROM [users]">
            <InsertParameters>
                <asp:SessionParameter Name="name" SessionField="name" />
                <asp:SessionParameter Name="psd" SessionField="psd" />
                <asp:SessionParameter Name="sex" SessionField="sex" />
                <asp:SessionParameter Name="jiguan" SessionField="jiguan" />
                <asp:SessionParameter Name="email" SessionField="email" />
                <asp:SessionParameter Name="tel" SessionField="tel" />
                <asp:SessionParameter Name="character" SessionField="character" />
                <asp:SessionParameter Name="hobby" SessionField="hobby" />
                <asp:SessionParameter Name="birth" SessionField="birth" />
                <asp:SessionParameter Name="jieshao" SessionField="jieshao" />
            </InsertParameters>
        </asp:SqlDataSource>
        用户名：<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />
        密码：<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
        <br />
        性别：<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
        <br />
        籍贯：<asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
        <br />
        Email：<asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
        <br />
        Tel：<asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
        <br />
        特长：<asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
        <br />
        爱好：<asp:Label ID="Label8" runat="server" Text="Label"></asp:Label>
        <br />
        生日：<asp:Label ID="Label9" runat="server" Text="Label"></asp:Label>
        <br />
        介绍：<asp:Label ID="Label10" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="跳转至登陆页面" />
    
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="返回" />
    
    </div>
    </form>
</body>
</html>
