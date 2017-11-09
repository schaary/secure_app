defmodule SecureAppTest do
  use ExUnit.Case
  doctest SecureApp

  test "greets the world" do
    assert SecureApp.hello() == :world
  end
end
