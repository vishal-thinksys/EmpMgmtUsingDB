using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmpMgmtUsingDB.Model.DummyAPIUtilityModel
{
    public class AddressModel
    {
        public string Street { get; set; }
        public string Suite { get; set; }
        public string City { get; set; }
        public string Zipcode { get; set; }
        public LocationModel geo { get; set; }
    }
    public class LocationModel
    {
        public string Lat { get; set; }
        public string Lng { get; set; }
    }
}
