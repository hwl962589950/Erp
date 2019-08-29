using Autofac;
using System.Reflection;
using System.Web.Mvc;
using System.Linq;
using Autofac.Integration.WebApi;
using Autofac.Integration.Mvc;
using System.Web.Http;

namespace TraineesManagement.RegisterAutofac
{

    /// <summary>
    /// IOC注册
    /// </summary>
    public class AutoFacBootStrapper
    {
        public static void CoreAutoFacInit()
        {
            var builder = new ContainerBuilder();
            HttpConfiguration config = GlobalConfiguration.Configuration;

            SetupResolveRules(builder);

            ////注册所有的Controllers
            //builder.RegisterControllers(Assembly.GetExecutingAssembly()).PropertiesAutowired();
            //注册所有的ApiControllers
            builder.RegisterApiControllers(Assembly.GetExecutingAssembly()).PropertiesAutowired();

            var container = builder.Build();
            //注册api容器需要使用HttpConfiguration对象
            config.DependencyResolver = new AutofacWebApiDependencyResolver(container);
            DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
        }

        private static void SetupResolveRules(ContainerBuilder builder)
        {
            //WebAPI只用引用services和repository的接口，不用引用实现的dll。
            //如需加载实现的程序集，将dll拷贝到bin目录下即可，不用引用dll
            var iServices = Assembly.Load("IBLL");
            var services = Assembly.Load("BLL");
            var iRepository = Assembly.Load("IDAL");
            var repository = Assembly.Load("DAL");

            //根据名称约定（服务层的接口和实现均以Services结尾），实现服务接口和服务实现的依赖
            builder.RegisterAssemblyTypes(iServices, services)
              .Where(t => !t.Name.Equals("IBaseService"))
              .AsImplementedInterfaces();

            //根据名称约定（数据访问层的接口和实现均以Repository结尾），实现数据访问接口和数据访问实现的依赖
            builder.RegisterAssemblyTypes(iRepository, repository)
              .Where(t => !t.Name.Equals("IBaseDAL"))
              .AsImplementedInterfaces();
        }
    }


}