defmodule SpaceTravelCalculatorWeb.CalculatorController do
  @moduledoc false

  alias SpaceTravelCalculator.Calculator

  def calculate(conn, params) do
    Calculator.calculate() # todo: implement
  end

end
