defmodule InnopayGraphqlApi.ShipmentsTest do
  use InnopayGraphqlApi.DataCase

  alias InnopayGraphqlApi.Shipments

  describe "packages" do
    alias InnopayGraphqlApi.Shipments.Package

    @valid_attrs %{content: "some content", price: 120.5, qr_code: "some qr_code", shipment_type: "some shipment_type", status: "some status", tntcode: "some tntcode", weight: 120.5}
    @update_attrs %{content: "some updated content", price: 456.7, qr_code: "some updated qr_code", shipment_type: "some updated shipment_type", status: "some updated status", tntcode: "some updated tntcode", weight: 456.7}
    @invalid_attrs %{content: nil, price: nil, qr_code: nil, shipment_type: nil, status: nil, tntcode: nil, weight: nil}

    def package_fixture(attrs \\ %{}) do
      {:ok, package} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Shipments.create_package()

      package
    end

    test "list_packages/0 returns all packages" do
      package = package_fixture()
      assert Shipments.list_packages() == [package]
    end

    test "get_package!/1 returns the package with given id" do
      package = package_fixture()
      assert Shipments.get_package!(package.id) == package
    end

    test "create_package/1 with valid data creates a package" do
      assert {:ok, %Package{} = package} = Shipments.create_package(@valid_attrs)
      assert package.content == "some content"
      assert package.price == 120.5
      assert package.qr_code == "some qr_code"
      assert package.shipment_type == "some shipment_type"
      assert package.status == "some status"
      assert package.tntcode == "some tntcode"
      assert package.weight == 120.5
    end

    test "create_package/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shipments.create_package(@invalid_attrs)
    end

    test "update_package/2 with valid data updates the package" do
      package = package_fixture()
      assert {:ok, package} = Shipments.update_package(package, @update_attrs)
      assert %Package{} = package
      assert package.content == "some updated content"
      assert package.price == 456.7
      assert package.qr_code == "some updated qr_code"
      assert package.shipment_type == "some updated shipment_type"
      assert package.status == "some updated status"
      assert package.tntcode == "some updated tntcode"
      assert package.weight == 456.7
    end

    test "update_package/2 with invalid data returns error changeset" do
      package = package_fixture()
      assert {:error, %Ecto.Changeset{}} = Shipments.update_package(package, @invalid_attrs)
      assert package == Shipments.get_package!(package.id)
    end

    test "delete_package/1 deletes the package" do
      package = package_fixture()
      assert {:ok, %Package{}} = Shipments.delete_package(package)
      assert_raise Ecto.NoResultsError, fn -> Shipments.get_package!(package.id) end
    end

    test "change_package/1 returns a package changeset" do
      package = package_fixture()
      assert %Ecto.Changeset{} = Shipments.change_package(package)
    end
  end
end
