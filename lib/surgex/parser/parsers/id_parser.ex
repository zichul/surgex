defmodule Surgex.Parser.IdParser do
  @moduledoc false

  alias Surgex.Parser.IntegerParser

  def call(nil), do: {:ok, nil}
  def call(input) when is_binary(input) do
    with {:ok, integer} when integer > 0 <- IntegerParser.call(input) do
      {:ok, integer}
    else
      {:ok, _invalid_integer} -> {:error, :invalid_identifier}
      {:error, reason} -> {:error, reason}
    end
  end
end
