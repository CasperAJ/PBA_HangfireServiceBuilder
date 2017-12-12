<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ServiceBuilder.Index" %>

<!DOCTYPE html>

<asp:GridView ID="GridView1" runat="server"></asp:GridView>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
    <title></title>
</head>
    <body>
        <div id="Container" style="width:900px; height:600px; margin:0 auto; ">

            <div id="ModuleList" class="columnStick">
                <asp:Label ID="Label_ModuleList" runat="server" Text="Module list" CssClass="infoColumnLabel"></asp:Label>

                <!- Dynamick listing from here !>
                <div class="serviceModuleContainer" onclick="">
                    <asp:Label ID="ModuleList_AvalibleModule1" runat="server" Text="Create server" CssClass="columnLabel"></asp:Label>
                </div>

                <div class="serviceModuleContainer" onclick="">
                    <asp:Label ID="ModuleList_AvalibleModule2" runat="server" Text="Install software" CssClass="columnLabel"></asp:Label>
                </div>
                <!- End dynamick listing !>

            </div>

            <div id="NewService" class="columnStick">
                <asp:Label ID="Label_NewService" runat="server" Text="New service" CssClass="infoColumnLabel"></asp:Label>
            

                <div class="serviceModuleContainer" onclick="">
                    <asp:Label ID="NewService_ServiceStart" runat="server" Text="Start" CssClass="columnLabel"></asp:Label>
                </div>

                <!- Dynamick listing from here !>
                <div class="serviceModuleContainer" onclick="">
                    
                    <asp:Label ID="NewService_ServiceModule" runat="server" Text="Install software" CssClass="columnLabel"></asp:Label>
                </div>


                <!- End dynamick listing !>
                <div class="serviceModuleContainer" onclick="">
                    <asp:Label ID="NewService_ServiceSlut" runat="server" Text="Slut" CssClass="columnLabel"></asp:Label>
                </div>


            </div>

            <div id="ServiceModule" class="columnStick">
                <asp:Label ID="Label_ServiceModule" runat="server" Text="Service module" CssClass="infoColumnLabel"></asp:Label>
               
                 <div class="serviceModuleContainer" onclick="">
                    <asp:Label ID="ServiceModule_CreatedAt" runat="server" Text="Created at: 12-05-2017" CssClass="columnLabel"></asp:Label>
                </div>
                 <div class="serviceModuleContainer" onclick="">
                    <asp:Label ID="ServiceModule_createdBy" runat="server" Text="Created by:<br>Casper Arlofelt jørgensen<br>ID-G53503" CssClass="columnLabel"></asp:Label>
                </div>
                 <div class="serviceModuleContainer" onclick="">
                    <asp:Label ID="ServiceModule_Version" runat="server" Text="Version at: 1.0" CssClass="columnLabel"></asp:Label>
                </div>

                <!- Dynamick listing from here !>
                 <div class="serviceModuleContainer" onclick="">
                    <asp:Label ID="ServiceModule_Paramater1" runat="server" Text="Paramater script 1" CssClass="columnLabel"></asp:Label>
                </div>
                 <div class="serviceModuleContainer" onclick="">
                    <asp:Label ID="ServiceModule_Paramater2" runat="server" Text="Paramater script 2" CssClass="columnLabel"></asp:Label>
                </div>

                <!- End dynamick listing !>

                 <div class="serviceModuleContainer" onclick="" style="margin-top:20px;"">
                    <asp:Label ID="ServiceModule_ExecutionDelay" runat="server" Text="Execution delay: " CssClass="columnLabel"></asp:Label>
                </div>
            
            </div>

            <div id="ServiceInfo" class="columnStick">
                <asp:Label ID="Label_ServiceInfo" runat="server" Text="Service info" CssClass="infoColumnLabel"></asp:Label>
            
                <div class="serviceModuleContainer" style="height:auto; padding:10px 0px 0px 0px;" onclick="">
                    <textarea style="overflow:hidden" id="NewService_DoS" runat="server" cols="20" rows="4" maxlength="50" placeholder="Service name"></textarea>
                </div>

                 <div class="serviceModuleContainer" onclick="">
                    <asp:Label ID="ServiceInfo_ModuleCount" runat="server" Text="Module count: " CssClass="columnLabel"></asp:Label>
                </div>
                 <div class="serviceModuleContainer" onclick="">
                    <asp:Label ID="ServiceInfo_ESTET" runat="server" Text="EST execution time:  " CssClass="columnLabel"></asp:Label>
                </div>
                 <div class="serviceModuleContainer" onclick="">
                    <asp:Label ID="ServiceInfo_CreatedAt" runat="server" Text="Created at: " CssClass="columnLabel"></asp:Label>
                </div>
                 <div class="serviceModuleContainer" onclick="">
                    <asp:Label ID="ServiceInfo_CeatedBy" runat="server" Text="Created by:<br>Søren Borring Sørensen<br>ID-G53502" CssClass="columnLabel"></asp:Label>
                </div>
                <div class="serviceModuleContainer" onclick="">
                    <asp:Label ID="ServiceInfo_Version" runat="server" Text="Version at: 1.0" CssClass="columnLabel"></asp:Label>
                </div>
                <div class="serviceModuleContainer" style="height:auto; padding:10px 0px 0px 0px;" onclick="">
                    <textarea style="overflow:hidden" id="ServiceInfo_DoS" runat="server" cols="20" rows="4" maxlength="50" placeholder="Description of service"></textarea>
                </div>

            </div>

        </div>
    </body>
</html>
