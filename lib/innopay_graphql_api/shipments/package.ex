defmodule InnopayGraphqlApi.Shipments.Package do
  use Ecto.Schema
  import Ecto.Changeset


  schema "packages" do
    field :content, :string
    field :price, :float
    field :qr_code, :string
    field :shipment_type, :string
    field :status, :string
    field :tntcode, :string
    field :weight, :float
    field :receiver_id, :id
    field :sender_id, :id

    timestamps()
  end

  @doc false
  def changeset(package, attrs) do
    package
    |> cast(attrs, [:tntcode, :status, :shipment_type, :weight, :content, :price, :qr_code])
    |> validate_required([:tntcode, :status, :shipment_type, :weight, :content, :price, :qr_code])
  end
end
