defmodule Sensors.RangeTest do
  use ExUnit.Case

  setup do
    {:ok, pid} = Sensors.Range.start_link([])

    {:ok, [pid: pid]}
  end

  test "can read a value", %{pid: pid} do
    range = Sensors.Range.read(pid)
    assert is_float(range)
  end
end
