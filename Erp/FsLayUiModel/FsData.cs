using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Erp.FsLayUiModel
{
    /// <summary>
    /// 不分页
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class FsData<T>:AbstractFsData<T>
    {
        public List<T> data { get; set; }

    }
}