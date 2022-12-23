defmodule SpaceTravelCalculatorWeb.CalculatorController do
  @moduledoc false
  use SpaceTravelCalculatorWeb, :controller

  action_fallback SpaceTravelCalculatorWeb.FallbackController

  alias SpaceTravelCalculator.Constants
  alias SpaceTravelCalculator.Calculator

  @land :land
  @launch :launch

  def health(conn, _) do
    conn
    |> put_status(200)
    |> json(%{status: "ok"})
  end

  def planets(conn, _) do
    # i can use the views but its a very simple call so i prefer use the json func directly to save time
    conn
    |> put_status(200)
    |> json(Constants.planets())
  end

  def calculate(conn, %{"ship_mass" => ship_mass,"route" => route}) do
    route = Enum.map(route, fn %{"gravity" => gravity, "type" => type} ->
      {String.to_existing_atom(type), gravity}
    end)

    used_fuel = Calculator.calculate(ship_mass, route)

    conn
    |> put_status(200)
    |> json(%{used_fuel: used_fuel})
  end

end
