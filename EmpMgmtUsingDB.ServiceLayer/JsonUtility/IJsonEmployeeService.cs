using EmpMgmtUsingDB.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmpMgmtUsingDB.ServiceLayer.JsonUtility
{
    public interface IJsonEmployeeService
    {
        void ConvertListToJson(List<EmployeeModel> list);
    }
}
