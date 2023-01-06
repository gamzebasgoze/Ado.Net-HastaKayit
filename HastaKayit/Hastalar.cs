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
    public partial class Hastalar : Form
    {
        public Hastalar()
        {
            InitializeComponent();
        }
        SqlConnection con = new SqlConnection("Server =LENOVO;Database=M06;Integrated Security=true;");
        public void Getir()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HListele";
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
            cmd.CommandText = "HKaydet";
            cmd.Parameters.AddWithValue("HastaAdSoyad", textBox2.Text);
            cmd.Parameters.AddWithValue("HastaTcNo", textBox3.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", dateTimePicker1.Value);
            cmd.Parameters.AddWithValue("HastaBoy", textBox4.Text);
            cmd.Parameters.AddWithValue("HastaYas", textBox5.Text);
            cmd.Parameters.AddWithValue("Reçete", textBox6.Text);
            cmd.Parameters.AddWithValue("RaporDurumu", textBox7.Text);
            cmd.Parameters.AddWithValue("RandevuTarihi", dateTimePicker2.Value);
            cmd.Parameters.AddWithValue("DoktorNo", comboBox1.Text);
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
            cmd.CommandText = "HGuncelle";
            cmd.Parameters.AddWithValue("HastaAdSoyad", textBox2.Text);
            cmd.Parameters.AddWithValue("HastaTcNo", textBox3.Text);
            cmd.Parameters.AddWithValue("DogumTarihi", dateTimePicker1.Text);
            cmd.Parameters.AddWithValue("HastaBoy", textBox4.Text);
            cmd.Parameters.AddWithValue("HastaYas", textBox5.Text);
            cmd.Parameters.AddWithValue("Reçete", textBox6.Text);
            cmd.Parameters.AddWithValue("RaporDurumu", textBox7.Text);
            cmd.Parameters.AddWithValue("RandevuTarihi", dateTimePicker2.Text);
            cmd.Parameters.AddWithValue("DoktorNo", comboBox1.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Getir();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int sec = dataGridView1.SelectedCells[0].RowIndex;

            textBox1.Text = dataGridView1.Rows[sec].Cells[0].Value.ToString();
            textBox2.Text = dataGridView1.Rows[sec].Cells[1].Value.ToString();
            textBox3.Text = dataGridView1.Rows[sec].Cells[2].Value.ToString();
            dateTimePicker1.Text = dataGridView1.Rows[sec].Cells[3].Value.ToString();
            textBox4.Text = dataGridView1.Rows[sec].Cells[4].Value.ToString();
            textBox5.Text = dataGridView1.Rows[sec].Cells[5].Value.ToString();
            textBox6.Text = dataGridView1.Rows[sec].Cells[6].Value.ToString();
            textBox7.Text = dataGridView1.Rows[sec].Cells[7].Value.ToString();
            dateTimePicker2.Text = dataGridView1.Rows[sec].Cells[8].Value.ToString();
            comboBox1.Text = dataGridView1.Rows[sec].Cells[9].Value.ToString();
            
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Getir();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HAra";
            cmd.Parameters.AddWithValue("HastaNo", textBox9.Text);
            cmd.Parameters.AddWithValue("HastaAdSoyad", textBox10.Text);
            cmd.Parameters.AddWithValue("HastaTcNo", textBox11.Text);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            dataGridView1.DataSource = dt;
            cmd.ExecuteNonQuery();
            con.Close();
            Getir();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "HSil";
            cmd.Parameters.AddWithValue("PoliklinikNo ", textBox9.Text);
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

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Hastalar_Load(object sender, EventArgs e)
        {
            SqlCommand komut = new SqlCommand();
            komut.Connection = con;

            komut.CommandType = CommandType.StoredProcedure;
            komut.CommandText = "doktorno";

            SqlDataReader dr;

            con.Open();
            dr = komut.ExecuteReader();

            while (dr.Read())
            {
                comboBox1.Items.Add(dr["DoktorNo"]);
            }
            con.Close();
        }
    }
}
