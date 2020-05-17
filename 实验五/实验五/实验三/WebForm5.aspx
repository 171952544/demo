<%@ Page Language="C#" MasterPageFile="Site1.Master" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="实验三.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  <asp:Label runat="server" Text="收件邮箱：" ID="ss"></asp:Label>

    <asp:TextBox runat="server" ID="recfContact" Text=""></asp:TextBox><br/>

          <asp:Label runat="server" Text="主 题：" ID="Label1"></asp:Label>

    <asp:TextBox runat="server" ID="Title" Text=""></asp:TextBox><br/>

   <asp:Label runat="server" Text="邮件正文："></asp:Label>

    <asp:TextBox runat="server" ID="Content" Width="100%" Height="300px" Text=""></asp:TextBox>

     <asp:Label runat="server" Text="" ID="msg1" ForeColor="Red"></asp:Label><br/>

  添加附件：  <asp:FileUpload runat="server" ID="upFile"/><br />

       <asp:Button runat="server" ID="send" Text="发送" OnClick="send_Click"/><asp:Label runat="server" ID="msg"></asp:Label>

</asp:Content>

