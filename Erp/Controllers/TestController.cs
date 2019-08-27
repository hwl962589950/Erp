using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using IBLL.Accounts;

namespace Erp.Controllers
{
    public class TestController : ApiController
    {

    


        [HttpGet]
        [HttpPost]
        public studnet Get()
        {
            return new studnet() { id = 3, name = "dsss" };
        }
    }

    public class studnet
    {

        public int id { get; set; }

        public string name { get; set; }

    }
}
