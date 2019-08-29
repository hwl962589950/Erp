using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using IBLL.Accounts;
using IDAL.Purchasing;
using MysqlModel;

namespace BLL.Accounts
{
    public partial class AdvanceService : BaseService<advance> , IAdvanceService
    {
       public AdvanceService(IStockapplyDAL dal)
       {

       }
    }
}
