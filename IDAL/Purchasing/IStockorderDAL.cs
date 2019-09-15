using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MysqlModel;

namespace IDAL.Purchasing
{
    public partial interface IStockorderDAL:IBaseDAL<stockorder>
    {
        void Add(stockorder sto, List<stockorderdetails> stockapplydetails);
    }
}
