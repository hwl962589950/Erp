using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Mvc.Routing;
using Currency.FsLayUiModel;

namespace Erp.Controllers
{

    public class BaseApiController<T> : ApiController where T:class,new()
    {
        protected IBLL.IBaseService<T> _BaseService = null;



        [HttpPost]
        [HttpGet]
        /// <summary>
        /// 获取全部数据
        /// </summary>
        /// <returns></returns>
        public virtual Result<T> Queny()
        {
            var result = new Result<T>();

            result.errorNo = 0;
            result.errorInfo = "成功";
            result.results = new FsData<T>()
            {
                data = _BaseService.ListModels(S => true).ToList()
            };
            return result;
        }



        [HttpPost]
        [HttpGet]
        /// <summary>
        /// 通过主键获取实体
        /// </summary>
        /// <returns></returns>
        public virtual Result<T> Get()
        {

            var listObj = new List<object>();
            foreach (var item in HttpContext.Current.Request.Form.Keys)
            {
                listObj.Add(HttpContext.Current.Request.Form[item.ToString()]);
            }
            var entity = listObj.Count>0? _BaseService.GetModel(listObj.ToArray()):null;

            var result = new Result<T>();
            result.errorNo = 0;
            result.errorInfo = "成功";
            result.results = new ModelData<T>()
            {
                data = entity
            };



            return result;
        }

        [HttpPost]
        [HttpGet]
        /// <summary>
        /// 通过主键删除实体
        /// </summary>
        /// <returns></returns>
        public virtual Result<T> Tel()
        {
            var listObj = new List<object>();
            foreach (var item in HttpContext.Current.Request.Form.Keys)
            {
                listObj.Add(HttpContext.Current.Request.Form[item.ToString()]);
            }
            var entity = listObj.Count > 0 ? _BaseService.GetModel(listObj.ToArray()) : null;
            var result = new Result<T>();

            bool flge= _BaseService.Delete(entity);

            result.errorNo = flge?0:-5;
            result.errorInfo = flge ? "删除成功" : "删除失败！";
            result.results = new ModelData<T>()
            {
                data = entity
            };
            return result;
        }



    }
}
