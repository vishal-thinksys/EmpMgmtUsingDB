using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmpMgmtUsingDB.Model.DummyAPIUtilityModel
{
    public class UserModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string CreatedBy { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public AddressModel address { get; set; }
        public string Phone { get; set; }
        public string Website { get; set; }
        public CompanyModel company { get; set; }

    }
}
