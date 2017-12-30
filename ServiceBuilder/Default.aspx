<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ServiceBuilder._Default"   %>

<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<asp:Label runat="server" ID="Label1" ></asp:Label>
<asp:Label runat="server" ID="Label2" ></asp:Label>

    <div id="Container" style="width:900px; height:600px; margin:0 auto; ">


 <!------------------- NEW COLUMN ----- MODULE LIST #1 ------------------->
        <div id="ModuleList" class="columnStick">
            <asp:Label ID="Label_ModuleList" runat="server" Text="Module list" CssClass="infoColumnLabel"></asp:Label>

            <!- Dynamick listing from here !>
            <asp:ListView ID="AvalibleModule_List" runat="server">
                <LayoutTemplate>
                    <table>
                    <tr id="itemPlaceholder" runat="server"></tr>
                    </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td class="serviceModuleContainer">
                        <a href="?Module=<%#Eval("ID")%>">
                        <asp:Label Visible="false" runat="server" ID="ModuleID"><%#Eval("ID")%></asp:Label>
                        <asp:Label CssClass="columnLabel" runat="server" ID="ModuleName"><%#Eval("Name")%></asp:Label>
                        </a>
                    </td>
                </tr>
            </ItemTemplate>
            </asp:ListView>

            <!- End dynamick listing !>
        </div>
 <!------------------- END COLUMN ----- MODULE LIST #1 ------------------->


 <!------------------- NEW COLUMN ----- NEW SERVICE #2 ------------------->
        <div id="NewService" class="columnStick">
            <asp:Label ID="Label_NewService" runat="server" Text="New service" CssClass="infoColumnLabel"></asp:Label>
            

            <div class="serviceModuleContainer">
                <asp:Label ID="NewService_ServiceStart" runat="server" Text="Start" CssClass="columnLabel"></asp:Label>
            </div>

            <!- Dynamick listing from here !>

            <asp:ListView ID="NewService_List" runat="server">

                <LayoutTemplate>
                    <table>
                    <tr id="itemPlaceholder" runat="server"></tr>
                    </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td class="serviceModuleContainer">
                            <a href="?ActiveModule_ID=<%#Eval("ID")%>">
                                <asp:Label CssClass="columnLabel" runat="server" ID="ModuleName"><%#Eval("Name")%></asp:Label>
                            </a>
                    </td>
                </tr>
            </ItemTemplate>
            </asp:ListView>

            <!- End dynamick listing !>
            <div class="serviceModuleContainer">
                <asp:Label ID="NewService_ServiceSlut" runat="server" Text="Slut" CssClass="columnLabel"></asp:Label>
            </div>
        </div>
 <!------------------- END COLUMN ----- NEW SERVICE #2 ------------------->


 <!------------------- NEW COLUMN ----- SERVICE MODULE #3 ------------------->
        <div id="ServiceModule" class="columnStick">
            <asp:Label ID="Label_ServiceModule" runat="server" Text="Service module" CssClass="infoColumnLabel"></asp:Label>
               

<%--            <asp:ListView ID="ServiceModuleView" runat="server">
                <LayoutTemplate>
                    <table>
                    <tr id="itemPlaceholder" runat="server"></tr>
                    </table>
            </LayoutTemplate>--%>
            <table style="margin-bottom:25px">
                <tr>
                    <td class="serviceModuleContainer">
                            <asp:Label CssClass="columnLabel" runat="server" ID="Label_ServiceModulename">Module name: N/A</asp:Label>
                    </td>
                    <td class="serviceModuleContainer">
                            <asp:Label CssClass="columnLabel" runat="server" ID="ServiceModule_CreatedAt">Created at: N/A</asp:Label>
                    </td>
                    <td class="serviceModuleContainer">
                            <asp:Label CssClass="columnLabel" runat="server" ID="ServiceModule_createdBy">Created by: N/A</asp:Label>
                    </td>
                    <td class="serviceModuleContainer">
                            <asp:Label CssClass="columnLabel" runat="server" ID="ServiceModule_Version">Version: N/A</asp:Label>
                    </td>
<%--                    <td class="serviceModuleContainer">
                            <asp:Label CssClass="columnLabel" runat="server" ID="ServiceModule_Script"><%#Eval("ScriptName")%></asp:Label>
                    </td>--%>
                </tr>
            </table>
            <%--</asp:ListView>--%>

            <!- Dynamick listing from here !>
               
            <asp:ListView ID="ServiceModuleView_ScriptNames" runat="server">
                <LayoutTemplate>
                    <table>
                    <tr id="itemPlaceholder" runat="server"></tr>
                    </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td class="serviceModuleContainer">
                            <asp:Label CssClass="columnLabel" runat="server" ID="ServiceModule_Script"><%#Eval("ScriptName")%></asp:Label>
                    </td>
                </tr>
            </ItemTemplate>
            </asp:ListView>

            <!- End dynamick listing !>

                <div class="serviceModuleContainer"   style="margin-top:20px;"">
                <asp:Label ID="ServiceModule_ExecutionDelay" runat="server" Text="Execution delay: " CssClass="columnLabel"></asp:Label>
            </div>
            
        </div>
 <!------------------- END COLUMN ----- SERVICE MODULE #3 ------------------->


 <!------------------- NEW COLUMN ----- SERVICE INFO #4 ------------------->
        <div id="ServiceInfo" class="columnStick">
            <asp:Label ID="Label_ServiceInfo" runat="server" Text="Service info" CssClass="infoColumnLabel"></asp:Label>
            
            <div class="serviceModuleContainer textarea">
                <input id="ServiceInfo_ServiceName" runat="server" placeholder="Service name" type="text" />
            </div>
            <div class="serviceModuleContainer">
                <asp:Label ID="ServiceInfo_ModuleCount" runat="server" Text="Module count: " CssClass="columnLabel"></asp:Label>
            </div>
                <div class="serviceModuleContainer">
                <asp:Label ID="ServiceInfo_ESTET" runat="server" Text="EST execution time:  " CssClass="columnLabel"></asp:Label>
            </div>
                <div class="serviceModuleContainer">
                <asp:Label ID="ServiceInfo_CreatedAt" runat="server" Text="Created at: " CssClass="columnLabel"></asp:Label>
            </div>
                <div class="serviceModuleContainer">
                <asp:Label ID="ServiceInfo_CeatedBy" runat="server" Text="Created by:<br>Søren Borring Sørensen<br>ID-G53502" CssClass="columnLabel"></asp:Label>
            </div>
            <div class="serviceModuleContainer">
                <asp:Label ID="ServiceInfo_Version" runat="server" Text="Version at: 1.0" CssClass="columnLabel"></asp:Label>
            </div>
            <div class="serviceModuleContainer textarea">
                <textarea style="overflow:hidden" id="ServiceInfo_DoS" runat="server" cols="20" rows="4" maxlength="50" placeholder="Description of service"></textarea>
            </div>

        </div>
 <!------------------- END COLUMN ----- SERVICE INFO #4 ------------------->


 <!------------------- New BUTTON ----- SAVE SERVICE ------------------->

            <asp:Button ID="save_service" runat="server" Text="Button" OnClick="save_service_Click"/>
    </div>

</asp:Content>
