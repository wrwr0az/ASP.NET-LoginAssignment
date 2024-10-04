<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LoginApp.Login" %>

<!DOCTYPE html>

<html class="no-js" lang="eng" >
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
    <title>Login</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="JavaScript.js"></script>
    <style>
        .auto-style1 {
            color: #FF0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Hidden field to track the active form (SignIn or SignUp) -->
        <div class="container">
            <div class="frame">
                <div class="nav">
                    <ul class="links">
                        <li class="signin-active"><a class="btn">Sign in</a></li>
                        <li class="signup-inactive"><a class="btn">Sign up</a></li>
                    </ul>
                </div>
                <div ng-app ng-init="checked = false">
                    <!-- Sign In Form -->
                    <div class="form-signin">
                        <asp:Label for="username" class="label" type="text" runat="server" Text="User Name"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" CssClass="auto-style1" ValidationGroup="SignInGroup"></asp:RequiredFieldValidator>
                        <asp:TextBox class="form-styling" ID="TextBox1" runat="server"></asp:TextBox>

                        <asp:Label for="password" class="label" type="text" runat="server" Text="Password"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" CssClass="auto-style1" ValidationGroup="SignInGroup"></asp:RequiredFieldValidator>
                        <asp:TextBox class="form-styling" ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>

                        <asp:Label ID="msg" runat="server" Text=""></asp:Label>
                        <div class="btn-animate">
                            <asp:Button ID="Button1" class="btn-signin" runat="server" Text="Sign in" OnClick="Button1_Click1" ValidationGroup="SignInGroup"/>
                        </div>
                    </div>

                    <!-- Sign Up Form -->
                    <div class="form-signup">
                        <asp:Label ID="userExist" runat="server" Text="" CssClass="auto-style1"></asp:Label>
                        <asp:Label for="fullname" class="label" type="text" runat="server" Text="User Name"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" CssClass="auto-style1" ValidationGroup="SignUpGroup"></asp:RequiredFieldValidator>
                        <asp:TextBox class="form-styling" ID="TextBox3" runat="server"></asp:TextBox>

                        <asp:Label for="email" class="label" type="text" runat="server" Text="Email"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox4" ErrorMessage="*" CssClass="auto-style1" ValidationGroup="SignUpGroup"></asp:RequiredFieldValidator>
                        <asp:TextBox class="form-styling" ID="TextBox4" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Email Format Incorrect" CssClass="auto-style1" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="SignUpGroup"></asp:RegularExpressionValidator>

                        <asp:Label for="password" class="label" type="text" runat="server" Text="Password"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox5" ErrorMessage="*" CssClass="auto-style1" ValidationGroup="SignUpGroup"></asp:RequiredFieldValidator>
                        <asp:TextBox class="form-styling" ID="TextBox5" runat="server" TextMode="Password"></asp:TextBox>

                        <asp:Label for="confirmpassword" class="label" type="text" runat="server" Text="Confirm Password"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox6" ErrorMessage="*" CssClass="auto-style1" ValidationGroup="SignUpGroup"></asp:RequiredFieldValidator>
                        <asp:TextBox class="form-styling" ID="TextBox6" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox5" ControlToValidate="TextBox6" ErrorMessage="Passwords Do Not Match" CssClass="auto-style1" ValidationGroup="SignUpGroup"></asp:CompareValidator>

                        <asp:Button ID="Button2" class="btn-signup" runat="server" Text="SIGN UP" OnClick="Button2_Click2" ValidationGroup="SignUpGroup"/>
                    </div>
                </div>  
            </div>
        </div>
    </form>
</body>
</html>
