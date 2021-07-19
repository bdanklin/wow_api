defmodule ListUtils do
  @moduledoc false

  def convert_strings_to_atoms(list) do
    Enum.map(list, &String.to_atom(&1))
  end
end
