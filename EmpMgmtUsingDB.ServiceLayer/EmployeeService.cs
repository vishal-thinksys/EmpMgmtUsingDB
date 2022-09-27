using EmpMgmtUsingDB.DataAccess;
using EmpMgmtUsingDB.Model;
using EmpMgmtUsingDB.ServiceLayer.JsonUtility;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace EmpMgmtUsingDB.ServiceLayer
{
    public class EmployeeService : IEmployeeService
    {
        private readonly IEmployeeDB _employeeDB;
        private readonly IJsonEmployeeService _jsonEmployeeService;

        public EmployeeService(IEmployeeDB employeeDB, IJsonEmployeeService jsonEmployeeService)
        {
            _employeeDB = employeeDB;
            _jsonEmployeeService = jsonEmployeeService;
        }

        public void AddEmp()
        {
            EmployeeModel emp = new EmployeeModel();
            do
            {
                Console.WriteLine("Please Enter Employee First Name:\t");
                emp.FirstName = Console.ReadLine() ?? "";
            }
            while (emp.FirstName == "");

            do
            {
                Console.WriteLine("Please Enter Employee Last Name:\t");
                emp.LastName = Console.ReadLine() ?? "";
            }
            while (emp.LastName == "");

            bool temp;
            do
            {
                temp = true;
                Console.WriteLine("Please Enter Employee DOB (dd-mm-yyyy):\t");
                DateTime dat;
                if (DateTime.TryParseExact(Console.ReadLine(), "dd-MM-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dat))
                {
                    temp = false;
                    emp.DOB = dat;
                }
                if (temp)
                    Console.WriteLine("You are enter wrong Date");
            }
            while (temp);

            do
            {
                Console.WriteLine("Please Enter Employee EmailId:\t");
                string mail = Console.ReadLine() ?? "";
                emp.Email = mail.Contains('@') ? mail : "";
                if (emp.Email == "")
                    Console.WriteLine("You are enter wrong email!");
                //Console.WriteLine("Please Enter Employee EmailId:\t");
                //emp.Email = Console.ReadLine() ?? "";
            }
            while (emp.Email == "");

            do
            {
                temp = true;
                Console.WriteLine("Please Enter Employee MobileNo:\t");
                string mob = Console.ReadLine() ?? "";
                if (mob.ToString().Length == 10)
                {
                    long r;
                    if (long.TryParse(mob, out r))
                    {
                        temp = false;
                        emp.Mob = r;
                    }
                }
            }
            while (temp);

            do
            {
                temp = true;
                Console.WriteLine("Please Enter Employee Salary:\t");
                string salary = Console.ReadLine() ?? "";
                double sal;
                if (double.TryParse(salary, out sal))
                {
                    temp = false;
                    emp.Salary = sal;
                }
            }
            while (temp);

            do
            {
                temp = true;
                Console.WriteLine("Please Enter Employee DOJ (dd-mm-yyyy):\t");
                DateTime dat;
                if (DateTime.TryParseExact(Console.ReadLine(), "dd-MM-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dat))
                {
                    temp = false;
                    emp.DOJ = dat;
                }
            } while (temp);

            ConsoleService.Message(_employeeDB.AddEmp(emp));

        }
        public void DeleteEmp()
        {
            Console.Write("Please Enter Employee ID Which you want to delete:\t");
            int n;
            if (int.TryParse(Console.ReadLine(), out n))
            {
                if (n > 0)
                {
                    List<EmployeeModel> list = _employeeDB.ViewEmpByID(n);
                    if (list.Count > 0)
                    {
                        ConsoleService.PrintDetail(list);
                        Console.WriteLine("Are you sure want to delete then press y:\t");
                        if (Console.ReadLine() == "y")
                        {
                            int result = _employeeDB.DeleteEmp(n);
                            if (result > 0)
                                ConsoleService.Message("Employee detail deleted successfully.");
                            else
                                ConsoleService.Message("Something went wrong please try again!");
                        }
                        else
                            ConsoleService.Message("You are enter wrong key");
                    }
                    else
                        ConsoleService.Message("No Record Found!");
                }
                else
                    ConsoleService.Message("Your Employee ID was wrong please try again!");
            }
            else
                ConsoleService.Message("Your Employee ID was wrong please try again!");

        }
        public void UpdateEmp()
        {
            Console.Write("Please Enter Employee ID Which you want to update:\t");
            int n;
            if (int.TryParse(Console.ReadLine(), out n))
            {
                if (n > 0)
                {
                    List<EmployeeModel> list = _employeeDB.ViewEmpByID(n);
                    if (list.Count > 0)
                    {
                        ConsoleService.PrintDetail(list);
                        Console.WriteLine("Press 1 for Name");
                        Console.WriteLine("Press 2 for DOB");
                        Console.WriteLine("Press 3 for EmailId");
                        Console.WriteLine("Press 4 for MobileNo");
                        Console.WriteLine("Press 5 for Salary");
                        Console.WriteLine("Press 6 for DOJ");
                        Console.WriteLine("Press 6 for change Employee status");
                        Console.Write("Please Enter the number:\t");
                        int m = int.TryParse(Console.ReadLine(), out m) ? m : 0;
                        EmployeeModel emp = list.FirstOrDefault();

                        bool temp;
                        switch (m)
                        {
                            case 1:
                                do
                                {
                                    Console.WriteLine("Please Enter Employee First Name:\t");
                                    emp.FirstName = Console.ReadLine() ?? "";
                                    if (emp.FirstName == "")
                                        Console.WriteLine("\nPlease Enter First Name!\n");
                                } while (emp.FirstName == "");

                                do
                                {
                                    Console.WriteLine("Please Enter Employee Last Name:\t");
                                    emp.LastName = Console.ReadLine() ?? "";
                                    if (emp.FirstName == "")
                                        Console.WriteLine("\nPlease Enter Last Name!\n");
                                } while (emp.LastName == "");

                                ConsoleService.Message(_employeeDB.UpdateEmp(emp));

                                break;

                            case 2:
                                do
                                {
                                    temp = true;
                                    Console.WriteLine("Please Enter Employee DOB (dd-mm-yyyy):\t");
                                    DateTime dat;
                                    if (DateTime.TryParseExact(Console.ReadLine(), "dd-MM-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dat))
                                    {
                                        temp = false;
                                        emp.DOB = dat;
                                    }
                                    if (temp)
                                        Console.WriteLine("You are enter wrong Date");
                                } while (temp);

                                ConsoleService.Message(_employeeDB.UpdateEmp(emp));

                                break;

                            case 3:
                                do
                                {
                                    Console.WriteLine("Please Enter Employee EmailId:\t");
                                    string mail = Console.ReadLine() ?? "";
                                    emp.Email = mail.Contains('@') ? mail : "";
                                    if (emp.Email == "")
                                        Console.WriteLine("You are enter wrong email!");
                                } while (emp.Email == "");

                                ConsoleService.Message(_employeeDB.UpdateEmp(emp));

                                break;

                            case 4:
                                do
                                {
                                    temp = true;
                                    Console.WriteLine("Please Enter Employee MobileNo:\t");
                                    string mob = Console.ReadLine() ?? "";
                                    if (mob.ToString().Length == 10)
                                    {
                                        long r;
                                        if (long.TryParse(mob, out r))
                                        {
                                            temp = false;
                                            emp.Mob = r;
                                        }
                                    }
                                    if (temp)
                                        Console.WriteLine("Please Enter Valid Mobile No");
                                } while (temp);

                                ConsoleService.Message(_employeeDB.UpdateEmp(emp));

                                break;

                            case 5:
                                do
                                {
                                    temp = true;
                                    Console.WriteLine("Please Enter Employee Salary:\t");
                                    string salary = Console.ReadLine() ?? "";
                                    double sal;
                                    if (double.TryParse(salary, out sal))
                                    {
                                        temp = false;
                                        emp.Salary = sal;
                                    }
                                    if (temp)
                                        Console.WriteLine("Please Enter Valid Amount");
                                } while (temp);

                                ConsoleService.Message(_employeeDB.UpdateEmp(emp));

                                break;

                            case 6:
                                do
                                {
                                    temp = true;
                                    Console.WriteLine("Please Enter Employee DOJ (dd-mm-yyyy):\t");
                                    DateTime dat;
                                    if (DateTime.TryParseExact(Console.ReadLine(), "dd-MM-yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dat))
                                    {
                                        temp = false;
                                        emp.DOJ = dat;
                                    }
                                    if (temp)
                                        Console.WriteLine("You are enter wrong Date");
                                } while (temp);

                                ConsoleService.Message(_employeeDB.UpdateEmp(emp));

                                break;

                            case 7:
                                Console.WriteLine("Do you want to change Employee status:");
                                Console.WriteLine("Press 'A' for Active / Press 'I' for InActive:\t");
                                string input = Console.ReadLine();
                                if (input == "A")
                                {
                                    emp.IsActive = true;
                                    ConsoleService.Message(_employeeDB.UpdateEmp(emp));
                                }
                                else if (input == "I")
                                {
                                    emp.IsActive = false;
                                    ConsoleService.Message(_employeeDB.UpdateEmp(emp));
                                }
                                else
                                {
                                    Console.WriteLine("You are enter wrong input");
                                }

                                break;

                            default:
                                Console.WriteLine("You are enter Wrong Number");
                                break;
                        }
                    }
                    else
                        ConsoleService.Message("No Record Found!");
                }
                else
                    ConsoleService.Message("Your Employee ID was wrong please try again!");
            }
            else
                ConsoleService.Message("Your Employee ID was wrong please try again!");
        }
        public void ViewEmp()
        {
            List<EmployeeModel> list = _employeeDB.ViewEmp();
            if (list.Count > 0)
            {
                ConsoleService.PrintDetail(list);
                Console.WriteLine("\n Do you want to save list in json format press y:\t");
                if (Console.ReadLine()=="y")
                {
                    _jsonEmployeeService.ConvertListToJson(list);
                }
            }
               

            else
                ConsoleService.Message("No Record Found!");
        }
        public void ViewEmpByID()
        {
            Console.Write("Please Enter the Employee ID\t");
            int n;
            if (int.TryParse(Console.ReadLine(), out n))
            {
                if (n > 0)
                {
                    List<EmployeeModel> list = _employeeDB.ViewEmpByID(n);
                    if (list.Count > 0)
                    {
                        ConsoleService.PrintDetail(list);
                        Console.WriteLine("\n Do you want to save list in json format press y:\t");
                        if (Console.ReadLine() == "y")
                        {
                            _jsonEmployeeService.ConvertListToJson(list);
                        }
                    }
                        
                    else
                        ConsoleService.Message("No Record Found!");
                }
                else
                    ConsoleService.Message("Your Employee ID was wrong please try again!");
            }
            else
                ConsoleService.Message("Your Employee ID was wrong please try again!");

        }

    }
}
