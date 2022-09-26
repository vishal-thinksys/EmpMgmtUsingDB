using EmpMgmtUsingDB.Model;

namespace EmpMgmtUsingDB.DataAccess
{
    public interface IEmployeeDB
    {
        int AddEmp(EmployeeModel model);
        void UpdateEmp(int ID);
        int DeleteEmp(int ID);
        List<EmployeeModel> ViewEmp();
        List<EmployeeModel> ViewEmpByID(int ID);
    }
}
