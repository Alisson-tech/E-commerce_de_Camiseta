using System;
using Ecommercedecamisa.Helpers;
using MySql.Data.MySqlClient;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Ecommercedecamisa.Models
{
    public class LogDados
    {
        public static bool LogUser(string email, string senha)
        {
            var ret = false;

            using (var conexao = new MySqlConnection())
            {
                conexao.ConnectionString = ConfigurationManager.ConnectionStrings["principal"].ConnectionString;


                conexao.Open();

                using (var comando = new MySqlCommand())
                {
                    comando.Connection = conexao;


                    comando.CommandText = "Select email, senha from usuario where email=@email and senha=@senha;";

                    comando.Parameters.Add("@email", MySqlDbType.VarChar).Value = CriptoHelper.HashMD5(email);
                    comando.Parameters.Add("@senha", MySqlDbType.VarChar).Value = CriptoHelper.HashMD5(senha);

                    ret = ((int)comando.ExecuteScalar() > 0);

                }

                return ret;
            }
        }
    }
}