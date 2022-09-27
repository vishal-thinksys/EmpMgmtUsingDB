using Dapper;
using EmpMgmtUsingDB.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace EmpMgmtUsingDB.DataAccess
{
    public class EmployeeDB : IEmployeeDB
    {
        string cs;
        public EmployeeDB()
        {
            cs = ConfigurationManager.ConnectionStrings["EmpDB"].ConnectionString;
        }

        public string AddEmp(EmployeeModel model)
        {
            using (SqlConnection connection = new SqlConnection(cs))
            {
                var queryParameters = new DynamicParameters();
                queryParameters.Add("@FirstName", model.FirstName);
                queryParameters.Add("@LastName", model.LastName);
                queryParameters.Add("@Email", model.Email);
                queryParameters.Add("@Mob", model.Mob);
                queryParameters.Add("@DOB", model.DOB, DbType.Date);
                queryParameters.Add("@Salary", model.Salary);
                queryParameters.Add("@DOJ", model.DOJ, DbType.Date);
                string results = connection.ExecuteScalar("sp_EmpDetail_ADD", queryParameters, commandType: CommandType.StoredProcedure).ToString();
                return results;
            }
        }

        public int DeleteEmp(int ID)
        {
            using (SqlConnection connection = new SqlConnection(cs))
            {
                var queryParameters = new DynamicParameters();
                queryParameters.Add("@EmpID", ID);
                var results = connection.Execute("sp_EmpDetail_Delete", queryParameters, commandType: CommandType.StoredProcedure);
                return (int)results;
            }
        }

        public string UpdateEmp(EmployeeModel model)
        {
            using (SqlConnection connection = new SqlConnection(cs))
            {
                var queryParameters = new DynamicParameters();
                queryParameters.Add("@EmpID", model.EmpID);
                queryParameters.Add("@FirstName", model.FirstName);
                queryParameters.Add("@LastName", model.LastName);
                queryParameters.Add("@Email", model.Email);
                queryParameters.Add("@Mob", model.Mob);
                queryParameters.Add("@DOB", model.DOB, DbType.Date);
                queryParameters.Add("@Salary", model.Salary);
                queryParameters.Add("@DOJ", model.DOJ, DbType.Date);
                queryParameters.Add("@IsActive", model.IsActive, DbType.Boolean);
                string results = connection.ExecuteScalar("sp_EmpDetail_Update", queryParameters, commandType: CommandType.StoredProcedure).ToString();
                return results;
            }
        }

        public List<EmployeeModel> ViewEmp()
        {           
            using (SqlConnection connection = new SqlConnection(cs))
            {
                var results = connection.ExecuteReader("sp_EmpDetail_View", commandType: CommandType.StoredProcedure);
                DataTable dt = new DataTable();
                dt.Load(results);
                return ConvertDataTableToList(dt);                
            }           
        }

        public List<EmployeeModel> ViewEmpByID(int ID)
        {
            using (SqlConnection connection = new SqlConnection(cs))
            {
                var queryParameters = new DynamicParameters();
                queryParameters.Add("@EmpID", ID);
                var results = connection.ExecuteReader("sp_EmpDetail_View", queryParameters, commandType: CommandType.StoredProcedure);
                DataTable dt = new DataTable();
                dt.Load(results);
                return ConvertDataTableToList(dt);
            }
         
        }
        List<EmployeeModel> ConvertDataTableToList(DataTable dt)
        {
            List<EmployeeModel> list = new List<EmployeeModel>();
            if (dt != null)
            {
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {//ID,FirstName,LastName,Email,Mob,DOB,Age,DOJ,Salary,IsActive
                        EmployeeModel model = new EmployeeModel();
                        model.EmpID = Convert.ToInt32(dt.Rows[i]["ID"]);
                        model.FirstName = dt.Rows[i]["FirstName"].ToString();
                        model.LastName = dt.Rows[i]["LastName"].ToString();
                        model.Email = dt.Rows[i]["Email"].ToString();
                        model.Mob = long.Parse(dt.Rows[i]["Mob"].ToString());
                        model.DOB = Convert.ToDateTime(dt.Rows[i]["DOB"]);
                        model.Age = Convert.ToInt32(dt.Rows[i]["Age"]);
                        model.DOJ = Convert.ToDateTime(dt.Rows[i]["DOJ"]);
                        model.Salary = Convert.ToDouble(dt.Rows[i]["Salary"]);
                        model.IsActive = Convert.ToBoolean(dt.Rows[i]["IsActive"]);
                        list.Add(model);
                    }
                }
            }
            return list;
        }
    }
}
