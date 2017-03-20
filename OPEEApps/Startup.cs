using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(OPEEApps.Startup))]
namespace OPEEApps
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
