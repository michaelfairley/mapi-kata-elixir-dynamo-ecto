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

		[count] = request_json["username"] |>
        Microblog.User.with_username |>
        Microblog.User.count |>
        Microblog.Repo.all
		if count > 0 do
			conn.resp 422, :jsx.encode(errors: [username: ["is taken"]])
		else
			user = Microblog.User.new(username: request_json["username"], realname: request_json["real_name"])
			Microblog.Repo.create(user)
			redirect conn, to: "/users/#{request_json["username"]}", status: 303
		end
	end

	get "/users/:username" do
		[user] = Microblog.Repo.all(Microblog.User.with_username(conn.params[:username]))
		conn.resp 200, :jsx.encode([username: user.username, real_name: user.realname, followers: [], following: []])
	end
end
