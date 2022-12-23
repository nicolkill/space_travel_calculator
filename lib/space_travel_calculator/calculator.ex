defmodule SpaceTravelCalculator.Calculator do
  @moduledoc """
    Contains all the logic that calculates an a travel in the space
  """

  @land :land
  @launch :launch

  @type step :: {atom(), pos_integer()}
  @type route :: nonempty_list(step())

  @doc """
  calculates how much fuel uses the ship to complete the defined travel
  """
  @spec calculate(pos_integer(), route()) :: pos_integer()
  def calculate(ship_mass, route) do
    # todo: implement
    :ok
  end

  defp round_down(num) do
    Float.ceil(num - 1)
  end

  defp calculate_step(mass, {:launch, gravity}),
       do: round_down(mass * gravity * 0.042 - 33)
  defp calculate_step(mass, {:land, gravity}),
       do: round_down(mass * gravity * 0.033 - 42)

end
