using System;
using Battleships.Data;
using Battleships.Data.Dto;
using Battleships.Data.Events;
using Battleships.Factories;
using Battleships.Models;
using Battleships.Repositories;
using Battleships.Services;
using Battleships.Services.Achievement;
using Battleships.Services.Achievement.Interfaces;
using Battleships.Services.Authentication;
using Battleships.Services.Authentication.Interfaces;
using Battleships.Services.EndgameStrategies;
using Battleships.Services.EventConsumers;
using Battleships.Services.Players;
using Battleships.Services.Players.Interfaces;
using Battleships.Services.GameSession;
using Battleships.Services.GameSession.Interfaces;
using Battleships.SignalR;
using Battleships.SignalR.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http.Connections;
using Microsoft.AspNetCore.SpaServices.AngularCli;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Battleships.Services.Friends.Interfaces;
using Battleships.Services.Friends;
using Battleships.Services.Users;
using Battleships.SignalR.Models;

namespace Battleships
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseNpgsql(Configuration.GetConnectionString("DefaultConnection")));
            
            services.AddCors();

            services.AddDatabaseDeveloperPageExceptionFilter();

            services.AddDefaultIdentity<ApplicationUser>(options =>
                {
                    options.SignIn.RequireConfirmedAccount = true;
                    options.Password.RequireDigit = false;
                    options.Password.RequiredLength = 1;
                    options.Password.RequireLowercase = false;
                    options.Password.RequireUppercase = false;
                    options.Password.RequiredUniqueChars = 1;
                    options.Password.RequireNonAlphanumeric = false;
                })
                .AddEntityFrameworkStores<ApplicationDbContext>();

            services.AddAuthentication(options =>
                {
                    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                    options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
                })
                .AddJwtBearer(options =>
                {
                    options.RequireHttpsMetadata = false;
                    options.SaveToken = false;
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = AuthenticationUtility.GetSymmetricSecurityKey(),
                        ValidateIssuer = false,
                        ValidateAudience = false,
                        ClockSkew = TimeSpan.Zero
                    };
                });
            services.AddControllersWithViews();
            services.AddSignalR();
            services.AddSpaStaticFiles(configuration => { configuration.RootPath = "ClientApp/dist"; });

            services
                .AddHttpContextAccessor()
                .AddScoped(typeof(IRepository<>), typeof(BaseRepository<>))
                .AddScoped<IGameSessionSettingsRepository, GameSessionSettingsRepository>()
                .AddScoped<IBattleshipsDatabase, BattleshipsDatabase>()
                .AddScoped<IShipsRepository, ShipsRepository>()
                .AddScoped<IAuthenticationService, AuthenticationService>()
                .AddScoped<ICurrentUserService, CurrentUserService>()
                .AddScoped<IGameSessionService, GameSessionService>()
                .AddScoped<IBattleshipsSynchronizationService, BattleshipsSynchronizationService>()
                .AddScoped<IFriendsSynchronizationService, FriendsSynchronizationService>()
                .AddScoped<IGameSessionsRepository, GameSessionsRepository>()
                .AddScoped<IPlayersRepository, PlayersRepository>()
                .AddScoped<IPlayersService, PlayersService>()
                .AddScoped<IShipTilesRepository, ShipTilesRepository>()
                .AddScoped<IEndgameService, EndgameService>()
                .AddScoped<IEndgameStrategyService, EndgameStrategyService>()
                .AddScoped<IEndgameStrategy, ClassicEndgameStrategy>()
                .AddScoped<IEndgameStrategy, DeathMatchEndgameStrategy>()
                .AddScoped<IEndgameStrategy, DestroyedShipCountEndgameStrategy>()
                .AddScoped<IEndgameStrategy, RoundCountLimitEndgameStrategy>()
                .AddScoped<IAchievementService, AchievementService>()
                .AddScoped<IGameLaunchService, GameLaunchService>()
                .AddScoped<IPlayerShipGenerationService, PlayerShipGenerationService>()
                .AddSingleton<NumberGeneratorFactory>()
                .AddScoped<IFriendsService, FriendsService>()
                .AddScoped<IInGameSessionHelperService, InGameSessionHelperService>()
                .AddScoped<IUserManager, UserManager>()
                .AddScoped<AttackExecutionService>()
                .AddScoped<IAttackExecutor, AttackExecutionProxy>(serviceProvider =>
                {
                    var database = serviceProvider.GetRequiredService<IBattleshipsDatabase>();
                    var attackExecutionService = serviceProvider.GetRequiredService<AttackExecutionService>();

                    return new AttackExecutionProxy(database, attackExecutionService);
                })
                .AddScoped<BaseConsumer<AttackEvent>, AttackExecutionConsumer>()
                .AddScoped<BaseConsumer<AddFriendEvent>, AddFriendConsumer>()
                .AddScoped<BaseConsumer<RemoveFriendEvent>, RemoveFriendConsumer>()
                .AddScoped<IEventsMediator, EventsMediator>()
                .AddScoped<IFriendsEventService, FriendsEventService>()
                ;
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseMigrationsEndPoint();
            }
            else
            {
                app.UseHsts();
            }
            
            app.UseCors(builder => builder
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader());   
            // app.UseMvc();

            // app.UseHttpsRedirection();
            app.UseStaticFiles();
            if (!env.IsDevelopment())
            {
                app.UseSpaStaticFiles();
            }

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller}/{action=Index}/{id?}");
                endpoints.MapRazorPages();
                endpoints
                    .MapHub<BattleshipsHub>("/battleshipsHub", options => options.Transports = HttpTransportType.WebSockets);
                endpoints
                    .MapHub<FriendsHub>("/friendsHub", options => options.Transports = HttpTransportType.WebSockets);
            });

            app.UseSpa(spa =>
            {
                spa.Options.SourcePath = "ClientApp";

                if (env.IsDevelopment())
                {
                    spa.UseAngularCliServer(npmScript: "start");
                }
            });
            
            ShipSeeder.SeedShips(app.ApplicationServices);
            SeedAchievements.SeedAchs(app.ApplicationServices);
        }
    }
}