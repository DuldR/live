# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pento.Repo.insert!(%Pento.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Pento.Catalog

products = [
  %{
    name: "Chess",
    description: "The classic game",
    sku: 5_6_6,
    unit_price: 10.00
  },
  %{
    name: "MONO",
    description: "ame",
    sku: 1_2_3_54,
    unit_price: 10.00
  },
  %{
    name: "RRRR",
    description: "GGGGGG",
    sku: 5_6_6_43_5,
    unit_price: 10.00
  }
]

Enum.each(products, fn product ->
  Catalog.create_product(product)
end)
