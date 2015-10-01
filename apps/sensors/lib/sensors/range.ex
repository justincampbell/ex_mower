defmodule Sensors.Range do
  defstruct registered: []

  use GenServer

  def start_link(opts \\ [name: __MODULE__]) do
    GenServer.start_link(__MODULE__, :ok, opts)
  end

  def read(pid), do: GenServer.call(pid, :read)
  def register(pid), do: GenServer.cast(pid, :register)

  def handle_call(:read, _from, state) do
    {:reply, read_value, state}
  end

  def handle_call(:register, from, state) do
    {:noreply, %{state | registered: [from|state.registered]}}
  end

  defp read_value do
    :random.uniform
  end
end
