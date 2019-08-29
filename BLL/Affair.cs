using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Transactions;

namespace BLL
{
    //事务类
    public partial class Affair
    {
        public static T Whether<T,IT>(IT result,Func<IT,T> action)
        {

            TransactionOptions transactionOptions = new TransactionOptions();
            //设置事务隔离级别
            transactionOptions.IsolationLevel = System.Transactions.IsolationLevel.ReadCommitted;
            // 设置事务超时时间为120秒
            transactionOptions.Timeout = new TimeSpan(0, 0, 120);

            using (TransactionScope scope = new TransactionScope(TransactionScopeOption.Required, transactionOptions))
            {

                try
                {
                  T t=  action.Invoke(result);
                    scope.Complete();
                    return t;

                }
                catch (Exception ex)
                {
                    throw ex;
                }
            }

        }
    }
}
