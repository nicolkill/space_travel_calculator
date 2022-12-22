defmodule SpaceTravelCalculator.Mix.Tasks.Calculate do
  @moduledoc """
    Module to run the calculator from console using the mix command
  """

  use Mix.Task

  alias SpaceTravelCalculator.Calculator

  @impl Mix.Task
  def run(_) do
    Calculator.calculate() # todo: implement
  end
end