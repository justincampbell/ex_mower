defmodule Sensors.Range do
  use GenServer

  def start_link(opts \\ [name: __MODULE__]) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def read(pid) do
    GenServer.call(pid, :read)
  end

  def handle_call(:read, _from, state) do
    {:reply, read_value, state}
  end

  defp read_value do
    :random.uniform
  end
end
