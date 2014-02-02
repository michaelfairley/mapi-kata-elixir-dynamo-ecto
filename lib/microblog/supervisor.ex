defmodule Microblog.Supervisor do
	use Supervisor.Behaviour

	def start_link do
		:supervisor.start_link(__MODULE__, [])
  end

	def init(_) do
		children = [
      worker(Microblog.Repo, []),
      supervisor(Microblog.Dynamo, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end