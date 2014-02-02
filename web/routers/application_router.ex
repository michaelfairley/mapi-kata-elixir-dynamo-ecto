defmodule ApplicationRouter do
  use Dynamo.Router
	import Ecto.Query

  prepare do
    conn.fetch([:params, :body])
  end

  get "/" do
    conn = conn.assign(:title, "Welcome to Dynamo!")
    render conn, "index.html"
  end

	post "/users" do
		request_json = :jsx.decode(conn.req_body)
		user = Microblog.User.new(username: request_json["username"], realname: request_json["real_name"])
		Microblog.Repo.create(user)
		redirect conn, to: "/users/#{request_json["username"]}", status: 303
	end

	get "/users/:username" do
		query = from u in Microblog.User, where: u.username == ^conn.params[:username]
		[user] = Microblog.Repo.all(query)
		conn.resp 200, :jsx.encode([username: user.username, real_name: user.realname, followers: [], following: []])
	end
end
