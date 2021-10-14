defmodule PhxPlugEnvWeb.Plugs.Foo do
  alias Plug.Conn

  def init(opts), do: opts

  def call(conn, opts) do
    plug_foo = Keyword.fetch!(opts, :plug_foo)
    Conn.assign(conn, :plug_foo, plug_foo)
  end
end
