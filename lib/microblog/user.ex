defmodule Microblog.User do
	use Ecto.Model

	queryable "users" do
		field :username, :string
		field :password, :string
		field :realname, :string
	end
end