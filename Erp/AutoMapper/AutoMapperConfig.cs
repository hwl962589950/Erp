using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using Erp.Models.Production;
using MysqlModel;

namespace Erp.AutoMapper
{
    public static class AutoMapperConfig
    {
        /// <summary>
        /// 配置AutoMapper
        /// </summary>
        public static void Excute()
        {
            //注册类型
            Mapper.Initialize(cfg =>
            {
                //采购请购
                cfg.CreateMap<Api_View_Stockapply, stockapply>();
                cfg.CreateMap<Api_View_StockapplyDetails, stockapplydetails>();
                //采购订单
                cfg.CreateMap<Api_View_Stockorder, stockorder>();
                cfg.CreateMap<Api_View_stockorderdetails, stockorderdetails>();
                    
            });
        }



    }
}