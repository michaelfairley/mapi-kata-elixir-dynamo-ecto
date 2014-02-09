defmodule Microblog.UserValidator do
  def validate(params) do
    errors = []

    count = params["username"] |>
        Microblog.User.with_username |>
        Microblog.Repo.count
    if count > 0 do
      errors = Keyword.put(errors, :username, ["is taken"])
    end

    errors
  end
end