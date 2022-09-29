using Dapper;
using EmpMgmtUsingDB.Model.DummyAPIUtilityModel;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace EmpMgmtUsingDB.DataAccess.DummyAPIUtilityDB
{
    public class DummyAPIDB : IDummyAPIDB
    {
        string cs;
        public DummyAPIDB()
        {
            cs = ConfigurationManager.ConnectionStrings["EmpDB"].ConnectionString;
        }
        public void HitAPISaveDataInDB(APIResponseModel model)
        {
            using (SqlConnection connection = new SqlConnection(cs))
            {
                var queryParameters = new DynamicParameters();                
                queryParameters.Add("@ResponseData", model.ResponseData);
                queryParameters.Add("@APIHitStartTime", model.APIHitStartTime, DbType.Date);
                queryParameters.Add("@APIHitEndTime", model.APIHitEndTime, DbType.Date);
                queryParameters.Add("@TotalTimeTakenByAPIHit", model.TotalTimeTakenByAPIHit, DbType.Time);
                connection.Execute("sp_DummyAPIData_ADD", queryParameters, commandType: CommandType.StoredProcedure);
                
            }
        }
    }
}
