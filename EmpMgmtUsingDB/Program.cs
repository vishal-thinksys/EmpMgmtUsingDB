// See https://aka.ms/new-console-template for more information
//Console.WriteLine("Hello, World!");

using EmpMgmtUsingDB.DataAccess;
using EmpMgmtUsingDB.DataAccess.DummyAPIUtilityDB;
using EmpMgmtUsingDB.ServiceLayer;
using EmpMgmtUsingDB.ServiceLayer.DummyAPIUtilityService;
using EmpMgmtUsingDB.ServiceLayer.JsonUtility;
using Microsoft.Extensions.DependencyInjection;

internal class Program
{
    private static void Main(string[] args)
    {
        var services = new ServiceCollection();
        ConfigureServices(services);
        do
        {
            Console.WriteLine("Press 1 for Employee Management");
            Console.WriteLine("Press 2 for Hit Dummy API in C#");
            Console.Write("Please enter the number:\t");
            int text = Convert.ToInt32(Console.ReadLine());
            if (text == 1)
            {
                services.AddSingleton<ConsoleService, ConsoleService>()
                    .BuildServiceProvider().GetService<ConsoleService>().EntryPointInProject();
            }
            else if (text == 2)
            {
                services.AddSingleton<DummyAPIConsole, DummyAPIConsole>()
               .BuildServiceProvider().GetService<DummyAPIConsole>().DummyAPIClassCall();
            }
        } while (true);
       
       
    }

    private static void ConfigureServices(IServiceCollection services)
    {
        services.AddSingleton<IEmployeeDB, EmployeeDB>();
        services.AddSingleton<IEmployeeService, EmployeeService>();
        services.AddSingleton<IJsonEmployeeService, JsonEmployeeService>();
        services.AddSingleton<IDummyAPIService, DummyAPIService>();
        services.AddSingleton<IDummyAPIDB, DummyAPIDB>();
    }
}