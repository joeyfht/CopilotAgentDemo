using System.Net;
using System.Net.Http.Json;
using CopilotAgentDemo.Api.Models;
using Microsoft.AspNetCore.Mvc.Testing;

namespace CopilotAgentDemo.Tests.Integration;

public class WeatherForecastIntegrationTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient _client;

    public WeatherForecastIntegrationTests(WebApplicationFactory<Program> factory)
    {
        _client = factory.CreateClient();
    }

    [Fact]
    public async Task GetWeatherForecast_ReturnsOk()
    {
        var response = await _client.GetAsync("/weatherforecast");

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
    }

    [Fact]
    public async Task GetWeatherForecast_ReturnsJsonContentType()
    {
        var response = await _client.GetAsync("/weatherforecast");

        Assert.Equal("application/json", response.Content.Headers.ContentType?.MediaType);
    }

    [Fact]
    public async Task GetWeatherForecast_ReturnsFiveItems()
    {
        var forecasts = await _client.GetFromJsonAsync<WeatherForecast[]>("/weatherforecast");

        Assert.NotNull(forecasts);
        Assert.Equal(5, forecasts.Length);
    }

    [Fact]
    public async Task GetWeatherForecast_AllItemsHaveValidData()
    {
        var forecasts = await _client.GetFromJsonAsync<WeatherForecast[]>("/weatherforecast");

        Assert.NotNull(forecasts);
        Assert.All(forecasts, forecast =>
        {
            Assert.NotNull(forecast.Summary);
            Assert.InRange(forecast.TemperatureC, -20, 55);
        });
    }

    [Fact]
    public async Task GetMinneapolisWeather_ReturnsSunny()
    {
        var weather = await _client.GetStringAsync("/weatherforecast/minneapolis");

        Assert.Equal("Sunny", weather);
    }
}
