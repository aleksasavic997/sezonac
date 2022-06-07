using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;
using SeasonalCity.BL;
using SeasonalCity.UI;
using SeasonalCity.UI.Interfaces;
using SeasonalWorker.BL;
using SeasonalWorker.BL.Interfaces;
using SeasonalWorker.DAL;
using SeasonalWorker.DAL.Interfaces;
using SeasonalWorker.Data;
using SeasonalWorker.UI;
using SeasonalWorker.UI.Interfaces;

namespace SeasonalWorker
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors(o => o.AddPolicy("MyPolicy", builder =>
            {
                builder.AllowAnyOrigin()
                       .AllowAnyMethod()
                       .AllowAnyHeader();
            }));

            services.AddControllers();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "SeasonalWorker", Version = "v1" });
            });

            var connectionString = Configuration.GetConnectionString("DefaultConnection");
            services.AddDbContext<ApplicationDbContext>(options => options.UseSqlServer(connectionString));

            services.AddTransient<IAreaOfActivityUI, AreaOfActivityUI>();
            services.AddTransient<IAreaOfActivityBL, AreaOfActivityBL>();
            services.AddTransient<IAreaOfActivityDAL, AreaOfActivityDAL>();

            services.AddTransient<IWorkerUI, WorkerUI>();
            services.AddTransient<IWorkerBL, WorkerBL>();
            services.AddTransient<IWorkerDAL, WorkerDAL>();

            services.AddTransient<ICityUI, CityUI>();
            services.AddTransient<ICityBL, CityBL>();
            services.AddTransient<ICityDAL, CityDAL>();

            services.AddTransient<ICountryUI, CountryUI>();
            services.AddTransient<ICountryBL, CountryBL>();
            services.AddTransient<ICountryDAL, CountryDAL>();

            services.AddTransient<IEmployerUI, EmployerUI>();
            services.AddTransient<IEmployerBL, EmployerBL>();
            services.AddTransient<IEmployerDAL, EmployerDAL>();

            services.AddTransient<IJobAdvertisementUI, JobAdvertisementUI>();
            services.AddTransient<IJobAdvertisementBL, JobAdvertisementBL>();
            services.AddTransient<IJobAdvertisementDAL, JobAdvertisementDAL>();

            services.AddTransient<IJobUI, JobUI>();
            services.AddTransient<IJobBL, JobBL>();
            services.AddTransient<IJobDAL, JobDAL>();

            services.AddTransient<IJobApplicationUI, JobApplicationUI>();
            services.AddTransient<IJobApplicationBL, JobApplicationBL>();
            services.AddTransient<IJobApplicationDAL, JobApplicationDAL>();

            services.AddTransient<IJobApplicationFeedbackUI, JobApplicationFeedbackUI>();
            services.AddTransient<IJobApplicationFeedbackBL, JobApplicationFeedbackBL>();
            services.AddTransient<IJobApplicationFeedbackDAL, JobApplicationFeedbackDAL>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "SeasonalWorker v1"));
            }

            app.UseCors("MyPolicy");

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
