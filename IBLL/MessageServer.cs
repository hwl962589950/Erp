using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IBLL
{
    public partial class MessageServer<T>
    {
        public MessageServer(int flge,String mes,T t)
        {
            this.Code = flge;
            this.Mes = mes;
            this.Obj = t;
        }


        //返回码
        public int Code { get; set; }

        //返回消息
        public String Mes { get; set; }

        //返回值
        public T Obj { get; set; }

    }
}
