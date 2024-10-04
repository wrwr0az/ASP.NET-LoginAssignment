using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LoginApp.Admin
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //if (Session["SuccessMessage"] != null)
                //{
                //    msg.Text = Session["SuccessMessage"].ToString();
                //    Session.Remove("SuccessMessage"); // Clear the message after displaying it
                //}

                if (User.Identity.IsAuthenticated)
                {
                    string userName = User.Identity.Name;
                    string userEmail = GetUserEmail(userName);

                    TextBox1.Text = userName;
                    TextBox2.Text = userEmail;
                }
            }

        }

        private string GetUserEmail(string userName)
        {
            string email = "";

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand("SELECT UserEmail FROM Users WHERE UserName = @UserName", con);
                cmd.Parameters.AddWithValue("@UserName", userName);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    email = reader["UserEmail"].ToString();
                }
            }

            return email;
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
                con.Open();
                SqlCommand cmd = new SqlCommand("insertIntoVisitor", con);
                cmd.CommandType = CommandType.StoredProcedure;

                // Add parameters for the stored procedure
                cmd.Parameters.Add(new SqlParameter("@VistorName", TextBox1.Text));  // Username input field
                cmd.Parameters.Add(new SqlParameter("@VisitorComment", TextBox3.Text)); // Comment input field
                cmd.Parameters.Add(new SqlParameter("@VisitorEmail", TextBox2.Text)); // Emali input field
                cmd.Parameters.Add(new SqlParameter("@CommentDate", DateTime.Now)); // Comment Date input field
                cmd.Parameters.Add(new SqlParameter("@IsEnabled", "0")); // Comment Date input field

                int result = cmd.ExecuteNonQuery();  // Execute the insert

                if (result > 0)
                {
                    // Success
                    //msg.Text = "Successfully";
                    //Response.Redirect(Request.Url.AbsoluteUri);
                    //Session["SuccessMessage"] = "Message Inserted Successfully";
                    msg.Text = "The data is successfully inserted into the table";
                }
            }

            catch (Exception ex)
            {
                // Handle exception
                msg.Text = "An error occurred: " + ex.Message;
            }

        }

protected void redirectToAdminPage(object sender, EventArgs e)
{
    try
    {
        // Get the current logged-in user's username (you can adjust this based on how you're storing/logging in users)
        string currentUserName = User.Identity.Name; // Assuming the user's name is stored in the Identity

        // SQL connection setup
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString))
        {
            con.Open();

            // Query to check if the user is an admin
            SqlCommand cmd = new SqlCommand("SELECT IsAdmin FROM Users WHERE UserName = @UserName", con);
            cmd.Parameters.AddWithValue("@UserName", currentUserName);

            // Execute the command and check the result
            object result = cmd.ExecuteScalar();
            
            // Ensure that we received a result
            if (result != null && Convert.ToBoolean(result) == true)
            {
                // If the user is an admin, redirect them to the commentControl page
                Response.Redirect("~/Admin/commentControl.aspx");
            }
            else
            {
                // If the user is not an admin, show a message using JavaScript alert
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Only admins can view this page.You can login as an Admin using username Admin and password Admin.');", true);
            }
        }
    }
    catch (Exception ex)
    {
        // Handle any errors (like database connection issues)
        ClientScript.RegisterStartupScript(this.GetType(), "error", "alert('An error occurred: " + ex.Message + "');", true);
    }
}


    }
}