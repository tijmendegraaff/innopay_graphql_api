defmodule InnopayGraphqlApi.Repo.Migrations.CreatePackages do
  use Ecto.Migration

  def change do
    create table(:packages) do
      add :tntcode, :string
      add :status, :string
      add :shipment_type, :string
      add :weight, :float
      add :content, :string
      add :price, :float
      add :qr_code, :string
      add :receiver_id, references(:users, on_delete: :nothing)
      add :sender_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:packages, [:receiver_id])
    create index(:packages, [:sender_id])
  end
end
