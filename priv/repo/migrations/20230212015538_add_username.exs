defmodule Pento.Repo.Migrations.AddUsername do
  use Ecto.Migration

  def change do
    alter table("users") do
      add(:username, :text)
    end

    create(index("users", [:username], unique: true))
  end
end
