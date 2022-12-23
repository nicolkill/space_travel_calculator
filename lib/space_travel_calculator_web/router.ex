defmodule SpaceTravelCalculatorWeb.Router do
  use SpaceTravelCalculatorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SpaceTravelCalculatorWeb do
    pipe_through :api

    get "/health", CalculatorController, :health
    get "/planets", CalculatorController, :planets
    post "/calculate", CalculatorController, :calculate
  end
end
