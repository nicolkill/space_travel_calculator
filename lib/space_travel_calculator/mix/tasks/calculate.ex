defmodule Mix.Tasks.Calculate do
  @moduledoc """
    Module to run the calculator from console using the mix command
  """

  use Mix.Task

  alias SpaceTravelCalculator.Calculator

  @impl Mix.Task
  def run(_) do
    Calculator.calculate(28801, [{:launch, 9.807}, {:land, 1.62}, {:launch, 1.62}, {:land, 9.807}])
    |> IO.inspect(label: "used_fuel")
  end
end