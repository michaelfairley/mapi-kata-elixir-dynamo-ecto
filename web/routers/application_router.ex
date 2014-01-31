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
		request_json = ExJSON.parse(conn.req_body)
		redirect conn, to: "/users/#{request_json["username"]}", status: 303
	end

	get "/users/:username" do
		conn.resp 200, ExJSON.generate([])
	end
end
