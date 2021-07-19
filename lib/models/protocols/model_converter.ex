defprotocol ModelConverter do
  @moduledoc false

  def convert(data)
end

defimpl ModelConverter, for: Pet do
  def convert(data) do
    %Pet{
      data
      | family: String.to_atom(data.family),
        strong_against: ListUtils.convert_strings_to_atoms(data.strong_against),
        weak_against: ListUtils.convert_strings_to_atoms(data.weak_against)
    }
  end
end

defimpl ModelConverter, for: RealmStatus do
  def convert(data) do
    %RealmStatus{
      data
      | connected_realms: String.to_atom(data.connected_realms)
    }
  end
end

defimpl ModelConverter, for: Race do
  def convert(data) do
    %Race{
      data
      | side: String.to_atom(data.side)
    }
  end
end

defimpl ModelConverter, for: AchievementCategory do
  def convert(data) do
    %AchievementCategory{
      data
      | achievements:
          if data.achievements do
            Enum.map(data.achievements, &struct(Achievement, &1))
          else
            nil
          end
    }
  end
end
