defmodule Hello.Blog.HelloWorld.Post do
  alias Hello.Blog.HelloWorld.Tag
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :title, :string

    many_to_many :tags, Tag, join_through: "post_tags", on_replace: :delete
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
