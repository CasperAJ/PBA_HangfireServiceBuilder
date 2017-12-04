using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ServiceBuilder.Startup))]
namespace ServiceBuilder
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
