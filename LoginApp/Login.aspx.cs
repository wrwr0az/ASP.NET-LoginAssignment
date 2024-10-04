using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;
using System.Data;

namespace LoginApp
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            // Open SQL Connection
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString))
            {
                try
                {
                    con.Open();

                    string hashedPassword = PasswordHelper.HashPassword(TextBox2.Text);
                    // Use a SQL Command with a stored procedure for checking user login
                    SqlCommand cmd = new SqlCommand("checkUser", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Add parameters for the stored procedure using the values from input fields
                    cmd.Parameters.Add(new SqlParameter("@UserName", TextBox1.Text));  // Username input field


                    SqlDataReader reader = cmd.ExecuteReader();


                    // Check if the login credentials match
                    if (reader.Read())
                    {

                        // Retrieve the hashed password from the database
                        string storedHashedPassword = reader["UserPassword"].ToString();

                        // Verify the password entered by the user using PasswordHelper
                        if (PasswordHelper.VerifyPassword(TextBox2.Text, storedHashedPassword))
                        {
                            // Successful login
                            FormsAuthentication.RedirectFromLoginPage(TextBox1.Text, true);
                            Response.Redirect("Admin/VisitorComment.aspx");
                        }
                        else
                        {
                            // Invalid password
                            msg.Text = "INVALID USERNAME OR PASSWORD";
                        }
                    }
                    else
                    {
                        // Invalid login
                        msg.Text = "INVALID USERNAME OR PASSWORD";
                    }

                    reader.Close();  // Close the reader before exiting
                }
                catch (Exception ex)
                {
                    // Log or handle exceptions as needed
                    Response.Write("<script>alert('An error occurred: " + ex.Message + "');</script>");
                }
            }
        }

        protected void Button2_Click2(object sender, EventArgs e)
        {
            msg.Text = "";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString))
            {
                try
                {
                    con.Open();

                    // Check if user already exists using "checkUser" stored procedure
                    SqlCommand cmd = new SqlCommand("checkUser", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    // Add parameter for the stored procedure using the username input
                    cmd.Parameters.Add(new SqlParameter("@UserName", TextBox3.Text));  // Username input field (for signup)

                    SqlDataReader reader = cmd.ExecuteReader();

                    // Check if the username already exists
                    if (reader.Read())
                    {
                        // User exists
                        userExist.Text = "USER ALREADY EXISTS";
                        reader.Close();  // Close the reader
                    }
                    else
                    {
                        reader.Close();  // Close the reader before reusing the connection

                        // Hash the password before storing it
                        string hashedPassword = PasswordHelper.HashPassword(TextBox5.Text);

                        // Insert a new user using "UserCreate" stored procedure
                        cmd = new SqlCommand("UserCreate", con);
                        cmd.CommandType = CommandType.StoredProcedure;

                        // Add parameters for the stored procedure
                        cmd.Parameters.Add(new SqlParameter("@UserName", TextBox3.Text));  // Username input field
                        cmd.Parameters.Add(new SqlParameter("@UserEmail", TextBox4.Text)); // Email input field
                        cmd.Parameters.Add(new SqlParameter("@UserPassword", hashedPassword)); // Password input field

                        int result = cmd.ExecuteNonQuery();  // Execute the insert

                        if (result > 0)
                        {
                            // Success
                            userExist.Text = "User Created Successfully";
                        }
                        else
                        {
                            userExist.Text = "Error creating user!";
                        }
                    }
                }
                catch (Exception ex)
                {
                    // Handle exception
                    userExist.Text = "An error occurred: " + ex.Message;
                }
            }
        }

    }
}
