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
        protected void Page_Load(object sender, EventArgs e)
        {
            ArrayList moduleList = new ArrayList();

            if (Session["moduleCount"] == null)
            { Session["moduleCount"] = 0; }
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


            using (MySqlConnection con = new MySqlConnection(""))
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
                                //dt.Columns.Remove("ScriptName");

                                //Label_ServiceModulename1.Text = dt.["Name"].ToString();

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
    }
}

