defmodule ApiUtils do
  @moduledoc false

  @doc """
  Decodes the response body, accesing first level of the response and converts
  it to the appropriate struct.

  Also see docs for make_collection_mergable/1()
  """
  def convert_body_to_struct!(body, key, struct_type) do
    parsed_body =
      body
      |> Poison.decode!()
      |> Map.fetch!(key)
      |> make_collection_mergable()
      |> Enum.map(&struct(struct_type, &1))

    if has_model_converter_for_type?(struct_type) do
      use_model_converter(parsed_body)
    else
      parsed_body
    end
  end

  @doc """
  Recursively converting string keys to proper elixir naming convetion and then to atoms.
  """
  def make_collection_mergable(collection) do
    collection =
      cond do
        is_list(collection) -> make_list_mergable(collection)
        is_map(collection) -> make_map_mergable(collection)
        true -> collection
      end

    collection
  end

  def use_model_converter(collection) when is_list(collection) do
    Enum.map(collection, &ModelConverter.convert(&1))
  end

  def use_model_converter(collection) when is_map(collection) do
    Enum.map(collection, fn {key, value} ->
      {key, ModelConverter.convert(value)}
    end)
  end

  @doc """
  Checks if a struct (model) has a ModelConverter implementation.
  """
  def has_model_converter_for_type?(type) do
    try do
      Protocol.assert_impl!(ModelConverter, type)
      true
    rescue
      _ -> false
    end
  end

  defp make_map_mergable(map) do
    Enum.map(map, fn {key, value} ->
      if is_collection?(value) do
        {transform_key_to_atom(key), make_collection_mergable(value)}
      else
        {transform_key_to_atom(key), value}
      end
    end)
  end

  defp make_list_mergable(collection) do
    Enum.map(collection, fn value ->
      if is_collection?(value) do
        make_collection_mergable(value)
      else
        value
      end
    end)
  end

  defp is_collection?(collection) do
    is_list(collection) or is_map(collection)
  end

  defp transform_key_to_atom(key) do
    key
    |> Macro.underscore()
    |> String.to_atom()
  end
end
