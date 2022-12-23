defmodule SpaceTravelCalculator.Calculator do
  @moduledoc """
    Contains all the logic that calculates an a travel in the space
  """

  @type step :: {atom(), pos_integer()}
  @type route :: nonempty_list(step())

  @fuel_addition_table %{

  }

  @doc """
  calculates how much fuel uses the ship to complete the defined travel
  """
  @spec calculate(pos_integer(), route()) :: pos_integer()
  def calculate(ship_mass, route) do
    route
    |> IO.inspect(label: "1")
    |> Enum.reduce(0, fn step, acc ->
      fuel =
        ship_mass
        |> calculate_step(step)
        |> balance_fuel_with_weight()
      acc + fuel
    end)
    |> IO.inspect(label: "2")
  end

  defp calculate_step(mass, {:launch, gravity}),
       do: trunc(mass * gravity * 0.042 - 33)
  defp calculate_step(mass, {:land, gravity}),
       do: trunc(mass * gravity * 0.033 - 42)

  defp balance_fuel_with_weight(calculated_fuel) do

  end

end
