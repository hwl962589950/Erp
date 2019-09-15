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
    /// 物料信息
    /// </summary>
    public class MaterieController : BaseApiController<materiel>
    {

        //模拟数据
        private readonly List<materiel> materiels = new List<materiel>()
        {
            new materiel()
            {
                 Matid="A01", Matname="手机壳", Matspec="AP-SSD-99", Matunit="个", Matadviceprice=999, Matdutyrate=17, Matifduty=1
            },
            new materiel()
            {
                 Matid="A02", Matname="手机电池",Matspec="普通", Matunit="个", Matadviceprice=200, Matdutyrate=17, Matifduty=1
            },
            new materiel()
            {
                 Matid="A03", Matname="耳机",Matspec="普通", Matunit="只", Matadviceprice=1999, Matdutyrate=17, Matifduty=1
            },
            new materiel()
            {
                 Matid="A04", Matname="测试物料",Matspec="测试型号", Matunit="盒", Matadviceprice=999, Matdutyrate=17, Matifduty=1
            }
        };

        public  Result<materiel> QuenymMateriel()
        {



            return new Result<materiel>()
            {
                errorNo = 0,
                results = new FsData<materiel>()
                {
                    data = materiels
                }
            };



        }
    }
}
