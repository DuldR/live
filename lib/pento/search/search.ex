defmodule Pento.Search do
  
  defstruct [:sku]

  @types %{sku: :integer}

  import Ecto.Changeset

  def changeset(%__MODULE__{} = user, attrs) do
    {user, @types}
    |> cast(attrs, Map.keys(@types))
    |> validate_number(:sku, greater_than: 0.0)
  end

end
