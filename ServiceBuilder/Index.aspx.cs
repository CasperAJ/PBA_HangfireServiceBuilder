using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

namespace ServiceBuilder
{
    public partial class Index : System.Web.UI.Page
    {
        List<int> list = new List<int>();


        protected void Page_Load(object sender, EventArgs e)
        {
            //MySqlConnection sqlcon = new MySqlConnection(@"Server=212.97.132.77;Database=hb49533_hangfire;Uid=hb49533_hangbot;Pwd=PBA4Jan18;Allow User Variables=true;");
            //MySqlCommand cmd = new MySqlCommand("SELECT * FROM hb49533_hangfire.Job;");

            //MySqlDataReader reader = cmd.ExecuteReader();

            //using (DataTable dt = new DataTable())
            //{
            //    sda.Fill(dt);
            //    GridView1.DataSource = dt;
            //    GridView1.DataBind();
            //}

            using (MySqlConnection con = new MySqlConnection("Server=212.97.132.77;Database=hb49533_hangfire;Uid=hb49533_hangbot;Pwd=PBA4Jan18;Allow User Variables=true;"))
            {
                using (MySqlCommand cmd = new MySqlCommand("SELECT * FROM Service"))
                {
                    using (MySqlDataAdapter sda = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            //sda.Fill(dt);
                            //GridView1.DataSource = dt;
                            //GridView1.DataBind();
                        }
                    }
                }
            }
        }
    }
}