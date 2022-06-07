using Microsoft.EntityFrameworkCore;
using SeasonalWorker.Models;

namespace SeasonalWorker.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }

        public DbSet<Worker> workers { get; set; }
        public DbSet<City> cities { get; set; }
        public DbSet<Country> countries { get; set; }
        public DbSet<AreaOfActivity> areaOfActivities { get; set; }
        public DbSet<EmployerType> employerTypes { get; set; }
        public DbSet<Employer> employers { get; set; }
        public DbSet<JobAdvertisement> jobAdvertisements { get; set; }
        public DbSet<Job> jobs { get; set; }
        public DbSet<JobApplication> jobApplications { get; set; }
        public DbSet<JobApplicationFeedback> jobApplicationFeedbacks { get; set; }
    }
}
