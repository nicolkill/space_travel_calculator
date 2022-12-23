defmodule SpaceTravelCalculatorWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use SpaceTravelCalculatorWeb, :controller

  # This clause is an example of how to handle resources that cannot be found.
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(SpaceTravelCalculatorWeb.ErrorView)
    |> render(:"404")
  end

  # This clause is an example of how to handle resources invalid.
  def call(conn, {:error, error}) when error in [:expired, :invalid, :missing] do
    conn
    |> put_status(401)
    |> put_view(SpaceTravelCalculatorWeb.ErrorView)
    |> render(:"401")
  end

  def call(conn, {:error, error}) when is_binary(error) do
    conn
    |> put_status(400)
    |> json(%{code: 400, message: error})
  end
end
