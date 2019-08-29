using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MysqlModel;

namespace IDAL.Purchasing
{
   public partial interface IStockapplyDAL : IBaseDAL<stockapply>
    {

        void Add(stockapply sto, List<stockapplydetails> stockapplydetails);
        


    }
}
