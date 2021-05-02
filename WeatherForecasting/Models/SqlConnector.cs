using Microsoft.Data.SqlClient;

namespace WeatherForecasting.Models
{
    public class SqlConnector
    {
        private SqlConnection _connection { get; set; }
        public SqlConnector()
        {
            _connection = new SqlConnection(GlobalConfig.ConnectionString);
        }
        public SqlConnection GetConnection()
        {
            if (_connection.State == System.Data.ConnectionState.Closed)
            {
                _connection = new SqlConnection(GlobalConfig.ConnectionString);
            }
            return _connection;
        }

    }
}
