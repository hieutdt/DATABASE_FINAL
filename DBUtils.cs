using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace CSharpTest
{
    class DBUtils
    {
        private SqlConnection connection;

        private SqlCommand buildCommand(String query, Object[,] paramList)        
        {
            SqlCommand cmd = new SqlCommand(query, connection);
            for (int i = 0; i < paramList.GetLength(0); ++i)
            {
                cmd.Parameters.AddWithValue(paramList[i, 0].ToString(), paramList[i, 1]);
            }
            return cmd;
        }

        public DBUtils(String connectionString)
        {
            connection = new SqlConnection(connectionString);
            connection.Open();
        }

        /// <summary>
        /// Perform a SELECT query.
        /// </summary>
        /// 
        /// <example>
        /// DataTable dt = Query("select * from STAFF where id = @id", new Object[,] { { "@id", 1 } })
        /// </example>
        /// 
        /// <param name="query">The SELECT statement, all params need to be prefixed with an @</param>
        /// <param name="paramList">An array of size (n x 2), each row describes a param (name, value)</param>
        /// 
        /// <returns>A DataTable containing the results of the given SELECT</returns>
        public DataTable Query(String query, Object[,] paramList)
        {
            SqlCommand cmd = buildCommand(query, paramList);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ans = new DataTable();
            da.Fill(ans);
            return ans;
        }

        /// <summary>
        /// Perform an INSERT / UPDATE / DELETE
        /// </summary>
        /// 
        /// /// <example>
        /// int rowAffected = NonQuery("delet from STAFF where id = @id", new Object[,] { { "@id", 1 } })
        /// </example>
        /// 
        /// <param name="command">The statement, all params need to be prefixed with an @</param>
        /// <param name="paramList">An array of size (n x 2), each row describes a param (name, value)</param>
        /// 
        /// <returns>Number of rows affected</returns>
        public int NonQuery(String command, Object[,] paramList)
        {
            SqlCommand cmd = buildCommand(command, paramList);
            return cmd.ExecuteNonQuery();
        }

        /// <summary>
        /// Run a stored procedure that has a SELECT statement in it.
        /// </summary>
        /// 
        /// <example>
        /// DataTable dt = CallProc("INSERT_DEPARTMENT", new Object[,] { { "@dep_name", "abc" } })
        /// </example>
        /// 
        /// <param name="procName">Procedure's name</param>
        /// <param name="paramList">An array of size (n x 2), each row describes a param (name, value)</param>
        /// 
        /// <returns>A DataTable containing the results of the given procedure</returns>
        public DataTable CallProc(String procName, Object[,] paramList)
        {
            SqlCommand cmd = buildCommand(procName, paramList);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable ans = new DataTable();
            da.Fill(ans);
            return ans;
        }

        /// <summary>
        /// Run a stored procedure that has no SELECT in it
        /// </summary>
        /// 
        /// <example>
        /// int rowAffected = CallProcNonQuery("REMOVE_DEP", new Object[, ] { { "@dep_id", 1 } })
        /// </example>
        /// 
        /// <param name="procName">Procedure's name</param>
        /// <param name="paramList">An array of size (n x 2), each row describes a param (name, value)</param>
        /// 
        /// <returns>Number of rows affected</returns>
        public int CallProcNonQuery(String procName, Object[,] paramList)
        {
            SqlCommand cmd = buildCommand(procName, paramList);
            cmd.CommandType = CommandType.StoredProcedure;
            return cmd.ExecuteNonQuery();
        }

    }
}
