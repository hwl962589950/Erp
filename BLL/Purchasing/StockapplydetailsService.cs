using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IBLL.Purchasing;
using IDAL.Purchasing;
using MysqlModel;

namespace BLL.Purchasing
{
    public partial class StockapplydetailsService:BaseService<stockapplydetails>, IStockapplyDetailsService
    {
        private readonly IStockapplydetailsDAL _StockapplydetailsDAL = null;


        public StockapplydetailsService(IStockapplydetailsDAL stockapplydetailsDAL)
        {
            base.DAL = stockapplydetailsDAL;
            this._StockapplydetailsDAL = stockapplydetailsDAL;
        }

    }
}
