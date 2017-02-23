<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="PingMyNetwork._default" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link href='http://fonts.googleapis.com/css?family=Cabin:400,500,600,700,400italic,500italic,600italic,700italic' rel='stylesheet' type='text/css' />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />

    <link href="assets/css/default/form/form_style.css" rel='stylesheet' type='text/css' />

    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css" />

    <!-- Compiled and minified JavaScript -->

    <title></title>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container">
            <nav>
                <div class="nav-wrapper">
                    <a href="#" class="brand-logo">&nbsp;&nbsp; PingMyNetwork</a>
                    <ul id="nav-mobile" class="right hide-on-med-and-down">
                        <li><a href="sass.html">Sass</a></li>
                        <li><a href="badges.html">Components</a></li>
                        <li><a href="collapsible.html">JavaScript</a></li>
                    </ul>
                </div>
            </nav>

            <br />
            <br />
            <br />

            <div class="row" style="width: 35%; margin-right: auto; margin-left: auto;">

                <asp:ScriptManager runat="server" ID="sm">
                </asp:ScriptManager>

                <div class="row">
                    <div class="input-field col s8">

                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <input runat="server" id="ipaddress" type="text" />
                                <label id="lbl_ipaddress" runat="server" for="ipaddress">IP Address</label>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnTestIp" />
                            </Triggers>
                        </asp:UpdatePanel>

                    </div>
                    <div class="input-field col s4">
                        <asp:Button runat="server" CssClass="btn waves-effect waves-light btnTestIp" ID="btnTestIp" OnClick="btnTestIp_Click" Text="TEST IP" />
                    </div>

                    <div class="input-field col s8">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <input runat="server" id="hostname" type="text" />
                                <label runat="server" id="lbl_hostname" for="hostname">Hostname</label>

                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnGetHostnameByIP" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <div class="input-field col s4">
                        <asp:Button runat="server" CssClass="btn waves-effect waves-light btnFormMarginTop " ID="btnGetHostnameByIP" OnClick="btnGetHostnameByIP_Click" Text="GET BY IP" />
                    </div>
                    <div class="input-field col s8">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <input runat="server" id="macaddress" type="text" />
                                <label runat="server" id="lbl_macaddress" for="macaddress">MAC Address</label>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnGetMACByIP" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                    <div class="input-field col s4">
                        <asp:Button runat="server" CssClass="btn waves-effect waves-light btnFormMarginTop " ID="btnGetMACByIP" OnClick="btnGetMACByIP_Click" Text="GET BY IP" />
                    </div>
                    <div class="input-field col s12">
                        <select id="select_device" class="icons">
                            <option value="" disabled selected>Select device</option>
                            <option value="" data-icon="assets/images/default/form/logos/windows.png">Windows</option>
                            <option value="" data-icon="assets/images/default/form/logos/linux.png" class="circle">Linux</option>
                            <option value="" data-icon="assets/images/default/form/logos/apple.png" class="circle">Mac</option>
                            <option value="" data-icon="assets/images/default/form/logos/phone.png" class="circle">Phone</option>
                            <option value="" data-icon="assets/images/default/form/logos/other.png" class="circle">Other</option>
                        </select>
                    </div>
                    <div class="input-field col s6">
                        <a style="margin-left: 20%;" class="waves-effect waves-light btn-large"><i class="material-icons left">check</i>add</a>
                    </div>
                    <div class="input-field col s6">
                        <a class="waves-effect waves-light btn-large"><i class="material-icons left">close</i>cancel</a>
                    </div>
                </div>

            </div>

            <br />
            <br />
            <br />

            <ul class="collection">
                <li class="collection-item avatar">
                    <i class="material-icons circle yellow">android</i>
                    <span class="title">Title</span>
                    <p>
                        First Line
                <br />
                        Second Line
                    </p>
                    <a style="top: 25%;" class="btn-floating green secondary-content"><i class="material-icons">refresh</i></a>
                </li>
                <li class="collection-item avatar">
                    <i class="material-icons circle">folder</i>
                    <span class="title">Title</span>
                    <p>
                        First Line
                <br />
                        Second Line
                    </p>
                    <a style="top: 25%;" class="btn-floating green secondary-content"><i class="material-icons">refresh</i></a>

                </li>
                <li class="collection-item avatar">
                    <i class="material-icons circle green">insert_chart</i>
                    <span class="title">Title</span>
                    <p>
                        First Line
                <br />
                        Second Line
                    </p>
                    <a style="top: 25%;" class="btn-floating green secondary-content"><i class="material-icons">refresh</i></a>

                </li>
                <li class="collection-item avatar">
                    <i class="material-icons circle red">play_arrow</i>
                    <span class="title">Title</span>
                    <p>
                        First Line
                <br />
                        Second Line
                    </p>
                    <a style="top: 25%;" class="btn-floating green secondary-content"><i class="material-icons">refresh</i></a>

                </li>
            </ul>

            <div class="fixed-action-btn horizontal click-to-toggle">
                <a class="btn-floating btn-large red">
                    <i class="material-icons">apps</i>
                </a>
                <ul>
                    <li><a class="btn-floating red"><i class="material-icons">settings</i></a></li>
                    <li><a class="btn-floating yellow darken-1"><i class="material-icons">notifications</i></a></li>
                    <li><a class="btn-floating green"><i class="material-icons">sync</i></a></li>
                    <li><a class="btn-floating blue"><i class="material-icons">add_box</i></a></li>
                </ul>
            </div>

        </div>
    </form>

    <%--        <li><a class="btn-floating red"><i class="material-icons">settings</i></a></li>
                    <li><a class="btn-floating yellow darken-1"><i class="material-icons">notifications</i></li>
                    <li><a class="btn-floating green"><i class="material-icons">sync</i></li>
                    <li><a class="btn-floating blue"><i class="material-icons">add_cricle</i></a></li>--%>

    <!-- Page Content goes here -->


    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            $('select').material_select();

        });

    </script>


</body>
</html>
