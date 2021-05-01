using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System.Linq;
using WeatherForecasting.Models;

namespace WeatherForecasting.Controllers
{
    public class HomeController : Controller
    {
        private SqlConnection _connection { get; set; }
        public HomeController()
        {
            _connection = new SqlConnector().GetConnection();
        }
        public IActionResult Index()
        {
            var sql = "Select Id,Name from Locations";
            var locations = _connection.Query<Location>(sql).ToList();
            return View(locations);
        }


        public IActionResult GetForcastData(int locationId) {

            var sql = $"select * from forecast where LocationId = 1 and forecastDate >= '2021-05-03'";
            var forecast = _connection.Query<Forecast>(sql).ToList();
            return View(forecast);
        }
    }
}

