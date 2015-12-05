using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(shanuWhosinURMind.Startup))]
namespace shanuWhosinURMind
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
