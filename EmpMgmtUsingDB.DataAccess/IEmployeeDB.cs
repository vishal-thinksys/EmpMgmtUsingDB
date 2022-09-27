using EmpMgmtUsingDB.Model;

namespace EmpMgmtUsingDB.DataAccess
{
    public interface IEmployeeDB
    {
        string AddEmp(EmployeeModel model);
        string UpdateEmp(EmployeeModel model);
        int DeleteEmp(int ID);
        List<EmployeeModel> ViewEmp();
        List<EmployeeModel> ViewEmpByID(int ID);
    }
}
