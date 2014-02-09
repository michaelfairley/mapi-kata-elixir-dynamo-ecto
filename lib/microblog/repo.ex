defmodule Microblog.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres
  import Ecto.Query

  def url do
    "ecto://michaelfairley:@localhost/microblog_api_kata"
  end

  def count(query) do
    [count] = all(from u in query, select: count(u.id))

    count
  end
end