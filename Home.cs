using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Student_Management_System
{
    public partial class Home : Form
    {
        public Home()
        {
            InitializeComponent();
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
     
        private void btnMinimize_Click(object sender, EventArgs e)
        {
            WindowState = FormWindowState.Minimized;
        }

        private void timer1_Tick_1(object sender, EventArgs e)
        {
            label3.Text = DateTime.Now.ToString(" dddd, MMM dd yyyy");
            label5.Text = DateTime.Now.ToString("                         hh:mm:ss");
        }

        private void btnHome_Click(object sender, EventArgs e)
        {
            Home f = new Home();
            this.Hide();
            f.Show();
        }

        private void btnstudents_Click(object sender, EventArgs e)
        {
            Students f = new Students();
            f.TopLevel = false;
            panel3.Controls.Add(f);
            f.BringToFront();
            f.Show();
        }

       
    }
}
