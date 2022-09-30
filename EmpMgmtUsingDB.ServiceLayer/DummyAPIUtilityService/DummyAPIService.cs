using EmpMgmtUsingDB.DataAccess.DummyAPIUtilityDB;
using EmpMgmtUsingDB.Model.DummyAPIUtilityModel;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace EmpMgmtUsingDB.ServiceLayer.DummyAPIUtilityService
{
    public class DummyAPIService : IDummyAPIService
    {
        private readonly IDummyAPIDB _dummyAPIDB;

        public DummyAPIService(IDummyAPIDB dummyAPIDB)
        {
            _dummyAPIDB = dummyAPIDB;
        }
        public async Task<List<UserModel>> HitAPIViewDataInConSole()
        {
            List<UserModel> userlist;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://jsonplaceholder.typicode.com/");

                var responseTask =await client.GetAsync("users");               

              
                if (responseTask.IsSuccessStatusCode)
                {                   
                    userlist = JsonConvert.DeserializeObject<List<UserModel>>(await responseTask.Content.ReadAsStringAsync());
                }
                else 
                {
                    userlist = new List<UserModel>();                    
                }
            }
            return userlist;
        }
        public async void HitAPISaveDataInDB()
        {
            APIResponseModel responseModel = new APIResponseModel();
            List<UserModel> userlist;
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://jsonplaceholder.typicode.com/");
                
                responseModel.APIHitStartTime = DateTime.Now;

                var responseTask = await client.GetAsync("users");

                responseModel.APIHitEndTime = DateTime.Now;

                responseModel.TotalTimeTakenByAPIHit = responseModel.APIHitEndTime.Subtract(responseModel.APIHitStartTime);

                if (responseTask.IsSuccessStatusCode)
                {
                    var readTask = await responseTask.Content.ReadAsStringAsync();

                    userlist = JsonConvert.DeserializeObject<List<UserModel>>(readTask);

                    userlist = userlist.Select(x => { x.company.Bs = null; return x; }).ToList();
                    userlist = userlist.Select(y => { y.CreatedBy = "Vishal Kumar"; return y; }).ToList();

                    responseModel.ResponseData = JsonConvert.SerializeObject(userlist, new JsonSerializerSettings { NullValueHandling = NullValueHandling.Ignore });
                    
                }
                else
                {
                    responseModel.ResponseData = "Problem in API Hitting.Error message occured!";
                }
            }
            _dummyAPIDB.HitAPISaveDataInDB(responseModel);
        }
        public async void HitPagingAPISaveDataInDB(int pageno,int pagesize)
        {
            bool temp = true;
            while (temp)
            {
                APIResponseModel responseModel = new APIResponseModel();
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("https://api.instantwebtools.net/v1/");
                    responseModel.APIHitStartTime = DateTime.Now;
                    var responseTask = await client.GetAsync($"passenger?page={pageno}&size={pagesize}");
                    responseModel.APIHitEndTime = DateTime.Now;
                    responseModel.TotalTimeTakenByAPIHit = responseModel.APIHitEndTime.Subtract(responseModel.APIHitStartTime);
                    if (responseTask.IsSuccessStatusCode)
                    {
                        responseModel.ResponseData = await responseTask.Content.ReadAsStringAsync();

                        if (pagesize == JObject.Parse(responseModel.ResponseData)["data"].Count())
                        {
                            pageno++;
                        }
                        else
                        {
                            temp = false;
                        }
                    }
                    else
                    {
                        responseModel.ResponseData = "Problem in API Hitting.Error message occured!";
                    }
                    _dummyAPIDB.HitAPISaveDataInDB(responseModel);
                }
            }
        }
    }
}
