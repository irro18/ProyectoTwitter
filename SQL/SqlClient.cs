using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace ProyectoTwitter.SQL
{
    public class SqlClient
    {
        public SqlConnection Conecction { get; }

        public SqlClient(string connectionString)
        {
            Conecction = new SqlConnection(connectionString);
        }

        public bool Open()
        {
            try
            {
                Conecction.Open();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool Close()
        {
            try
            {
                if (Conecction.State == System.Data.ConnectionState.Open)
                    Conecction.Close();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
