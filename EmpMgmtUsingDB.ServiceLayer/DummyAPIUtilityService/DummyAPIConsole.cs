using EmpMgmtUsingDB.Model;
using EmpMgmtUsingDB.Model.DummyAPIUtilityModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmpMgmtUsingDB.ServiceLayer.DummyAPIUtilityService
{
    public class DummyAPIConsole
    {
        private readonly IDummyAPIService _dummyAPIService;

        public  DummyAPIConsole(IDummyAPIService dummyAPIService)
        {
            _dummyAPIService = dummyAPIService;
        }
        public void DummyAPIClassCall()
        {
           //PrintDetail(_dummyAPIService.HitAPIViewDataInConSole());
           _dummyAPIService.HitAPISaveDataInDB();   
        }
        public static void PrintDetail(List<UserModel> list)
        {
            for (int i = 0; i < list.Count; i++)
            {
                Console.WriteLine($"\nID                  =   {list[i].Id}");
                Console.WriteLine($"Name                =   {list[i].Name}");
                Console.WriteLine($"UserName            =   {list[i].UserName}");
                Console.WriteLine($"Email               =   {list[i].Email}");
                Console.WriteLine($"Street              =   {list[i].address.Street}");
                Console.WriteLine($"Suite               =   {list[i].address.Suite}");
                Console.WriteLine($"City                =   {list[i].address.City}");
                Console.WriteLine($"Zipcode             =   {list[i].address.Zipcode}");
                Console.WriteLine($"Lat                 =   {list[i].address.geo.Lat}");
                Console.WriteLine($"Lng                 =   {list[i].address.geo.Lng}");
                Console.WriteLine($"Phone               =   {list[i].Phone}");
                Console.WriteLine($"Website             =   {list[i].Website}");
                Console.WriteLine($"CompanyName         =   {list[i].company.Name}");
                Console.WriteLine($"CompanyCatchPhrase  =   {list[i].company.CatchPhrase}\n");
               // Console.WriteLine($"CompanyBs           =   {list[i].company.Bs}");
            }

        }

    }
}
