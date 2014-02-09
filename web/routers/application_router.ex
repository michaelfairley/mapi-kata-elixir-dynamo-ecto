defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    conn.fetch([:params, :body])
  end

  get "/" do
    conn = conn.assign(:title, "Welcome to Dynamo!")
    render conn, "index.html"
  end

  post "/users" do
    request_json = :jsx.decode(conn.req_body)

    validation_errors = Microblog.UserValidator.validate(request_json)

    if validation_errors == [] do
      user = Microblog.User.new(username: request_json["username"], realname: request_json["real_name"])
      Microblog.Repo.create(user)
      redirect conn, to: "/users/#{request_json["username"]}", status: 303
    else
      conn.resp 422, :jsx.encode(errors: validation_errors)
    end
  end

  get "/users/:username" do
    [user] = Microblog.Repo.all(Microblog.User.with_username(conn.params[:username]))
    conn.resp 200, :jsx.encode([username: user.username, real_name: user.realname, followers: [], following: []])
  end
end
