using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Currency.FsLayUiModel;
using MysqlModel;

namespace IBLL.Purchasing
{
   public partial interface IStockorderService:IBaseService<stockorder>
    {
        /// <summary>
        /// 新增采购订单
        /// </summary>
        /// <param name="sto">采购订单</param>
        /// <param name="stockorderdetails">采购详细</param>
        /// <param name="changeOrderType">转单类型 0未转单 1采购订购转入</param>
        /// <returns></returns>
        Result<stockorder> Add(stockorder sto, List<stockorderdetails> stockorderdetails,int changeOrderType);

    }
}
