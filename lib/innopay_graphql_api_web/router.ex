defmodule InnopayGraphqlApiWeb.Router do
  use InnopayGraphqlApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", InnopayGraphqlApiWeb do
    pipe_through :api
  end
end
