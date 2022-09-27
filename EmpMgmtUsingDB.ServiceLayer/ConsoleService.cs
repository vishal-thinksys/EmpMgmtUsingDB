using EmpMgmtUsingDB.DataAccess;
using EmpMgmtUsingDB.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmpMgmtUsingDB.ServiceLayer
{
    public class ConsoleService
    {
        private readonly IEmployeeService _employeeService;

        public ConsoleService(IEmployeeService employeeService)
        {
            _employeeService = employeeService;
        }
        public void EntryPointInProject()
        {
            Console.WriteLine("Welcome to Employee Management System!");
            int n = CommonCommandName();

            while (n > 0)
            {
                switch (n)
                {
                    case 1:
                        _employeeService.ViewEmp();
                        n = CommonCommandName();
                        break;
                    case 2:
                        _employeeService.AddEmp();
                        n = CommonCommandName();
                        break;
                    case 3:
                        _employeeService.UpdateEmp();
                        n = CommonCommandName();
                        break;
                    case 4:
                        _employeeService.DeleteEmp();
                        n = CommonCommandName();
                        break;
                    case 5:
                        _employeeService.ViewEmpByID();
                        n = CommonCommandName();
                        break;
                    default:
                        Console.WriteLine("\nPlease enter correct key\n");
                        n = CommonCommandName();
                        break;
                }
            }
        }
        int CommonCommandName()
        {
            Console.WriteLine("\nPress 1 for View All Employee");
            Console.WriteLine("Press 2 for Add Employee");
            Console.WriteLine("Press 3 for Update Employee");
            Console.WriteLine("Press 4 for Delete Employee");
            Console.WriteLine("Press 5 for View Employee By ID");
            Console.Write("Please Enter the Number\t");
            int n;
            bool isNumerical = int.TryParse(Console.ReadLine(), out n);
            n = isNumerical ? n : 0;
            return n;
        }
        public static void PrintDetail(List<EmployeeModel> list)
        {
            for (int i = 0; i < list.Count; i++)
            {
                Console.WriteLine($"\nID              =   {list[i].EmpID}");
                Console.WriteLine($"Name            =   {list[i].FirstName} {list[i].LastName}");
                Console.WriteLine($"DOB             =   {list[i].DOB:D}");
                Console.WriteLine($"Age             =   {list[i].Age} years");
                Console.WriteLine($"Email           =   {list[i].Email}");
                Console.WriteLine($"Mobile          =   {list[i].Mob}");
                Console.WriteLine($"Salary          =   {list[i].Salary}");
                Console.WriteLine($"Date of Joinning=   {list[i].DOJ:D}");
                Console.WriteLine($"Status          =   {(list[i].IsActive==true ? "Active":"InActive")}\n");
            }

        }
        public static void Message( string message)
        {
            Console.WriteLine($"\n{message}\n");
        }
    }
}
