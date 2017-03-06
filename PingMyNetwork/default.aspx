<%@ Page Async="true" Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="PingMyNetwork._default" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href='http://fonts.googleapis.com/css?family=Cabin:400,500,600,700,400italic,500italic,600italic,700italic' rel='stylesheet' type='text/css' />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    <link href="assets/css/materialize.min.css" rel='stylesheet' type='text/css' />
    <link href="assets/css/animate.css" rel='stylesheet' type='text/css' />
    <link href="assets/css/style.css" rel='stylesheet' type='text/css' />
    <title>Ping My Network</title>
</head>
<body>

    <form id="form1" runat="server">

        <asp:ScriptManager runat="server" ID="sm">
        </asp:ScriptManager>

        <%-- NAV --%>
        <nav style="background-color: #0d47a1">
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
            </div>
        </div>

        <%-- MODAL - NEW HOST FORM  --%>
        <div id="moalFormNewNodo" class="modal" style="overflow: hidden !important;">
            <div class="modal-content" style="padding-bottom: 10px; padding-top: 40px;">
                <h4 style="text-align: center;">Add new host</h4>
                <br />
                <div class="row" style="width: 50%; margin-right: auto; margin-left: 25% !important; margin-top: -4.5%;">

                    <%-- INPUTS --%>
                    <div class="row" style="text-align: center;">

                        <%-- SELECT DEVICE --%>
                        <div style="width: 102%; z-index: 99999" class="input-field col s12 tooltipped" data-position="left" data-delay="50" data-tooltip="Select host device">
                            <select runat="server" id="select_device" class="icons" style="vertical-align: top;">
                                <option value="" >Select device</option>
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
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        <div class="input-field col s4 tooltipped" data-position="bottom" data-delay="50" data-tooltip="Get the MAC Address by your device IP.">
                            <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnFormMarginTop btnForm " ID="linkbtnGetMACByIP" OnClick="btnGetMACByIP_Click" Text="GET BY IP"></asp:LinkButton>
                        </div>

                        <div style="text-align: center">

                            <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnTestIp clearform orange" ID="linkbtn_ClearTextBoxNewHost" OnClick="btn_ClearTextBoxNewHost_Click" Text="CLEAR FORM"></asp:LinkButton>

                            <asp:LinkButton runat="server" CssClass="modal-action modal-close btn waves-effect waves-light green btnTestIp addform" ID="linkbtnAddFormNewHost" OnClick="btnAddFormNewHost_Click" Text="ADD HOST"></asp:LinkButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- MODAL - CHECK NETWORK -->
        <div id="modalCheckNetwork" class="modal">
            <div class="modal-content">
                <h4 style="text-align: center">Network Scan</h4>
                <br />
                <p style="margin-top: -10px; padding-left: 10%; padding-right: 10%;">
                    This tool checks the entire network for online devices, this process can take up to 3 minutes. It is important to not reload the page since it will cancel the scan. A dialog will show when the scan is finished.
                </p>

                <div class="container">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div runat="server" id="CheckNetworkContainer"></div>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="linkbtn_ScanNetwork" />
                            <asp:AsyncPostBackTrigger ControlID="linkbtn_ClearScan" />
                        </Triggers>
                    </asp:UpdatePanel>
                </div>

                <div style="text-align: center;">
                    <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnTestIp green" ID="linkbtn_ScanNetwork" OnClick="btn_ScanNetwork_Click" Text="SCAN NETWORK"></asp:LinkButton>
                    <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnTestIp orange" ID="linkbtn_ClearScan" OnClick="btn_ClearScan_Click" Text="CLEAR TABLE"></asp:LinkButton>
                </div>
            </div>
        </div>

        <!-- MODAL - DELETE HOST-->
        <div id="modalDeleteHost" class="modal">
            <div class="modal-content">
                <h4 style="text-align: center">Delete host</h4>
                <br />
                <p style="margin-top: -10px; padding-left: 10%; padding-right: 10%;">
                    This tool checks the entire network for online devices, this process can take up to 3 minutes. It is important to not reload the page since it will cancel the scan. A dialog will show when the scan is finished.
                </p>

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
                            <asp:AsyncPostBackTrigger ControlID="deletehost" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <div class="input-field col s12 m6" style="text-align: center;">

                        <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnTestIp orange" ID="refreshselect" OnClick="refreshselect_Click" Text="REFRESH SELECT"></asp:LinkButton>
                        <asp:LinkButton runat="server" CssClass="btn waves-effect waves-light btnTestIp modal-close red" ID="deletehost" OnClick="deletehost_Click" Text="DELETE HOST"></asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>

        <%-- CIRCLE BUTTON --%>
        <div class="fixed-action-btn horizontal click-to-toggle ">
            <a class="btn-floating btn-large " style="background-color: #0d47a1; min-width: 50px !important;">
                <i class="material-icons tooltipped" data-position="top" data-delay="50" data-tooltip="Menu">apps</i>
            </a>
            <ul>
                <li><a class="btn-floating green tooltipped" data-position="top" data-delay="50" data-tooltip="Network scan" href="#modalCheckNetwork"><i class="material-icons">sync</i></a></li>
                <li><a class="btn-floating red tooltipped" data-position="top" data-delay="50" data-tooltip="Delete host" href="#modalDeleteHost"><i class="material-icons">clear</i></a></li>
                <li><a class="btn-floating bluemodal-trigger tooltipped" data-position="top" data-delay="50" data-tooltip="Add host" href="#moalFormNewNodo"><i class="material-icons">add_box</i></a></li>
            </ul>
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
            $('#modalCheckNetwork').modal();
            $('#modalDeleteHost').modal();
            $('#moalFormNewNodo').modal();
        });
    </script>


</body>
</html>
