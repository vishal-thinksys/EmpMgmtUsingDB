using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmpMgmtUsingDB.Model
{
    public class EmployeeModel
    {
        public int EmpID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public long Mob { get; set; }
        public DateTime DOB { get; set; }
        public bool IsActive { get; set; }
        public double Salary { get; set; }
        public DateTime DOJ { get; set; }
        public int Age { get; set; }
    }
}
