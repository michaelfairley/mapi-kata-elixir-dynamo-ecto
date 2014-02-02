defmodule Microblog.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def url do
    "ecto://michaelfairley:@localhost/microblog_api_kata"
  end
end