using System;

namespace WeatherForecasting.Models
{
    public class Forecast
    {
        public int Id { get; set; }
        public DateTime ForecastDate { get; set; }
        public string WeatherType { get; set; }
        public decimal MinTemp { get; set; }
        public decimal MaxTemp { get; set; }
        public int LocationId { get; set; }
    }
}
