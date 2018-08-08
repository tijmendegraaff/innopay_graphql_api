defmodule InnopayGraphqlApi.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :street_name, :string
      add :zipcode, :string
      add :city, :string
      add :country, :string

      timestamps()
    end

  end
end
