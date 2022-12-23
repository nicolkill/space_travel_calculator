defmodule SpaceTravelCalculatorWeb.CalculatorControllerTest do
  use SpaceTravelCalculatorWeb.ConnCase

  alias SpaceTravelCalculator.Constants

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "calls" do
    test "get available plannets to travel", %{conn: conn} do
      conn = get(conn, Routes.calculator_path(conn, :planets))
      assert json_response(conn, 200) == %{
               "earth" => %{"gravity" => 9.807, "measure" => "m/s^2"},
               "mars" => %{"gravity" => 3.711, "measure" => "m/s^2"},
               "moon" => %{"gravity" => 1.62, "measure" => "m/s^2"}
             }
    end

    test "calculates the travel earth -> moon -> earth", %{conn: conn} do
      conn = post(
        conn,
        Routes.calculator_path(conn, :calculate),
        %{
          ship_mass: 28801,
          route: [
            %{
              type: "launch",
              gravity: 9.807 # from earth
            },
            %{
              type: "land",
              gravity: 1.62 # to the moon (btc? xD)
            },
            %{
              type: "launch",
              gravity: 1.62 # return to home
            },
            %{
              type: "land",
              gravity: 9.807
            }
          ]
        }
      )
      assert json_response(conn, 200) == %{
               "earth" => %{"gravity" => 9.807, "measure" => "m/s^2"},
               "mars" => %{"gravity" => 3.711, "measure" => "m/s^2"},
               "moon" => %{"gravity" => 1.62, "measure" => "m/s^2"}
             }
    end
  end
end
