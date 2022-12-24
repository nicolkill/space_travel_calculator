defmodule SpaceTravelCalculator.Constants do
  def planets do
    %{
      earth: %{
        gravity: 9.807,
        measure: "m/s^2"
      },
      moon: %{
        gravity: 1.62,
        measure: "m/s^2"
      },
      mars: %{
        gravity: 3.711,
        measure: "m/s^2"
      },
      venus: %{
        gravity: 8.87,
        measure: "m/s^2"
      },
      saturn: %{
        gravity: 10.44,
        measure: "m/s^2"
      }
    }
  end
end
