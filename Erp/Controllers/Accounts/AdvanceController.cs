using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using IBLL.Accounts;
using System.Web.Http;
using IBLL.Purchasing;
using Currency.FsLayUiModel;

namespace Erp.Controllers.Accounts
{
    
    public class AdvanceController : ApiController
    {
        private readonly IAdvanceService  _AdvanceService = null;

        private List<student> list = new List<student>()
        {
            new student(){ id=1, name="aaa"},
             new student(){ id=2, name="bbb"}
        };


        public AdvanceController(IAdvanceService address, IStockapplyService a)
        {
            _AdvanceService = address;
        }


        [HttpGet]
        [HttpPost]
        public Result<student> List()
        {
            var result =new Result<student>();
            result.errorNo = 0;
            result.errorInfo = "成功";
            result.results = new PageFsData<student>()
            {
                data=new MainData<student>()
                {
                    list = list,
                    pageNum = 1,
                    pages = 1,
                    pageSize = 1,
                    total = 1
                }
                 
            };
            return result;
        }

        [HttpGet]
        [HttpPost]
        public Result<student> Get()
        {
            var result = new Result<student>();
            result.errorNo = 0;
            result.errorInfo = "成功";
            result.results = new FsData<student>() { data = list };
            return result;
        }


    }

    public class student
    {
        public int id { get; set; }

        public string name { get; set; }

    }
}
