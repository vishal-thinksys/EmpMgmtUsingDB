using EmpMgmtUsingDB.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmpMgmtUsingDB.ServiceLayer
{
    public interface IEmployeeService
    {
        void AddEmp();
        void UpdateEmp();
        void DeleteEmp();
        void ViewEmp();
        void ViewEmpByID();
    }
}
