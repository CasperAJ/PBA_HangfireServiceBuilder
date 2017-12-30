using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;
using System.Collections;

namespace ServiceBuilder
{
    public partial class _Default : Page
    {
        ArrayList moduleList = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (Session["moduleCount"] == null)
            { Session["moduleCount"] = 0; }
            ServiceInfo_ModuleCount.Text = "Module count: "+Session["moduleCount"].ToString();

            var moduleCountSession = Session["moduleCount"];
            int moduleCount = Int32.Parse(moduleCountSession.ToString());

            foreach (string key in Session.Keys)
            {
                if (key.Contains("ModuleNR"))
                {
                    moduleList.Add(Session[key].ToString());
                }
            }
            var moduleListToQuery = String.Join(", ", moduleList.ToArray());

            if (Request.QueryString["Module"] != null)
            {
                string moduleID = Request.QueryString["Module"];

                if(moduleList != null)
                {
                    if (moduleListToQuery.Contains(moduleID.ToString()))
                    {
                        Response.Write("<script>alert('You can only use a module once in each service');</script>");
                    }
                    else
                    {
                        Session["ModuleNR" + (moduleCount + 1)] = moduleID;
                        Session["moduleCount"] = Int32.Parse(Session["moduleCount"].ToString()) + 1;
                        Response.Redirect(Request.Url.GetLeftPart(UriPartial.Path));
                    }
                }
            }


            if (moduleCountSession != null)
            {
                foreach (string key in HttpContext.Current.Session.Keys)
                {
                    Label1.Text += string.Format("{0}: {1}<br />", key, HttpContext.Current.Session[key].ToString());
                }
            }

            //List<string> moduleList = new List<string>();

            using (MySqlConnection con = new MySqlConnection(sqlUsing))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM ServiceModule"))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            AvalibleModule_List.DataSource = dt;
                            AvalibleModule_List.DataBind();
                        }
                    }
                }

                

                if (moduleCount != 0)
                {
                    using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM ServiceModule where id in (" + moduleListToQuery + ") order by field(id,"+ moduleListToQuery+")"))
                    {
                        using (MySqlDataAdapter sda = new MySqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);

                                NewService_List.DataSource = dt;
                                NewService_List.DataBind();
                            }
                        }
                    }
                }

                if (Request.QueryString["ActiveModule_ID"] != null)
                {
                    using (MySqlCommand cmd = new MySqlCommand(
                        "SELECT * FROM hb49533_hangfire_avalibleServices.ServiceModule inner join ServiceModuleToScript on ServiceModule.id = ServiceModuleToScript.FK_ServiceModuleId inner join ParameterScripts on ServiceModuleToScript.FK_ScriptId = ParameterScripts.Id where ServiceModule.id = " + Request.QueryString["ActiveModule_ID"]))

                    {
                        using (MySqlDataAdapter sda = new MySqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                DataTable ScriptNames = new DataTable();
                                ScriptNames.Columns.Add("ScriptName");
                                DataRow newRow = ScriptNames.NewRow();

                                sda.Fill(dt);

                                foreach (DataRow row in dt.Rows)
                                {
                                    ScriptNames.Rows.Add(newRow["ScriptName"]=row["ScriptName"]);
                                    Label_ServiceModulename.Text = row["ScriptName"].ToString();
                                    ServiceModule_CreatedAt.Text = row["CreatedAt"].ToString();
                                    ServiceModule_createdBy.Text = row["CreatedBy"].ToString();
                                    ServiceModule_Version.Text = row["version"].ToString();
                                }
                                //ServiceModuleView.DataSource = dt;
                                //ServiceModuleView.DataBind();

                                ServiceModuleView_ScriptNames.DataSource = ScriptNames;
                                ServiceModuleView_ScriptNames.DataBind();
                            }
                        }
                    }
                }
            }
        }

        protected void save_service_Click(object sender, EventArgs e)
        {
            // When the button is clicked,
            // change the button text, and disable it.

            string ServiceName = ServiceInfo_ServiceName.Value;
            string ServiceDoS = ServiceInfo_DoS.InnerText;

            if (string.IsNullOrEmpty(ServiceName)||string.IsNullOrEmpty(ServiceDoS))
            {
                Response.Write("<script>alert('Service name or service Description is empty');</script>");
            }
            else
            {
                string insertParentService = "Insert into ParentService (Name, Description) values ('" + ServiceName + "','" + ServiceDoS + "')";
                // Retunere "empty - no new inserts"
                String GetLastParentServiceID = "SELECT LAST_INSERT_ID()";

                //string GetLastParentServiceID = "select * from ParentService where Name ='"+ServiceName+"' AND Description ='"+ ServiceDoS+"'";


                using (MySqlConnection con = new MySqlConnection(sqlUsing))
                {
                    con.Open();
                    MySqlCommand insert = new MySqlCommand(insertParentService, con);
                    insert.ExecuteNonQuery();
                    MySqlCommand read = new MySqlCommand(GetLastParentServiceID, con);
                    string Getid = read.ExecuteScalar().ToString();
                    //string lastID = Getid.Read().ToString();
                    //moduleListToQuery.Contains(moduleID.ToString())

                    String insertChildServices = "Insert into ChildService (FK_ParentServiceId, FK_ServiceModuleId) Values ";
                    int count = 0;
                    foreach (var ModuleID in moduleList)
                    {
                        if (count > 0) insertChildServices += ",";
                        insertChildServices += "('" + Getid + "','" + moduleList[count] + "')";
                        count++;
                    }


                    MySqlCommand insertChild = new MySqlCommand(insertChildServices, con);
                    insertChild.ExecuteNonQuery();
                }


                // Display the service has been saved text.
                if (true == false)
                {
                    Response.Write("<script>alert('Your service has been saved');</script>");
                    Session.Clear();
                    Response.Redirect(Request.Url.GetLeftPart(UriPartial.Path));
                }
            }
        }
    }
}

