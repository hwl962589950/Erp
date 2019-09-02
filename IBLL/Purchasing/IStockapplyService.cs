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
        /// <summary>
        /// 新增采购请购单
        /// </summary>
        /// <param name="sto"></param>
        /// <param name="stockapplydetails"></param>
        /// <returns></returns>
        Result<stockapply> Add(stockapply sto, List<stockapplydetails> stockapplydetails);

        /// <summary>
        /// 修改采购请购单
        /// </summary>
        /// <param name="sto"></param>
        /// <param name="stockapplydetails"></param>
        /// <returns></returns>
        Result<stockapply> Update(stockapply sto, List<stockapplydetails> stockapplydetails);


    }
}
