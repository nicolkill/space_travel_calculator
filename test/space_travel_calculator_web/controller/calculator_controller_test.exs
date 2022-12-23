defmodule SpaceTravelCalculatorWeb.CalculatorControllerTest do
  use SpaceTravelCalculatorWeb.ConnCase

  alias SpaceTravelCalculator.Constants

  # space ships
  @apollo_11_csm 28801
  @mission_on_mars 14606
  @passenger_ship 75432

  # planet gravities
  @earth_gravity 9.807
  @mars_gravity 3.711
  @moon_gravity 1.62

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "calls" do
    test "get available plannets to travel", %{conn: conn} do
      conn = get(conn, Routes.calculator_path(conn, :planets))
      assert json_response(conn, 200) == %{
               "earth" => %{"gravity" => @earth_gravity, "measure" => "m/s^2"},
               "mars" => %{"gravity" => @mars_gravity, "measure" => "m/s^2"},
               "moon" => %{"gravity" => @moon_gravity, "measure" => "m/s^2"}
             }
    end

    test "calculates a land to earth", %{conn: conn} do
      conn = post(
        conn,
        Routes.calculator_path(conn, :calculate),
        %{
          ship_mass: @apollo_11_csm,
          route: [
            %{
              type: "land",
              gravity: @earth_gravity
            }
          ]
        }
      )
      assert json_response(conn, 200) == %{
               "used_fuel" => 13447
             }
    end

    test "Apollo 11", %{conn: conn} do
      conn = post(
        conn,
        Routes.calculator_path(conn, :calculate),
        %{
          ship_mass: @apollo_11_csm,
          route: [
            %{
              type: "launch",
              gravity: @earth_gravity # from earth
            },
            %{
              type: "land",
              gravity: @moon_gravity # to the moon (btc? xD)
            },
            %{
              type: "launch",
              gravity: @moon_gravity # return to home
            },
            %{
              type: "land",
              gravity: @earth_gravity
            }
          ]
        }
      )
      assert json_response(conn, 200) == %{
               "used_fuel" => 51898
             }
    end

    test "Mission on Mars", %{conn: conn} do
      conn = post(
        conn,
        Routes.calculator_path(conn, :calculate),
        %{
          ship_mass: @mission_on_mars,
          route: [
            %{
              type: "launch",
              gravity: @earth_gravity # from earth
            },
            %{
              type: "land",
              gravity: @mars_gravity # to the red planet
            },
            %{
              type: "launch",
              gravity: @mars_gravity # return to home
            },
            %{
              type: "land",
              gravity: @earth_gravity
            }
          ]
        }
      )
      assert json_response(conn, 200) == %{
               "used_fuel" => 33388
             }
    end

    test "Vacations", %{conn: conn} do
      conn = post(
        conn,
        Routes.calculator_path(conn, :calculate),
        %{
          ship_mass: @passenger_ship,
          route: [
            %{
              type: "launch",
              gravity: @earth_gravity
            },
            %{
              type: "land",
              gravity: @moon_gravity
            },
            %{
              type: "launch",
              gravity: @moon_gravity
            },
            %{
              type: "land",
              gravity: @mars_gravity
            },
            %{
              type: "launch",
              gravity: @mars_gravity
            },
            %{
              type: "land",
              gravity: @earth_gravity
            }
          ]
        }
      )
      assert json_response(conn, 200) == %{
               "used_fuel" => 212161
             }
    end
  end
end
