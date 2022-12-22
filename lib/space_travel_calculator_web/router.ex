defmodule SpaceTravelCalculatorWeb.Router do
  use SpaceTravelCalculatorWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", SpaceTravelCalculatorWeb do
    pipe_through :api

    post "/calculate", CalculatorController, :calculate
  end
end
