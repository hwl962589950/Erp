using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Currency.FsLayUiModel;
using MysqlModel;

namespace IBLL.Purchasing
{
    public partial interface IStockapplyService:IBaseService<stockapply>
    {
        Result<stockapply> Add(stockapply sto, List<stockapplydetails> stockapplydetails);


    }
}
