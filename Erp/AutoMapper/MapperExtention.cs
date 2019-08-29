using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using Erp.Models.Production;
using MysqlModel;

public static class MapperExtention
{
    #region Stockapply
        public static Api_View_Stockapply ToApiModel(this stockapply model)
        {
            return Mapper.Map<stockapply, Api_View_Stockapply>(model);
        }

        public static stockapply ToEntity(this Api_View_Stockapply ApiStockapply)
        {
            return Mapper.Map<Api_View_Stockapply, stockapply>(ApiStockapply);
        }

        public static List<Api_View_Stockapply> ToApiModel(this List<stockapply> model)
        {
            return Mapper.Map<List<stockapply>, List<Api_View_Stockapply>>(model);
        }

        public static List<stockapply> ToEntity(this List<Api_View_Stockapply> model)
        {
            return Mapper.Map<List<Api_View_Stockapply>, List<stockapply>>(model);
        }



    #endregion

    #region StockapplyDetails

    public static Api_View_StockapplyDetails ToApiModel(this stockapplydetails model)
    {
        return Mapper.Map<stockapplydetails, Api_View_StockapplyDetails>(model);
    }

    public static stockapplydetails ToEntity(this Api_View_StockapplyDetails ApiStockapply)
    {
        return Mapper.Map<Api_View_StockapplyDetails, stockapplydetails>(ApiStockapply);
    }

    public static List<stockapplydetails> ToEntity(this List<Api_View_StockapplyDetails> model)
    {
        return Mapper.Map<List<Api_View_StockapplyDetails>, List<stockapplydetails>>(model);
    }

    public static List<stockapplydetails> ToApiModel(this List<Api_View_StockapplyDetails> model)
    {
        return Mapper.Map<List<Api_View_StockapplyDetails>, List<stockapplydetails>>(model);
    }


    #endregion











}
