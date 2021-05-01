using Microsoft.Data.SqlClient;

namespace WeatherForecasting.Models
{
    public class SqlConnector
    {
        private string _connectionString { get; set; }
        private SqlConnection _connection { get; set; }
        public SqlConnector()
        {
            _connectionString = "Data Source=DESKTOP-OLB9BCQ;Initial Catalog=WeatherForecasting;Integrated Security=True";
            _connection = new SqlConnection(_connectionString);
        }
        public SqlConnection GetConnection()
        {
            if (_connection.State == System.Data.ConnectionState.Closed) {
                _connection = new SqlConnection(_connectionString);
            }
            return _connection;
        }

    }
}
