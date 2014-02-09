defmodule Microblog.UserValidator do
  def validate(params) do
    errors = []

    count = params["username"] |>
        Microblog.User.with_username |>
        Microblog.Repo.count
    if count > 0 do
      errors = Keyword.put(errors, :username, ["is taken"])
    end

    if String.length(params["password"]) < 8 do
      errors = Keyword.put(errors, :password, ["is too short"])
    end

    errors
  end
end