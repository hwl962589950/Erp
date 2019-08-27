using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Erp.FsLayUiModel
{
    /// <summary>
    /// 分页
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class PageFsData<T>:AbstractFsData<T>
    {

        public PageFsData()
        {
        }

        public PageFsData(int pageNum,int pageSize, int pages,int total,List<T> list)
        {
            this.data = new MainData<T>()
            {
                list = list,
                pageNum = pageNum,
                pages = pages,
                pageSize = pageSize,
                total = total
            };
        }



        public MainData<T> data { get; set; }



    }

    public class MainData<T>
    {
        /// <summary>
        /// 当前页
        /// </summary>
        public int pageNum { get; set; }


        /// <summary>
        /// 每页数量
        /// </summary>
        public int pageSize { get; set; }


        /// <summary>
        /// 总页码
        /// </summary>
        public int pages { get; set; }


        /// <summary>
        /// 总数量
        /// </summary>
        public int total { get; set; }


        /// <summary>
        /// 结果集
        /// </summary>
        public List<T> list { get; set; }
    }


}