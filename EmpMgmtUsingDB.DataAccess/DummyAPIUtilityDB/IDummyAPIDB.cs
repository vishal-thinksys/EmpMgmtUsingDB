using EmpMgmtUsingDB.Model.DummyAPIUtilityModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmpMgmtUsingDB.DataAccess.DummyAPIUtilityDB
{
    public interface IDummyAPIDB
    {
        void HitAPISaveDataInDB(APIResponseModel model);
    }
}
