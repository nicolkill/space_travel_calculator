defmodule Mix.Tasks.Calculate do
  @moduledoc """
    Module to run the calculator from console using the mix command
  """

  use Mix.Task

  alias SpaceTravelCalculator.Constants
  alias SpaceTravelCalculator.Calculator

  @impl Mix.Task
  def run(_) do
    planets = Constants.planets()

    Calculator.calculate(
      28_801,
      [
        {:launch, planets.earth.gravity},
        {:land, planets.moon.gravity},
        {:launch, planets.moon.gravity},
        {:land, planets.earth.gravity}
      ]
    )
    |> IO.inspect(label: "Apollo 11 used_fuel")

    Calculator.calculate(
      14_606,
      [
        {:launch, planets.earth.gravity},
        {:land, planets.mars.gravity},
        {:launch, planets.mars.gravity},
        {:land, planets.earth.gravity}
      ]
    )
    |> IO.inspect(label: "Mission on Mars used_fuel")

    Calculator.calculate(
      75_432,
      [
        {:launch, planets.earth.gravity},
        {:land, planets.moon.gravity},
        {:launch, planets.moon.gravity},
        {:land, planets.mars.gravity},
        {:launch, planets.mars.gravity},
        {:land, planets.earth.gravity}
      ]
    )
    |> IO.inspect(label: "Passenger used_fuel")

    Calculator.calculate(
      28_801,
      [
        {:launch, planets.earth.gravity},
        {:land, planets.venus.gravity},
        {:launch, planets.venus.gravity},
        {:land, planets.earth.gravity}
      ]
    )
    |> IO.inspect(label: "Apollo 11 To Venus used_fuel")

    Calculator.calculate(
      28_801,
      [
        {:launch, planets.earth.gravity},
        {:land, planets.saturn.gravity},
        {:launch, planets.saturn.gravity},
        {:land, planets.earth.gravity}
      ]
    )
    |> IO.inspect(label: "Apollo 11 To Saturn used_fuel")
  end
end
