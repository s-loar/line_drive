defmodule LineDrive.Deal do
  @moduledoc """
  This module and enclosed struct represent a deal in pipedrive.
  """

  use TypedStruct

  typedstruct enforce: true do
    field :expected_close_date, Date.t()
    field :id, pos_integer()
    field :pipeline_id, pos_integer()
    field :stage_id, pos_integer()
    field :status, String.t()
    field :title, String.t()
    field :value, float()
    field :weighted_value, float()
  end

  def new(map) do
    struct(__MODULE__, Map.update(atomize_keys(map), :expected_close_date, nil, &parse_date/1))
  end

  defp atomize_keys(map) do
    struct_keys()
    |> Enum.reduce(%{}, fn key, acc ->
      Map.put(acc, key, Map.get_lazy(map, key, fn -> Map.get(map, Atom.to_string(key), nil) end))
    end)
  end

  defp parse_date(nil), do: nil

  defp parse_date(date_str) do
    case Date.from_iso8601(date_str) do
      {:ok, date} -> date
      _ -> nil
    end
  end

  defp struct_keys do
    @enforce_keys
  end
end
