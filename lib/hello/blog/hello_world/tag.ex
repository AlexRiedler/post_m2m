defmodule Hello.Blog.HelloWorld.Tag do
  alias Hello.Blog.HelloWorld.Post
  use Ecto.Schema
  import Ecto.Changeset

  schema "tags" do
    field :name, :string

    many_to_many :posts, Post, join_through: "post_tags", on_replace: :delete
    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
