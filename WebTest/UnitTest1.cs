using System;
using AutoMapper;
using Erp.Models.Production;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using MysqlModel;

namespace WebTest
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {

            var dbcount = new erpEntities();

            var a = new stockapplydetails()
            {
                Apddemanddate = DateTime.Now,
                Apdintomoney = 999,
                Apdmateridlid = "A01",
                Apdmateridlname = "物料mingz",
                Apdmodel = "",
                Apdnotnum = 10,
                Apdnum = 10,
                Apdoriginid = "",
                Apdorigintype = "",
                Apdprice = 999,
                Apdremark = "备注",
                Apdstandardmoney = 999,
                Apdstandardprice = 999,
                Apdstockdate = DateTime.Now,
                Apdunit = "个",
                Appid = "A01",
                Enables = 1,
                TockapplyDetails = "001"
            };

            dbcount.stockapplydetails.Add(a);
          int count=  dbcount.SaveChanges();




        }
    }
}
