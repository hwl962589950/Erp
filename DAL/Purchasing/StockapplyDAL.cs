using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IDAL.Purchasing;
using MysqlModel;

namespace DAL.Purchasing
{
    public partial class StockapplyDAL : BaseDAL<stockapply>, IStockapplyDAL
    {
        public void Add(stockapply sto, List<stockapplydetails> stockapplydetails)
        {
            base.db.Set<stockapply>().Add(sto);
            stockapplydetails.ForEach(s => base.db.Set<stockapplydetails>().Add(s));
        }
    }
}
