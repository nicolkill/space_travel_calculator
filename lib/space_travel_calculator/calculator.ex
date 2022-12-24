defmodule SpaceTravelCalculator.Calculator do
  @moduledoc """
    Contains all the logic that calculates an a travel in the space
  """

  @type step :: {atom(), pos_integer()}
  @type route :: nonempty_list(step())

  @doc """
  calculates how much fuel uses the ship to complete the defined travel
  """
  @spec calculate(pos_integer(), route()) :: pos_integer()
  def calculate(ship_mass, route) do
    route
    |> Enum.reverse()
    |> Enum.reduce(0, fn step, acc ->
      fuel =
        ship_mass + acc
        |> calculate_step(step)
        |> balance_fuel_with_weight(step)
      acc + fuel
    end)
  end

  defp calculate_step(mass, {:launch, gravity}),
       do: trunc(mass * gravity * 0.042 - 33)
  defp calculate_step(mass, {:land, gravity}),
       do: trunc(mass * gravity * 0.033 - 42)

  defp balance_fuel_with_weight(calculated_fuel, step) do
    extra_fuel = balance(calculated_fuel, step)
    calculated_fuel + extra_fuel
  end

  defp balance(residual_weight, step, sum \\ 0) do
    fuel = calculate_step(residual_weight, step)
    if fuel > 0,
       do: balance(fuel, step, sum + fuel),
       else: sum
  end

end
