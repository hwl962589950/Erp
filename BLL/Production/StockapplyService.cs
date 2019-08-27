using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IBLL;
using MysqlModel;
using IBLL.Production;
using IDAL.Production;

namespace BLL.Production
{
   public partial class StockapplyService: BaseService<stockapply>, IStockapplyService
    {
        private readonly IStockapplyDAL _StockapplyDAL = null;
        public StockapplyService(IStockapplyDAL stockapplyDAL)
        {
            base.DAL = stockapplyDAL;
            this._StockapplyDAL = stockapplyDAL;
        }


    }
}
