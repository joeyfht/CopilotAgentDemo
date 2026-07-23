# CopilotAgentDemo

A demonstration ASP.NET Core Web API project showcasing GitHub Copilot agent workflows.

## Overview

- Built with **ASP.NET Core** (.NET Web API)
- Exposes a simple **WeatherForecast** REST endpoint
- Includes both **unit tests** and **integration tests**
- Uses **Swagger / OpenAPI** for interactive API documentation in development

## Project Structure

- `src/CopilotAgentDemo.Api` – main Web API project
  - `Controllers/WeatherForecastController.cs` – handles HTTP GET requests for weather forecasts
  - `Models/WeatherForecast.cs` – data model with date, temperature (°C/°F), and summary fields
  - `Program.cs` – application entry point and service configuration
- `tests/CopilotAgentDemo.Tests` – test project
  - `Unit/` – unit tests for individual controller logic
  - `Integration/` – integration tests using `WebApplicationFactory`

## API Endpoints

- `GET /weatherforecast` – returns a list of 5 randomly generated weather forecasts for the next 5 days
  - Each forecast includes: `date`, `temperatureC`, `temperatureF`, and `summary`

## Getting Started

- **Prerequisites:** .NET SDK (see `CopilotAgentDemo.slnx` for the target version)
- **Run the API:**
  - `dotnet run --project src/CopilotAgentDemo.Api`
  - Navigate to `https://localhost:<port>/swagger` to explore the API via Swagger UI
- **Run the tests:**
  - `dotnet test`

## Testing

- **Unit tests** verify controller behavior in isolation (e.g. correct number of forecasts, valid temperature ranges, future dates)
- **Integration tests** spin up the full application in-memory and validate HTTP responses (status codes, content type, payload shape)

## Author

- **Joey Fan**
