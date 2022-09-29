using EmpMgmtUsingDB.Model.DummyAPIUtilityModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmpMgmtUsingDB.ServiceLayer.DummyAPIUtilityService
{
    public interface IDummyAPIService
    {
        List<UserModel> HitAPIViewDataInConSole();
        void HitAPISaveDataInDB();
        bool HitPagingAPISaveDataInDB(int pageno, int pagesize);
    }
}
