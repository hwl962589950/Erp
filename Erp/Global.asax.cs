using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Erp.AutoMapper;
using TraineesManagement.RegisterAutofac;

namespace Erp
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            //³ÌÐòÆô¶¯×¢Èë ×¢²áautofac
            AutoFacBootStrapper.CoreAutoFacInit();

            //È¥µôÐòÁÐºÅ
            GlobalConfiguration.Configuration.Formatters.XmlFormatter.SupportedMediaTypes.Clear();

            //×¢²á AutoMapper
            AutoMapperConfig.Excute();


        }
        public override void Init()
        {
            
        }
    }
}
