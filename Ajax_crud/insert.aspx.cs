using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Ajax_crud
{
    public partial class insert : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\student\Documents\My_DB.mdf;Integrated Security=True;Connect Timeout=30");
        string name, city,opr;
        string oldname, newname;
        protected void Page_Load(object sender, EventArgs e)
        {
            
                opr = Request.QueryString["opr"].ToString();

                if (opr == "insert")
                {
                    name = Request.QueryString["nm"].ToString();
                    city = Request.QueryString["ct"].ToString();
                    con.Open();
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "insert into info values('" + name.ToString() + "','" + city.ToString() + "')";
                    cmd.ExecuteNonQuery();

                    con.Close();
                }
                if (opr == "display")
                {
                    con.Open();
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "select * from info";
                    cmd.ExecuteNonQuery();

                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);

                    Response.Write("<table>");
                    Response.Write("<tr>");
                    Response.Write("<td>"); Response.Write("name"); Response.Write("</td>");
                    Response.Write("<td>"); Response.Write("city"); Response.Write("</td>");
                    Response.Write("</tr>");


                    foreach(DataRow dr in dt.Rows)
                    {
                        
                        Response.Write("<tr>");
                        Response.Write("<td>"); Response.Write(dr["name"].ToString()); Response.Write("</td>");
                        Response.Write("<td>"); Response.Write(dr["city"].ToString()); Response.Write("</td>");
                        Response.Write("</tr>");
                    }
                    Response.Write("</table>");
                    con.Close();
                }

                if(opr == "delete")
                {
                    name = Request.QueryString["nm"].ToString();
                    con.Open();
                    SqlCommand cmd = con.CreateCommand();
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "delete from info where name='"+name.ToString()+"'";
                    cmd.ExecuteNonQuery();

                    con.Close();
                }

            if (opr == "update")
            {
                oldname = Request.QueryString["oldname"].ToString();
                newname = Request.QueryString["newname"].ToString();
                con.Open();
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "update info set name ='"+newname.ToString()+"' where name ='"+oldname.ToString()+"'";
                cmd.ExecuteNonQuery();

                con.Close();
            }


        }
    }
}