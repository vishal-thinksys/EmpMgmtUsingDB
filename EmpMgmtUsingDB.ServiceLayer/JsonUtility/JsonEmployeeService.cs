using EmpMgmtUsingDB.Model;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace EmpMgmtUsingDB.ServiceLayer.JsonUtility
{
    public class JsonEmployeeService : IJsonEmployeeService
    {
        string folderName;
        public JsonEmployeeService()
        {
            folderName = @"C:\Users\kumar.vishal\Desktop\Vishal\EmpMgmtUsingDB\EmpMgmtUsingDB.ServiceLayer\JsonUtility\JsonFile\";
            //fileName = Path.Combine(folderName, "JSONFile.json");
        }
        public void ConvertListToJson(List<EmployeeModel> list)
        {
            Console.WriteLine("Please Enter file Name:\t");
            string fileName= folderName+Console.ReadLine()+".json";

            if (File.Exists(fileName))
            {
                Console.WriteLine("File Name Already Exist! Do you want to replace press 'y' :\t");
                if(Console.ReadLine()=="y")
                {
                    var setting = new JsonSerializerSettings() { DateFormatString = "MM'-'dd'-'yyyy" };
                    string serializedJson = JsonConvert.SerializeObject(list, Formatting.Indented, setting);
                    using (FileStream fs = new FileStream(fileName, FileMode.Truncate, FileAccess.Write))
                    {
                        using (StreamWriter sw = new StreamWriter(fs))
                        {
                            sw.WriteLine(serializedJson);
                        }
                    }
                }
            }
            else
            {
                var setting = new JsonSerializerSettings() { DateFormatString = "MM'-'dd'-'yyyy" };
                string serializedJson = JsonConvert.SerializeObject(list, Formatting.Indented, setting);
                using (FileStream fs = new FileStream(fileName, FileMode.Create, FileAccess.Write))
                {
                    using (StreamWriter sw = new StreamWriter(fs))
                    {
                        sw.WriteLine(serializedJson);
                    }
                }
            }
            Console.WriteLine($"Data save Successfully in {fileName}");
        }
    }
}
