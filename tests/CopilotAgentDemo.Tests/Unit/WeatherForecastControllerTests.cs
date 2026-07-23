using CopilotAgentDemo.Api.Controllers;
using CopilotAgentDemo.Api.Models;
using Microsoft.Extensions.Logging;
using Moq;

namespace CopilotAgentDemo.Tests.Unit;

public class WeatherForecastControllerTests
{
    private readonly Mock<ILogger<WeatherForecastController>> _loggerMock;
    private readonly WeatherForecastController _controller;

    public WeatherForecastControllerTests()
    {
        _loggerMock = new Mock<ILogger<WeatherForecastController>>();
        _controller = new WeatherForecastController(_loggerMock.Object);
    }

    [Fact]
    public void Get_ReturnsExactlyFiveForecasts()
    {
        var result = _controller.Get();

        Assert.Equal(5, result.Count());
    }

    [Fact]
    public void Get_ReturnsForecastsWithFutureDates()
    {
        var today = DateOnly.FromDateTime(DateTime.Now);

        var result = _controller.Get();

        Assert.All(result, forecast => Assert.True(forecast.Date > today));
    }

    [Fact]
    public void Get_ReturnsForecastsWithValidTemperature()
    {
        var result = _controller.Get();

        Assert.All(result, forecast =>
        {
            Assert.InRange(forecast.TemperatureC, -20, 55);
        });
    }

    [Fact]
    public void Get_ReturnsForecastsWithNonNullSummary()
    {
        var result = _controller.Get();

        Assert.All(result, forecast => Assert.NotNull(forecast.Summary));
    }

    [Fact]
    public void WeatherForecast_TemperatureF_IsCorrectlyCalculated()
    {
        var forecast = new WeatherForecast { TemperatureC = 0 };
        Assert.Equal(32, forecast.TemperatureF);
    }

    [Theory]
    [InlineData(0, 32)]
    [InlineData(100, 212)]
    [InlineData(-40, -40)]
    public void WeatherForecast_TemperatureF_ConvertsCorrectly(int celsius, int expectedFahrenheit)
    {
        var forecast = new WeatherForecast { TemperatureC = celsius };
        Assert.Equal(expectedFahrenheit, forecast.TemperatureF);
    }
}
