using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EntityFramework.Extensions;
using IDAL.Purchasing;
using MysqlModel;
using MySql.Data.MySqlClient;

namespace DAL.Purchasing
{
    public partial class StockapplyDAL : BaseDAL<stockapply>, IStockapplyDAL
    {
        public void Add(stockapply sto, List<stockapplydetails> stockapplydetails)
        {
            base.db.Set<stockapply>().Add(sto);
            stockapplydetails.ForEach(s => base.db.Set<stockapplydetails>().Add(s));
        }

        public void Update(stockapply sto, List<stockapplydetails> stockapplydetails)
        {
            //修改请购单
            base.db.Set<stockapply>().Attach(sto);
            string sql = "DELETE FROM stockapplydetails WHERE Appid=@Appid";
            base.db.Database.ExecuteSqlCommand(sql, new MySqlParameter("@Appid",sto.Appid));
            //再次新增进去
            stockapplydetails.ForEach(s => base.db.Set<stockapplydetails>().Add(s));
        }
    }
}
