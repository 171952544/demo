<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="注册.aspx.cs" Inherits="实验三.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>个人信息注册页面</title>
    <style type="text/css">
        .auto-style1 {
            width: 226px;
        }
        .auto-style2 {
            width: 473px;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table align="center">
        <tr align="right"><td></td><td align="left" class="auto-style2"><h2><font color="red">请输入个人详细信息<asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            </font></h2></td>
        <tr align="right">
            
            <td class="auto-style1">
                <asp:Label ID="Label1" runat="server" Text="用户名："></asp:Label>
            <td align="left" class="auto-style2">
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:Button ID="Button7" runat="server" Text="检验用户名" Width="67px" ValidationGroup="cc" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox1" Text="*" BorderColor="Red">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox1"
 ErrorMessage="6~18个字符,以字母开头，字母或数字结尾"  ValidationExpression="^[a-zA-Z]\w{5,17}$"> </asp:RegularExpressionValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*已存在用户名" OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="cc"></asp:CustomValidator>
            </td>
                
        </tr>
        <tr align="right">
            <td class="auto-style1">
                <asp:Label ID="Label2" runat="server" Text="密码："></asp:Label></td>
            <td align="left" class="auto-style2">
                <asp:TextBox ID="TextBox2" runat="server" MaxLength="16" TextMode="Password" placeholder="6-16位密码"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox2" Text="*" BorderColor="Red">*</asp:RequiredFieldValidator></td>
    </tr>
        
        <tr align="right">
            <td class="auto-style1">
                <asp:Label ID="Label3" runat="server" Text="确认密码："></asp:Label>
            <td align="left" class="auto-style2">
                <asp:TextBox ID="TextBox3" runat="server" MaxLength="16" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox3" Text="*" BorderColor="Red">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="密码不一致" ControlToCompare="TextBox2" Type="String" Operator="Equal" BorderColor="Red"></asp:CompareValidator></td>
        </tr>
       
        <tr align="right">
            <td class="auto-style1">
                <asp:Label ID="Label4" runat="server" Text="性别："></asp:Label></td>
            <td align="left" class="auto-style2">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem>男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                </asp:RadioButtonList>
            
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="RadioButtonList1" Text="*"></asp:RequiredFieldValidator></td>
        </tr>
        <tr align="right">
            <td class="auto-style1">
                <asp:Label ID="Label5" runat="server" Text="籍贯："></asp:Label></td>
            <td align="left" class="auto-style2">
             <asp:UpdatePanel ID="UpdatePanel" runat="server"> 
                 <ContentTemplate>  
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem Value="0">请选择</asp:ListItem>
                    <asp:ListItem Value="湖南省">湖南省</asp:ListItem>
                    <asp:ListItem Value="湖北省">湖北省</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem Value="1">请选择</asp:ListItem>
                </asp:DropDownList></td>
                     </ContentTemplate>
            </asp:UpdatePanel>
        </tr>
        <tr align="right">
            <td class="auto-style1"><asp:Label ID="Label6" runat="server" Text="Email："></asp:Label>
            <td align="left" class="auto-style2"><asp:TextBox ID="TextBox4" runat="server" TextMode="Email" placeholder="如 wustzz@163.com"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox4" ErrorMessage="RequiredFieldValidator">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="邮箱不合法" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr align="right">
            <td class="auto-style1"><asp:Label ID="Label7" runat="server" Text="手机号："></asp:Label></td>
            <td align="left" class="auto-style2"><asp:TextBox ID="TextBox5" runat="server" MaxLength="11" TextMode="Phone" placeholder="11位数字"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TextBox5" Text="*" BorderColor="Red">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox5" ErrorMessage="必须联通号码"  ValidationExpression="(130|135)\d{8}"></asp:RegularExpressionValidator></td>
        </tr>
        <tr align="right">
            <td class="auto-style1"><asp:Label ID="Label8" runat="server" Text="专业擅长："></asp:Label></td>
            <td align="left" class="auto-style2"><asp:ListBox ID="ListBox1" runat="server" Height="78px" SelectionMode="Multiple" >
                <asp:ListItem Value="0">Windows编程</asp:ListItem>
                <asp:ListItem Value="1">单片机编程</asp:ListItem>
                <asp:ListItem Value="2">ASP.NET编程</asp:ListItem>
                <asp:ListItem Value="3">J2EE编程</asp:ListItem>
                <asp:ListItem Value="4">Java编程</asp:ListItem>
            </asp:ListBox></td>
        </tr>
        <tr align="right">
            <td class="auto-style1"><asp:Label ID="Label9" runat="server" Text="爱好："></asp:Label></td>
            <td align="left" class="auto-style2"><asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                <asp:ListItem Value="0">足球</asp:ListItem>
                <asp:ListItem Value="1">篮球</asp:ListItem>
                <asp:ListItem Value="2">网球</asp:ListItem>
                <asp:ListItem Value="3">排球</asp:ListItem>
            </asp:CheckBoxList></td>
        </tr>
        <tr align="right">
            <td class="auto-style1"><asp:Label ID="Label10" runat="server" Text="个人照片："></asp:Label></td>
          <td align="left" class="auto-style18">  

                       <asp:FileUpload ID="FileUpload" runat="server" />
                       <asp:Button ID="BtnUp" runat="server" OnClick="BtnUp_Click" Text="上 传" CausesValidation="False" />
                       <asp:Label ID="LabMsg" runat="server"></asp:Label>
                       <img id="img" runat="server" src="" class="auto-style21" />
                  </td> 
        </tr>
        <tr align="right"> 
            <td class="auto-style1"><asp:Label ID="Label11" runat="server" Text="出生日期："></asp:Label></td>
            <td align="left" class="auto-style2">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:TextBox ID="TextBox6" runat="server" OnTextChanged="TextBox6_TextChanged"></asp:TextBox>
                        <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="获取" /></asp:Button>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr align="right">
                <td></td>
                <td align="left" class="auto-style2">
                    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                        <ContentTemplate>
                            <asp:Calendar ID="Calendar1" OnSelectionChanged="Calendar1_SelectionChanged" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" Width="287px">
                                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                <NextPrevStyle VerticalAlign="Bottom" />
                                <OtherMonthDayStyle ForeColor="#808080" />
                                <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                <SelectorStyle BackColor="#CCCCCC" />
                                <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <WeekendDayStyle BackColor="#FFFFCC" />
                            </asp:Calendar>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>

            </tr>
     
        <tr align="right">
            <td class="auto-style1"><asp:Label ID="Label12" runat="server" Text="个人简介："></asp:Label></td>
            <td align="left" class="auto-style2">
                <asp:TextBox ID="TextBox7" runat="server" Height="51px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
            <tr>
                <td align="right">
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="确认" />
                </td><td align="right" class="auto-style2">
                    <asp:Button ID="Button5" runat="server" Text="重填" OnClick="Button5_Click" CausesValidation="False"/>
                </td></tr>
    </table>
    </div>
    </form>
</body>
</html>
