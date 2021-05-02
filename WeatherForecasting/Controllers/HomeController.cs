using Dapper;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using System;
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
        public ViewResult Index()
        {
            var sql = "SELECT Id,Name FROM Locations";
            var locations = _connection.Query<Location>(sql).ToList();
            return View(locations);
        }

        [HttpGet]
        public PartialViewResult GetForecastData(int locationId)
        {
            var sql = $"SELECT Id,ForecastDate,WeatherType,MinTemp,MaxTemp FROM forecast " +
                $"WHERE LocationId = {locationId} AND forecastDate > '{DateTime.Today}'";
            var forecast = _connection.Query<Forecast>(sql).ToList();
            return PartialView("GetForecastData", forecast);
        }
    }
}

