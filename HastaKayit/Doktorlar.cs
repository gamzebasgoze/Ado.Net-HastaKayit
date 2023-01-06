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
    public partial class Doktorlar : Form
    {
        public Doktorlar()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Server =LENOVO;Database=M06;Integrated Security=true;");
        public void Getir()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DListele";
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
            cmd.CommandText = "DKaydet";
            cmd.Parameters.AddWithValue("DoktorAdSoyad", textBox2.Text);
            cmd.Parameters.AddWithValue("DoktorTc", textBox3.Text);
            cmd.Parameters.AddWithValue("DoktorUzmanlıkAlani", comboBox1.SelectedItem);
            cmd.Parameters.AddWithValue("DoktorUnvani", textBox4.Text);
            cmd.Parameters.AddWithValue("DoktorTelefonNumarasi", maskedTextBox1.Text);
            cmd.Parameters.AddWithValue("DoktorAdres", textBox5.Text);
            cmd.Parameters.AddWithValue("DoktorDogumTarihi", dateTimePicker1.Value);
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox7.Text);
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
            cmd.CommandText = "DGuncelle";
            cmd.Parameters.AddWithValue("DoktorAdSoyad", textBox2.Text);
            cmd.Parameters.AddWithValue("DoktorTc", textBox3.Text);
            cmd.Parameters.AddWithValue("DoktorUzmanlıkAlani", comboBox1.SelectedItem);
            cmd.Parameters.AddWithValue("DoktorUnvani", textBox4.Text);
            cmd.Parameters.AddWithValue("DoktorTelefonNumarasi", maskedTextBox1.Text);
            cmd.Parameters.AddWithValue("DoktorAdres", textBox5.Text);
            cmd.Parameters.AddWithValue("DoktorDogumTarihi", dateTimePicker1.Text);
            cmd.Parameters.AddWithValue("PoliklinikNo", textBox5.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Getir();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Getir();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int sec = dataGridView1.SelectedCells[0].RowIndex;

            textBox1.Text = dataGridView1.Rows[sec].Cells[0].Value.ToString();
            textBox2.Text = dataGridView1.Rows[sec].Cells[1].Value.ToString();
            textBox3.Text = dataGridView1.Rows[sec].Cells[2].Value.ToString();
            comboBox1.SelectedItem = dataGridView1.Rows[sec].Cells[3].Value.ToString();
            textBox4.Text = dataGridView1.Rows[sec].Cells[4].Value.ToString();
            maskedTextBox1.Text = dataGridView1.Rows[sec].Cells[5].Value.ToString();
            textBox5.Text = dataGridView1.Rows[sec].Cells[6].Value.ToString();
            dateTimePicker1.Text = dataGridView1.Rows[sec].Cells[7].Value.ToString();
            textBox5.Text = dataGridView1.Rows[sec].Cells[8].Value.ToString();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DAra";
            cmd.Parameters.AddWithValue("DoktorNo", textBox8.Text);
            cmd.Parameters.AddWithValue("DoktorAdSoyad", textBox9.Text);
            cmd.Parameters.AddWithValue("DoktorTc", textBox10.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            dataGridView1.DataSource = dt;
            cmd.ExecuteNonQuery();
            con.Close();
            Getir();
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Form1 go = new Form1();
            go.Show();
            this.Hide();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
