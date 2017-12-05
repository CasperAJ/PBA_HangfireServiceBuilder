<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ServiceBuilder.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="StyleSheet1.css" rel="stylesheet" />
    <title></title>
</head>
    <body>
        <div id="Container" style="width:900px; height:600px; margin:0 auto; ">

            <div id="ModuleList" class="columnStick">
                <asp:Label ID="Label_ModuleList" runat="server" Text="Module list" Class="columnLabel"></asp:Label>
               
                 <asp:Label ID="CreateServer" runat="server" Text="Create server" Class="serviceModuleContainer"></asp:Label>
                 <asp:Label ID="Label1" runat="server" Text="Module list" Class="serviceModuleContainer"></asp:Label>
                 <asp:Label ID="Label2" runat="server" Text="Module list" Class="serviceModuleContainer"></asp:Label>
                 <asp:Label ID="Label3" runat="server" Text="Module list" Class="serviceModuleContainer"></asp:Label>
                 <asp:Label ID="Label4" runat="server" Text="Module list" Class="serviceModuleContainer"></asp:Label>
                 <asp:Label ID="Label5" runat="server" Text="Module list" Class="serviceModuleContainer"></asp:Label>


            </div>

            <div id="NewService" class="columnStick">
                <asp:Label ID="Label_NewService" runat="server" Text="New service" CssClass="columnLabel"></asp:Label>
            </div>

            <div id="ServiceModule" class="columnStick">
                <asp:Label ID="Label_ServiceModule" runat="server" Text="Service module" CssClass="columnLabel"></asp:Label>
            </div>

            <div id="ServiceInfo" class="columnStick">
                <asp:Label ID="Label_ServiceInfo" runat="server" Text="Service info" CssClass="columnLabel"></asp:Label>
            </div>

        </div>
    </body>
</html>
