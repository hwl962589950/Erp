using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Currency.FsLayUiModel;
using MysqlModel;

namespace Erp.Controllers.PublicInformation
{
    /// <summary>
    /// 供应商
    /// </summary>
    public class ProvideinfoController : BaseApiController<provideinfo>
    {
        List<provideinfo> list = new List<provideinfo>()
        {
            new provideinfo()
            {
                 Peoid=1,
                 Peoshortname="供应商一"
            },
                        new provideinfo()
            {
                 Peoid=2,
                 Peoshortname="供应商2"
            },
                                    new provideinfo()
            {
                 Peoid=3,
                 Peoshortname="供应商3"
            },
                                                new provideinfo()
            {
                 Peoid=4,
                 Peoshortname="供应商4"
            },
                                                            new provideinfo()
            {
                 Peoid=5,
                 Peoshortname="供应商5"
            },

        };


        /// <summary>
        /// 获取供应商
        /// </summary>
        /// <returns></returns>
        public Result<provideinfo> QuenyProvideinfo()
        {

            return new Result<provideinfo>()
            {
                errorInfo = "",
                errorNo = 0,
                results = new FsData<provideinfo>()
                {
                    data = list
                }
            };



        }



    }
}
