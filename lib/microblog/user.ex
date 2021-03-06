defmodule Microblog.User do
  use Ecto.Model

  queryable "users" do
    field :username, :string
    field :password, :string
    field :realname, :string
  end

  def with_username(username) do
    from u in Microblog.User, where: u.username == ^username
  end
end