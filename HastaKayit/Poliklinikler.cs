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
    public partial class Poliklinikler : Form
    {
        public Poliklinikler()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Server =LENOVO;Database=M06;Integrated Security=true;");

        public void Getir()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PListele";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
        }


        private void button1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PKaydet";
            cmd.Parameters.AddWithValue("PoliklinikAdı", textBox2.Text);
            cmd.Parameters.AddWithValue("PoliklinikUzmanSayısı", textBox3.Text);
            cmd.Parameters.AddWithValue("PoliklinikBaskanı", textBox4.Text);
            cmd.Parameters.AddWithValue("PoliklinikBashemsire", textBox5.Text);
            cmd.Parameters.AddWithValue("PoliklinikYatakSayısı", textBox6.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Getir();
        }

     

        private void button2_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PGuncelle";
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox1.Text);
            cmd.Parameters.AddWithValue("PoliklinikAdı", textBox2.Text);
            cmd.Parameters.AddWithValue("PoliklinikUzmanSayısı", textBox3.Text);
            cmd.Parameters.AddWithValue("PoliklinikBaskanı", textBox4.Text);
            cmd.Parameters.AddWithValue("PoliklinikBashemsire", textBox5.Text);
            cmd.Parameters.AddWithValue("PoliklinikYatakSayısı", textBox6.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Getir();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Getir();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int sec = dataGridView1.SelectedCells[0].RowIndex;

            textBox1.Text = dataGridView1.Rows[sec].Cells[0].Value.ToString();
            textBox2.Text = dataGridView1.Rows[sec].Cells[1].Value.ToString();
            textBox3.Text = dataGridView1.Rows[sec].Cells[2].Value.ToString();
            textBox4.Text = dataGridView1.Rows[sec].Cells[3].Value.ToString();
            textBox5.Text = dataGridView1.Rows[sec].Cells[4].Value.ToString();
            textBox6.Text = dataGridView1.Rows[sec].Cells[5].Value.ToString();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PAra";
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox7.Text);
            cmd.Parameters.AddWithValue("PoliklinikAdı", textBox8.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            cmd.ExecuteNonQuery();
            con.Close();
            Getir();

        }

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PSil";
            cmd.Parameters.AddWithValue("PoliklinikNo ", textBox9.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Getir();
        }

        private void button6_Click(object sender, EventArgs e)
        {

        }

        private void button6_Click_1(object sender, EventArgs e)
        {
            Form1 go = new Form1();
            go.Show();
            this.Hide();
        }
    }
}
