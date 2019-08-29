using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Currency.FsLayUiModel
{
    /// <summary>
    /// 单个实体
    /// </summary>
    public class ModelData<T>:AbstractFsData<T>
    {
        public T data { get; set; }
    }
}