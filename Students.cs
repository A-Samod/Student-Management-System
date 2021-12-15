using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace Student_Management_System
{
    public partial class Students : Form
    {
        public Students()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Data Source=LAPTOP-OR3ULO9A;Initial Catalog=sigma_hec;Integrated Security=True");

        private void btnInsert_Click(object sender, EventArgs e)
        {
            int stid = int.Parse(txtStudentID.Text), nic = int.Parse(txtNIC.Text),contact_no = int.Parse(txtContactNo.Text) ;
            string name = txtName.Text, gender= "",email = txtEmail.Text, al_stream = "";
            
            if (rbtnMale.Checked == true)
            {
                gender = "male";
            }
            else 
            {
                gender = "female";
            }
            if (btnMaths.Checked == true)
            {
                al_stream = "maths";
            }
            else if(btnBio.Checked == true)
            {
                al_stream = "bio";
            }
            else if (btnArt.Checked == true)
            {
                al_stream = "art";
            }
            else if (btnCommerce.Checked == true)
            {
                al_stream = "commmerce";
            }
            else if (btnTech.Checked == true)
            {
                al_stream = "tech";
            }
            con.Open();
            SqlCommand c = new SqlCommand("exec INSERT_STUDENT '" + stid + "','" + name + "','" + nic + "','" + gender + "','" + contact_no + "','" + email + "','" + al_stream + "'", con);
            c.ExecuteNonQuery();
            MessageBox.Show("New Student details Inserted Succesfuly");
            con.Close();
            GetStDetails();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            int stid = int.Parse(txtStudentID.Text), nic = int.Parse(txtNIC.Text), contact_no = int.Parse(txtContactNo.Text);
            string name = txtName.Text, gender = "", email = txtEmail.Text, al_stream = "";

            if (rbtnMale.Checked == true)
            {
                gender = "male";
            }
            else
            {
                gender = "female";
            }
            if (btnMaths.Checked == true)
            {
                al_stream = "maths";
            }
            else if (btnBio.Checked == true)
            {
                al_stream = "bio";
            }
            else if (btnArt.Checked == true)
            {
                al_stream = "art";
            }
            else if (btnCommerce.Checked == true)
            {
                al_stream = "commerce";
            }
            else if (btnTech.Checked == true)
            {
                al_stream = "tech";
            }
            con.Open();
            SqlCommand c = new SqlCommand("exec UPDATE_STUDENT '" + stid + "','" + name + "','" + nic + "','" + gender + "','" + contact_no + "','" + email + "','" + al_stream + "'", con);
            c.ExecuteNonQuery();
            MessageBox.Show("Student details Updated Succesfuly");
            con.Close();
            GetStDetails();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            int stid = int.Parse(txtStudentID.Text);

            con.Open();
            SqlCommand c = new SqlCommand("exec DELETE_STUDENT '" + stid + "'", con);
            c.ExecuteNonQuery();
            MessageBox.Show("Student details Delected Succesfuly");
            con.Close();
            GetStDetails();
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            txtStudentID.Text = "";
            txtName.Text = "";
            txtNIC.Text = "";
            txtContactNo.Text = "";
            txtEmail.Text = "";
            rbtnMale.Checked = false;
            rbtnFemale.Checked = false;
            btnMaths.Checked = false;
            btnBio.Checked = false;
            btnArt.Checked = false;
            btnCommerce.Checked = false;
            btnTech.Checked = false;

        }
        public void GetStDetails()
        {
            SqlCommand c = new SqlCommand("exec DISPLAY_Sdetails", con);
            SqlDataAdapter ad = new SqlDataAdapter(c);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            dataGridView1.DataSource = dt;
        }

        private void Students_Load(object sender, EventArgs e)
        {
            GetStDetails();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtStudentID.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            txtName.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            txtNIC.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            string gender = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            if (gender.Equals("male"))
            {
                rbtnMale.Checked = true;
            }
            else if (gender.Equals("female"))
            {
                rbtnFemale.Checked = true;
            }
            txtContactNo.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
            txtEmail.Text = dataGridView1.CurrentRow.Cells[5].Value.ToString();
            string al_stream = dataGridView1.CurrentRow.Cells[6].Value.ToString();
            if (al_stream.Equals("maths"))
            {
                btnMaths.Checked = true;
            }
            else if (al_stream.Equals("bio"))
            {
                btnBio.Checked = true;
            }
            else if (al_stream.Equals("art"))
            {
                btnArt.Checked = true;
            }
            else if (al_stream.Equals("commerce"))
            {
                btnCommerce.Checked = true;
            }
            else if (al_stream.Equals("tech"))
            {
                btnTech.Checked = true;
            }
        }
    }
}
