using EmpMgmtUsingDB.DataAccess.DummyAPIUtilityDB;
using EmpMgmtUsingDB.Model.DummyAPIUtilityModel;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace EmpMgmtUsingDB.ServiceLayer.DummyAPIUtilityService
{
    public class DummyAPIService : IDummyAPIService
    {
        private readonly IDummyAPIDB _dummyAPIDB;

        public DummyAPIService(IDummyAPIDB dummyAPIDB)
        {
            _dummyAPIDB = dummyAPIDB;
        }
        public List<UserModel> HitAPIViewDataInConSole()
        {
            List<UserModel> userlist;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://jsonplaceholder.typicode.com/");
                //HTTP GET

                var responseTask = client.GetAsync("users");
                responseTask.Wait();

                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsStringAsync();//ReadAsAsync<IList<UserModel>>();
                    readTask.Wait();

                    userlist = JsonConvert.DeserializeObject<List<UserModel>>(readTask.Result);
                }
                else //web api sent error response 
                {
                    //log response status here..

                    userlist = new List<UserModel>();                    
                }
            }
            return userlist;
        }
        public void HitAPISaveDataInDB()
        {
            APIResponseModel responseModel = new APIResponseModel();
            List<UserModel> userlist;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://jsonplaceholder.typicode.com/");               
                responseModel.APIHitStartTime = DateTime.Now;
                var responseTask = client.GetAsync("users");
                responseTask.Wait();
                responseModel.APIHitEndTime = DateTime.Now;
                responseModel.TotalTimeTakenByAPIHit = responseModel.APIHitEndTime.Subtract(responseModel.APIHitStartTime);
                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsStringAsync();
                    readTask.Wait();
                    userlist = JsonConvert.DeserializeObject<List<UserModel>>(readTask.Result);
                    userlist=userlist.Select(x =>  { x.company.Bs = null;return x; }).ToList().Select(y => { y.CreatedBy= "Vishal Kumar"; return y; }).ToList();
                    responseModel.ResponseData = JsonConvert.SerializeObject(userlist, new JsonSerializerSettings { NullValueHandling = NullValueHandling.Ignore });
                    
                }
                else
                {
                    responseModel.ResponseData = "Problem in API Hitting.Error message occured!";
                }
            }
            _dummyAPIDB.HitAPISaveDataInDB(responseModel);
        }
        public bool HitPagingAPISaveDataInDB(int pageno,int pagesize)
        {
            bool temp = false;
            APIResponseModel responseModel = new APIResponseModel();
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://api.instantwebtools.net/v1/");
                responseModel.APIHitStartTime = DateTime.Now;
                var responseTask = client.GetAsync($"passenger?page={pageno}&size={pagesize}");
                responseTask.Wait();
                responseModel.APIHitEndTime = DateTime.Now;
                responseModel.TotalTimeTakenByAPIHit = responseModel.APIHitEndTime.Subtract(responseModel.APIHitStartTime);
                var result = responseTask.Result;
                if (result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsStringAsync();
                    readTask.Wait();
                    responseModel.ResponseData = readTask.Result;
                    if (pagesize == JObject.Parse(responseModel.ResponseData)["data"].Count())
                    {
                        temp = true;
                    }
                }
                else
                {
                    responseModel.ResponseData = "Problem in API Hitting.Error message occured!";
                }
            }
            _dummyAPIDB.HitAPISaveDataInDB(responseModel);
            return temp;
        }
    }
}
