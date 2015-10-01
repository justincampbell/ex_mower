defmodule Sensors.RangeTest do
  use ExUnit.Case

  setup do
    {:ok, pid} = Sensors.Range.start_link([])

    {:ok, [pid: pid]}
  end

  test "read a value", %{pid: pid} do
    range = Sensors.Range.read(pid)
    assert is_float(range)
  end

  test "register for updates", %{pid: pid} do
    :ok = Sensors.Range.register(pid)
  end
end
