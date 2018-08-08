defmodule InnopayGraphqlApi.Accounts.Address do
  use Ecto.Schema
  import Ecto.Changeset


  schema "addresses" do
    field :city, :string
    field :country, :string
    field :street_name, :string
    field :zipcode, :string

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:street_name, :zipcode, :city, :country])
    |> validate_required([:street_name, :zipcode, :city, :country])
  end
end
