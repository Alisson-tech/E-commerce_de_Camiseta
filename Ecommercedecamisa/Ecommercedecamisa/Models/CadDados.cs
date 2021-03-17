using Ecommercedecamisa.Helpers;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace Ecommercedecamisa.Models
{
    public class CadDados
    {
        public static bool CadUser(string CPF, string nome, string email, string senha)
        {
            var ret = false;

            using (var conexao = new MySqlConnection())
            {
                conexao.ConnectionString = ConfigurationManager.ConnectionStrings["principal"].ConnectionString;


                conexao.Open();

                using (var comando = new MySqlCommand())
                {
                    comando.Connection = conexao;


                    comando.CommandText = "Insert into usuario (CPF,email,nome,senha) values (@CPF, @email, @nome, @senha ); ";

                    comando.Parameters.Add("@CPF", MySqlDbType.VarChar).Value = CPF; //CriptoHelper.HashMD5(CPF);
                    comando.Parameters.Add("@email", MySqlDbType.VarChar).Value = email;//CriptoHelper.HashMD5(email);
                    comando.Parameters.Add("@nome", MySqlDbType.VarChar).Value = nome;//CriptoHelper.HashMD5(nome);
                    comando.Parameters.Add("@senha", MySqlDbType.VarChar).Value = senha;//CriptoHelper.HashMD5(senha);

                    ret = (comando.ExecuteNonQuery() > 0);

                }

                return ret;
            }
        }
    }
}