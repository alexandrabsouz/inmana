defmodule Inmana.Restaurant do
  use Ecto.Schema

  alias Inmana.Supply

  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:name, :email]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "restaurants" do
    field :email, :string
    field :name, :string

    has_many :supplies, Supply
    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 2)
    #|> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
