<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="PingMyNetwork._default" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href='http://fonts.googleapis.com/css?family=Cabin:400,500,600,700,400italic,500italic,600italic,700italic' rel='stylesheet' type='text/css' />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css" />
    <link href="assets/css/anim/animate.css" rel='stylesheet' type='text/css' />
    <link href="assets/css/default/form/form_style.css" rel='stylesheet' type='text/css' />
    <%--<link href="assets/css/materialize.min.css" rel='stylesheet' type='text/css' />--%>


    <title>Ping My Network</title>
</head>
<body>

    <form id="form1" runat="server">

        <asp:ScriptManager runat="server" ID="sm">
        </asp:ScriptManager>
        <div class="contaisner">

            <%-- Nav  --%>
            <nav>
                <div class="nav-wrapper">
                    <a href="#" class="brand-logo">&nbsp;&nbsp; PingMyNetwork</a>
                    <ul id="nav-mobile" class="right hide-on-med-and-down">
                        <li>
                            <asp:LinkButton runat="server" CssClass=" waves-effect waves-light" ID="linkbtnHeaderRefresh" OnClick="linkbtnHeaderRefresh_Click" Text="REFRESH"></asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </nav>
            <br />
            <%-- HOST  --%>
            <div class="container">
                <div runat="server" id="mainHostList">
                    <%--<ul class="collection">
                        <li class="collection-item avatar">
                            <img src="images/yuna.jpg" alt="" class="circle">
                            <span class="title">Title</span>
                            <p>
                                First Line
                                <br>
                                Second Line
                            </p>
                            <div class="secondary-content ">
                                <a class="btn-floating btn-large waves-effect waves-light green" runat="server" onServerClick="linkbtnHeaderRefresh_Click"><i class="material-icons">replay</i></a>
                                <a class="btn-floating btn-large waves-effect waves-light red" runat="server" onServerClick="linkbtnHeaderRefresh_Click"><i class="material-icons">clear</i></a>
                            </div>
                        </li>
                    </ul>--%>
                </div>
            </div>

            <%-- MODAL - NEW HOST FORM  --%>
            <div id="moalFormNewNodo" class="modal" style="overflow: hidden !important;">
                <div class="modal-content" style="padding-bottom: 10px; padding-top: 40px;">
                    <h4 style="text-align: center;">Add new host</h4>
                    <br />
                    <div class="row" style="width: 40%; margin-right: auto; margin-left: 30% !important;">

                        <%-- INPUTS --%>
                        <div class="row" style="text-align: center;">

                            <%-- SELECT DEVICE --%>
                            <div style="width: 110%; z-index: 99999" class="input-field col s12 tooltipped" data-position="left" data-delay="50" data-tooltip="Select host device">
                                <select runat="server" id="select_device" class="icons" style="vertical-align: top;">
                                    <option value="" disabled selected>Select device</option>
                                    <option value="Desktop" data-icon="assets/images/default/form/logos/pc.png">Desktop PC</option>
                                    <option value="Server" data-icon="assets/images/default/form/logos/mac.png">Server</option>
                                    <option value="Smartphone" data-icon="assets/images/default/form/logos/android.png">Smartphone</option>
                                    <option value="Tablet" data-icon="assets/images/default/form/logos/tablet.png">Tablet</option>
                                    <option value="Television" data-icon="assets/images/default/form/logos/tv.png">Television</option>
                                    <option value="Chromecast" data-icon="assets/images/default/form/logos/chromecast.png">Chromecast</option>
                                    <option value="Console" data-icon="assets/images/default/form/logos/console.png">Console</option>
                                    <option value="Other" data-icon="assets/images/default/form/logos/other.png">Other</option>
                                </select>
                            </div>

                            <%-- LABEL - INPUT - BUTTON FOR IPADDRESS --%>

                            <div class="input-field col s8">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div class="tooltipped" data-position="left" data-delay="50" data-tooltip="Exmaple: 192.168.15.100">
                                            <asp:TextBox runat="server" ID="txtBox_ipaddress"></asp:TextBox>
                                            <asp:Label runat="server" AssociatedControlID="txtBox_ipaddress" ID="lbl_ipaddress" Text="IP Address"></asp:Label>
                                        </div>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="linkbtnTestIp" />
                                        <asp:AsyncPostBackTrigger ControlID="linkbtnGetHostnameByIP" />
                                        <asp:AsyncPostBackTrigger ControlID="linkbtnGetMACByIP" />
                                        <asp:AsyncPostBackTrigger ControlID="linkbtn_ClearTextBoxNewHost" />
                                        <asp:AsyncPostBackTrigger ControlID="linkbtnAddFormNewHost" />
                                        <asp:AsyncPostBackTrigger ControlID="linkbtnCancelFormNewHost" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <div class="input-field col s4 tooltipped" data-position="bottom" data-delay="50" data-tooltip="Test the device IP to see if it is connected.">
                                <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnTestIp btnForm" ID="linkbtnTestIp" OnClick="btnTestIp_Click" Text="TEST IP"></asp:LinkButton>
                            </div>

                            <%-- LABEL - INPUT - BUTTON FOR HOSTNAME --%>

                            <div class="input-field col s8">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div class="tooltipped" data-position="left" data-delay="50" data-tooltip="Example: TorrentServer">
                                            <asp:TextBox runat="server" ID="txtBox_hostname"></asp:TextBox>
                                            <asp:Label runat="server" AssociatedControlID="txtBox_hostname" ID="lbl_hostname" Text="Hostname"></asp:Label>
                                        </div>

                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="linkbtnTestIp" />
                                        <asp:AsyncPostBackTrigger ControlID="linkbtnGetHostnameByIP" />
                                        <asp:AsyncPostBackTrigger ControlID="linkbtnGetMACByIP" />
                                        <asp:AsyncPostBackTrigger ControlID="linkbtn_ClearTextBoxNewHost" />
                                        <asp:AsyncPostBackTrigger ControlID="linkbtnAddFormNewHost" />
                                        <asp:AsyncPostBackTrigger ControlID="linkbtnCancelFormNewHost" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <div class="input-field col s4 tooltipped" data-position="bottom" data-delay="50" data-tooltip="If the host device is Windows based you cant get the hostname.">
                                <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnFormMarginTop btnForm " ID="linkbtnGetHostnameByIP" OnClick="btnGetHostnameByIP_Click" Text="GET BY IP"></asp:LinkButton>
                            </div>

                            <%-- LABEL - INPUT - BUTTON FOR MAC ADDRESS --%>

                            <div class="input-field col s8">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div class="tooltipped" data-position="left" data-delay="50" data-tooltip="Example: 00-14-22-01-23-45 ">
                                            <asp:TextBox runat="server" ID="txtBox_macaddress"></asp:TextBox>
                                            <asp:Label runat="server" AssociatedControlID="txtBox_macaddress" ID="lbl_macaddress" Text="MAC Address"></asp:Label>
                                        </div>

                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="linkbtnTestIp" />
                                        <asp:AsyncPostBackTrigger ControlID="linkbtnGetHostnameByIP" />
                                        <asp:AsyncPostBackTrigger ControlID="linkbtnGetMACByIP" />
                                        <asp:AsyncPostBackTrigger ControlID="linkbtn_ClearTextBoxNewHost" />
                                        <asp:AsyncPostBackTrigger ControlID="linkbtnAddFormNewHost" />
                                        <asp:AsyncPostBackTrigger ControlID="linkbtnCancelFormNewHost" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>
                            <div class="input-field col s4 tooltipped" data-position="bottom" data-delay="50" data-tooltip="Get the MAC Address by your device IP.">
                                <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnFormMarginTop btnForm " ID="linkbtnGetMACByIP" OnClick="btnGetMACByIP_Click" Text="GET BY IP"></asp:LinkButton>
                            </div>

                            <div style="text-align: center; margin-left: 15%;">
                                <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnTestIp" ID="linkbtn_ClearTextBoxNewHost" OnClick="btn_ClearTextBoxNewHost_Click" Text="CLEAR FORM"></asp:LinkButton>
                            </div>

                        </div>

                    </div>
                </div>
                <div class="modal-footer">
                    <asp:LinkButton runat="server" CssClass="modal-action modal-close waves-effect waves-green btn-flat" ID="linkbtnAddFormNewHost" OnClick="btnAddFormNewHost_Click">ADD</asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="modal-action modal-close waves-effect waves-green btn-flat" ID="linkbtnCancelFormNewHost" OnClick="btnCancelFormNewHost_Click">CANCEL</asp:LinkButton>
                </div>
            </div>

            <!-- MODAL - CHECK NETWORK -->
            <div id="modalCheckNetwork" class="modal">
                <div class="modal-content">
                    <h4 style="text-align: center">Scan Netowk</h4>
                    <br />
                    <p style="margin-top: -10px; padding-left: 10%; padding-right: 10%;">
                        This tool checks the entire network for online devices, this process can take up to 3 minutes. It is important to not reload the page since it will cancel the scan. A dialog will show when the scan is finished.
                    </p>

                    <div class="container">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <div runat="server" id="CheckNetworkContainer"></div>
                                <%-- <div style="width: 100%; z-index: 99999" class="input-field col s8 m6 tooltipped" data-position="left" data-delay="50" data-tooltip="Select host to add">
                                    
                                </div>
                                <div class="input-field col s4 m6">
                                </div>--%>

                                <%-- <div class="input-field col s12 m6">
                                    <select runat="server" id="select_hostscannetwork" style="vertical-align: top;">
                                        <option value="" disabled selected>Select host</option>
                                    </select>
                                </div>
                                <div class="input-field col s12 m6">
                                    
                                    <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnTestIp" ID="refreshselect" OnClick="refreshselect_Click" Text="REFRESH SELECT"></asp:LinkButton>
                                </div>--%>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="linkbtn_ScanNetwork" />
                                <asp:AsyncPostBackTrigger ControlID="linkbtn_ClearScan" />
                                <asp:AsyncPostBackTrigger ControlID="linkbtn_CloseCheckNetworkPanel" />
                                <%--<asp:AsyncPostBackTrigger ControlID="refreshselect" />--%>
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>

                    <div style="text-align: center;">
                        <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnTestIp" ID="linkbtn_ScanNetwork" OnClick="btn_ScanNetwork_Click" Text="SCAN NETWORK"></asp:LinkButton>
                        <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnTestIp" ID="linkbtn_ClearScan" OnClick="btn_ClearScan_Click" Text="CLEAR TABLE"></asp:LinkButton>
                    </div>



                </div>

                <div class="modal-footer">
                    <asp:LinkButton runat="server" CssClass="modal-action modal-close waves-effect waves-green btn-flat" ID="linkbtn_CloseCheckNetworkPanel" Text="CLOSE"></asp:LinkButton>
                </div>
            </div>

            <!-- MODAL - DELETE HOST-->
            <div id="modalDeleteHost" class="modal">
                <div class="modal-content">
                    <h4 style="text-align: center">Delete host</h4>
                    <br />

                    <div class="container">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>

                                <%--<div style="width: 100%; z-index: 99999" class="input-field col s8 m6 tooltipped" data-position="left" data-delay="50" data-tooltip="Select host to add">
                                    
                                </div>
                                <div class="input-field col s4 m6">
                                </div>--%>

                                <div class="input-field col s12 m6">
                                    <asp:DropDownList runat="server" ID="dropdown_hostscannetwork" ViewStateMode="Enabled"></asp:DropDownList>
                                    <%--<select runat="server" id="select_hostscannetwork" style="vertical-align: top;">
                                        <option value="" disabled selected>Select host</option>
                                    </select>--%>
                                </div>

                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="refreshselect" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <div class="input-field col s12 m6">

                            <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnTestIp" ID="refreshselect" OnClick="refreshselect_Click" Text="REFRESH SELECT"></asp:LinkButton>
                        </div>
                    </div>

                </div>

                <div class="modal-footer">
                    <asp:LinkButton runat="server" CssClass="modal-action modal-close waves-effect waves-green btn-flat" ID="linkbtnCloseDeleteHost" Text="CLOSE"></asp:LinkButton>
                </div>
            </div>

            <!-- MODAL - NOTIFICATIONS -->
            <div id="modalNotifications" class="modal">
                <div class="modal-content">
                    <h4 style="text-align: center;">Notifications</h4>
                    <br />
                    <div class="container">
                        <ul class="collapsible" data-collapsible="accordion">
                            <%-- PUSHOVER ACCOUNT --%>
                            <li>
                                <div class="collapsible-header">
                                    <i class="material-icons">
                                        <img style="width: 20px;" src="assets/images/default/form/logos/pushover.png" /></i>Pushover account
                                </div>
                                <div class="collapsible-body">
                                    <div class="row" style="margin-bottom: 10px !important; margin-left: 10px !important">
                                        <p style="margin-top: -10px;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin placerat, mauris ut iaculis mollis, sapien odio malesuada magna, ut semper nisi purus tincidunt purus. </p>
                                        <asp:UpdatePanel runat="server">
                                            <ContentTemplate>
                                                <div class="input-field col s12">
                                                    <div class="tooltipped" data-position="top" data-delay="50" data-tooltip="User example: uQiRzpo4DXghDmr9QzzfQu27cmVRsG">
                                                        <asp:TextBox runat="server" ID="txtBox_UserPushover" EnableViewState="true"></asp:TextBox>
                                                        <asp:Label runat="server" AssociatedControlID="txtBox_UserPushover" ID="lbl_UserPushover" Text="Pushover user"></asp:Label>
                                                    </div>
                                                </div>

                                                <div class="input-field col s12">
                                                    <div class="tooltipped" data-position="top" data-delay="50" data-tooltip="Token example: KzGDORePKggMaC0QOYAMyEEuzJnyUi">
                                                        <asp:TextBox runat="server" ID="txtBox_TokenPushover" EnableViewState="true"></asp:TextBox>
                                                        <asp:Label runat="server" AssociatedControlID="txtBox_TokenPushover" ID="lbl_TokenPushover" Text="API/Token"></asp:Label>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="linkbtn_SendTestPushover" />
                                                <asp:AsyncPostBackTrigger ControlID="linkbtn_SaveSettingsPushover" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <div class="input-field col s6 tooltipped" data-position="bottom" data-delay="50" data-tooltip="Send a test message using the User/Token introduced.">
                                            <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnFormMarginTop " ID="linkbtn_SendTestPushover" OnClick="btn_SendTestPushover_Click" Text="TEST MESSAGE"></asp:LinkButton>
                                        </div>
                                        <div class="input-field col s6 tooltipped" data-position="bottom" data-delay="50" data-tooltip="Save configuration.">
                                            <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnFormMarginTop " ID="linkbtn_SaveSettingsPushover" OnClick="btn_SaveSettingsPushover_Click" Text="SAVE SETTINGS"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <%-- SCHEDULED NOTIFICATIONS --%>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">notifications</i>Scheduled notifications</div>
                                <div class="collapsible-body">
                                    <div class="row" style="margin-bottom: 10px !important; margin-left: 10px !important">
                                        <p style="margin-top: -10px;">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin placerat, mauris ut iaculis mollis, sapien odio malesuada magna, ut semper nisi purus tincidunt purus. </p>
                                        <asp:UpdatePanel runat="server">
                                            <ContentTemplate>
                                                <div class="input-field col s12" style="margin-bottom: 15px;">
                                                    <div>
                                                        <asp:CheckBox runat="server" ID="chkbox_ScheduledNotifications"></asp:CheckBox>
                                                        <asp:Label runat="server" AssociatedControlID="chkbox_ScheduledNotifications" ID="lbl_ScheduledNotifications" Text="Scheduled Notifications "></asp:Label>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="linkbtn_SaveSettingsScheduledNotifications" />
                                                <asp:AsyncPostBackTrigger ControlID="linkbtn_SendTestScheduledNotificationPushover" />
                                            </Triggers>
                                        </asp:UpdatePanel>

                                        <div class="input-field col s6 tooltipped" data-position="bottom" data-delay="50" data-tooltip="Send a scheduled notification message.">
                                            <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnFormMarginTop " ID="linkbtn_SendTestScheduledNotificationPushover" OnClick="btn_SendTestScheduledNotificationPushover_Click" Text="TEST MESSAGE"></asp:LinkButton>
                                        </div>
                                        <div class="input-field col s6 tooltipped" data-position="bottom" data-delay="50" data-tooltip="Save configuration.">
                                            <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnFormMarginTop " ID="linkbtn_SaveSettingsScheduledNotifications" OnClick="btn_SaveSettingsScheduledNotifications_Click" Text="SAVE SETTINGS"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>

                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Close</a>
                </div>
            </div>

            <!-- MODAL - SETTINGS -->
            <div id="modalSettings" class="modal">
                <div class="modal-content">
                    <h4 style="text-align: center;">Settings</h4>
                    <br />
                    <div class="container">
                        <ul class="collapsible" data-collapsible="accordion">

                            <%-- SECURITY --%>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">fingerprint</i>Security</div>
                                <div class="collapsible-body">
                                    <div class="row" style="margin-bottom: 10px !important; margin-left: 10px !important">
                                        <asp:UpdatePanel runat="server">
                                            <ContentTemplate>
                                                <div class="input-field col s12">
                                                    <div>
                                                        <asp:TextBox runat="server" ID="txtBox_CurrentUserSecurity"></asp:TextBox>
                                                        <asp:Label runat="server" AssociatedControlID="txtBox_CurrentUserSecurity" ID="lbl_CurrentUserSecurity" Text="Current username"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="input-field col s12">
                                                    <div>
                                                        <asp:TextBox runat="server" ID="txtBox_NewUserSecurity"></asp:TextBox>
                                                        <asp:Label runat="server" AssociatedControlID="txtBox_NewUserSecurity" ID="lbl_NewUserSecurity" Text="New username"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="input-field col s12">
                                                    <div>
                                                        <asp:TextBox runat="server" ID="txtBox_CurrentPasswordSecurity"></asp:TextBox>
                                                        <asp:Label runat="server" AssociatedControlID="txtBox_CurrentPasswordSecurity" ID="lbl_CurrentPasswordSecurity" Text="Current password"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="input-field col s12">
                                                    <div>
                                                        <asp:TextBox runat="server" ID="txtBox_NewPasswordSecurity"></asp:TextBox>
                                                        <asp:Label runat="server" AssociatedControlID="txtBox_NewPasswordSecurity" ID="lbl_NewPasswordSecurity" Text="New password"></asp:Label>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="linkbtn_SendTestPushover" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                        <div style="text-align: center" class="input-field col s12 tooltipped" data-position="bottom" data-delay="50" data-tooltip="Push notification will be send.">
                                            <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnFormMarginTop " ID="linkbtn_UpdatePassword" OnClick="btn_UpdatePassword_Click" Text="UPDATE PASSWORD"></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </li>

                            <%-- APPAREANCE --%>
                            <li>
                                <div class="collapsible-header"><i class="material-icons">border_color</i>Appereance</div>
                                <div class="collapsible-body">

                                    <ul class="collapsible" data-collapsible="accordion">
                                        <li>
                                            <div class="collapsible-header"><i class="material-icons">border_top</i>Header</div>
                                            <div class="collapsible-body">
                                                <div class="input-field col s12">
                                                    <asp:TextBox runat="server" ID="TextBox1"></asp:TextBox>
                                                    <asp:Label runat="server" AssociatedControlID="txtBox_CurrentPasswordSecurity" ID="Label1" Text="Background color"></asp:Label>
                                                </div>

                                                <div class="input-field col s12">
                                                    <asp:TextBox runat="server" ID="TextBox2"></asp:TextBox>
                                                    <asp:Label runat="server" AssociatedControlID="txtBox_CurrentPasswordSecurity" ID="Label2" Text="Title text"></asp:Label>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="collapsible-header"><i class="material-icons">border_all</i>Body</div>
                                            <div class="collapsible-body">

                                                <div class="input-field col s12">
                                                    <div>
                                                        <asp:TextBox runat="server" ID="TextBox3"></asp:TextBox>
                                                        <asp:Label runat="server" AssociatedControlID="txtBox_CurrentPasswordSecurity" ID="Label3" Text="Background color"></asp:Label>
                                                    </div>
                                                </div>

                                            </div>
                                        </li>
                                        <li>
                                            <div class="collapsible-header"><i class="material-icons">exit_to_app</i>Buttons</div>
                                            <div class="collapsible-body">

                                                <div class="input-field col s12">
                                                    <div>
                                                        <asp:TextBox runat="server" ID="TextBox4"></asp:TextBox>
                                                        <asp:Label runat="server" AssociatedControlID="txtBox_CurrentPasswordSecurity" ID="Label4" Text="Background color"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="input-field col s12">
                                                    <div>
                                                        <asp:TextBox runat="server" ID="TextBox5"></asp:TextBox>
                                                        <asp:Label runat="server" AssociatedControlID="txtBox_CurrentPasswordSecurity" ID="Label5" Text="Font color"></asp:Label>
                                                    </div>
                                                </div>

                                            </div>
                                        </li>
                                        <li>
                                            <div class="collapsible-header"><i class="material-icons">lock</i>Login</div>
                                            <div class="collapsible-body">

                                                <div class="input-field col s12">
                                                    <div>
                                                        <asp:TextBox runat="server" ID="TextBox6"></asp:TextBox>
                                                        <asp:Label runat="server" AssociatedControlID="txtBox_CurrentPasswordSecurity" ID="Label6" Text="Background color"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="input-field col s12">
                                                    <div>
                                                        <asp:TextBox runat="server" ID="TextBox7"></asp:TextBox>
                                                        <asp:Label runat="server" AssociatedControlID="txtBox_CurrentPasswordSecurity" ID="Label7" Text="Login header color"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="input-field col s12">
                                                    <div>
                                                        <asp:TextBox runat="server" ID="TextBox8"></asp:TextBox>
                                                        <asp:Label runat="server" AssociatedControlID="txtBox_CurrentPasswordSecurity" ID="Label8" Text="Login title text"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="input-field col s12">
                                                    <div>
                                                        <asp:TextBox runat="server" ID="TextBox9"></asp:TextBox>
                                                        <asp:Label runat="server" AssociatedControlID="txtBox_CurrentPasswordSecurity" ID="Label9" Text="Botton background color"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="input-field col s12">
                                                    <div>
                                                        <asp:TextBox runat="server" ID="TextBox10"></asp:TextBox>
                                                        <asp:Label runat="server" AssociatedControlID="txtBox_CurrentPasswordSecurity" ID="Label10" Text="Botton font color"></asp:Label>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                    <div style="text-align: center" class="input-field col s12 tooltipped" data-position="bottom" data-delay="50" data-tooltip="Push notification will be send.">
                                        <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnFormMarginTop " ID="linkbtn_UpdateAppareance" OnClick="btn_UpdatePassword_Click" Text="UPDATE APPEREANCE"></asp:LinkButton>
                                    </div>
                                </div>
                            </li>
                        </ul>

                    </div>
                </div>
                <div class="modal-footer">
                    <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat ">Close</a>
                </div>
            </div>

            <%-- CIRCLE BUTTON --%>
            <div class="fixed-action-btn horizontal click-to-toggle ">
                <a class="btn-floating btn-large red">
                    <i class="material-icons tooltipped" data-position="top" data-delay="50" data-tooltip="Menu">apps</i>
                </a>
                <ul>
                    <li><a class="btn-floating red tooltipped" data-position="top" data-delay="50" data-tooltip="Settings" href="#modalSettings"><i class="material-icons">settings</i></a></li>
                    <li><a class="btn-floating yellow darken-1 tooltipped" data-position="top" data-delay="50" data-tooltip="Notifications" href="#modalNotifications"><i class="material-icons">notifications</i></a></li>
                    <li><a class="btn-floating green tooltipped" data-position="top" data-delay="50" data-tooltip="Scan network" href="#modalCheckNetwork"><i class="material-icons">sync</i></a></li>
                    <li><a class="btn-floating red tooltipped" data-position="top" data-delay="50" data-tooltip="Delete host" href="#modalDeleteHost"><i class="material-icons">clear</i></a></li>
                    <li><a class="btn-floating bluemodal-trigger tooltipped" data-position="top" data-delay="50" data-tooltip="Add host" href="#moalFormNewNodo"><i class="material-icons">add_box</i></a></li>
                </ul>
            </div>

        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="assets/js/materialize.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.collapsible').collapsible();
            $('select').material_select();
            $('.tooltipped').tooltip({ delay: 50 });
        });
        //Starting modals
        $(document).ready(function () {
            $('#modalSettings').modal();
            $('#modalCheckNetwork').modal();
            $('#modalNotifications').modal();
            $('#modalDeleteHost').modal();
            $('#moalFormNewNodo').modal();
        });
    </script>


</body>
</html>
