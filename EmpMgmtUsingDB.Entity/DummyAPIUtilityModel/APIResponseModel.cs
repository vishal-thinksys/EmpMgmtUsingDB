using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmpMgmtUsingDB.Model.DummyAPIUtilityModel
{
    public class APIResponseModel
    {
        public string ResponseData { get; set; }
        public DateTime APIHitStartTime { get; set; }
        public DateTime APIHitEndTime { get; set; }
        public TimeSpan TotalTimeTakenByAPIHit { get; set; }
    }
}
