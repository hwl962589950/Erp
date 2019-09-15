using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IDAL.Purchasing;
using MysqlModel;

namespace DAL.Purchasing
{
    public partial class StockorderDAL : BaseDAL<stockorder>, IStockorderDAL
    {
        public void Add(stockorder sto, List<stockorderdetails> stockapplydetails)
        {
            base.db.Set<stockorder>().Add(sto);
            stockapplydetails.ForEach(s => base.db.Set<stockorderdetails>().Add(s));
        }
    }
}
