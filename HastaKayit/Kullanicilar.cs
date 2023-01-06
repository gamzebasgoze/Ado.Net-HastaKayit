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

namespace HastaKayit
{
    public partial class Kullanicilar : Form
    {
        public Kullanicilar()
        {
            InitializeComponent();
        }

        SqlConnection con = new SqlConnection("Server =LENOVO;Database=M06;Integrated Security=true;");
        private void Form1_Load(object sender, EventArgs e)
        {
            groupBox1.Visible = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            groupBox1.Visible = true;
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {
           // groupBox1.Visible = false;

        }

        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "KGriris";
            cmd.Parameters.AddWithValue("KullaniciAdi", textBox1.Text);
            cmd.Parameters.AddWithValue("Sifre", textBox2.Text);

            SqlDataReader oku;
            oku = cmd.ExecuteReader();
            if (oku.Read())
            {
                MessageBox.Show("Kullanıcı Girişi Başarılı");
                Form1 go = new Form1();
                go.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Kullanıcı adı veya şifre hatalı");
                textBox1.Clear();
                textBox2.Clear();
            }

        }

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "KEkle";
            cmd.Parameters.AddWithValue("KullaniciAdi", textBox3.Text);
            cmd.Parameters.AddWithValue("Sifre", textBox4.Text);
            cmd.Parameters.AddWithValue("Email", textBox5.Text);
            cmd.Parameters.AddWithValue("Telefon", maskedTextBox1.Text);
            cmd.ExecuteNonQuery();
            MessageBox.Show("Kayıt Başarıyla Tamamlandı");
            con.Close();
            
        }
    }
}
