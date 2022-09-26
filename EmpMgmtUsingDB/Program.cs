// See https://aka.ms/new-console-template for more information
//Console.WriteLine("Hello, World!");

using EmpMgmtUsingDB.DataAccess;
using EmpMgmtUsingDB.ServiceLayer;
using Microsoft.Extensions.DependencyInjection;

internal class Program
{
    private static void Main(string[] args)
    {
        var services = new ServiceCollection();
        ConfigureServices(services);
        services.AddSingleton<ConsoleService, ConsoleService>()
            .BuildServiceProvider().GetService<ConsoleService>().EntryPointInProject();
    }

    private static void ConfigureServices(IServiceCollection services)
    {
        services.AddSingleton<IEmployeeDB, EmployeeDB>();
        services.AddSingleton<IEmployeeService, EmployeeService>();
    }
}