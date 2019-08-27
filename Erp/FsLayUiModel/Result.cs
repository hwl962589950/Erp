using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Erp.FsLayUiModel
{
    public class Result<T>
    {
        /// <summary>
        /// 错误码
        /// </summary>
        public int errorNo { get; set; }


        /// <summary>
        /// 信息
        /// </summary>
        public string errorInfo { get; set; }


        /// <summary>
        /// 结果集
        /// </summary>
        public AbstractFsData<T> results { get; set; }
    }
}