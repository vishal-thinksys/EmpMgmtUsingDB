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

        public DummyAPIConsole(IDummyAPIService dummyAPIService)
        {
            _dummyAPIService = dummyAPIService;
        }
        public void DummyAPIClassCall()
        {
            do
            {
                Console.WriteLine("Press 1 for Hit API View Data In ConSole");
                Console.WriteLine("Press 2 for Hit API Save Data In DB");
                Console.WriteLine("Press 3 for Hit Paging API Save Data In DB");
                Console.Write("Please enter the number:\t");
                int text = Convert.ToInt32(Console.ReadLine());
                if (text == 1)
                {
                    List<UserModel> list = _dummyAPIService.HitAPIViewDataInConSole().Result;
                    PrintDetail(list);
                }
                else if (text == 2)
                {
                    _dummyAPIService.HitAPISaveDataInDB();
                }
                else if (text == 3)
                {
                    int pageno = 0, pagesize = 10;

                    _dummyAPIService.HitPagingAPISaveDataInDB(pageno, pagesize);                   
                }
            } while (true);



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
                Console.WriteLine($"CompanyBs           =   {list[i].company.Bs}");
            }

        }

    }
}
