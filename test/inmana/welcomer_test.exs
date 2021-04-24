defmodule Inmana.WelcomerTest do
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is special, returns special message" do
      params = %{"name" => "banana", "age" => "42"}
      expected_result = {:ok, "U r very special banana"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is not special, returns a message" do
      params = %{"name" => "Alex", "age" => "26"}
      expected_result = {:ok, "Welcome alex"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end

    test "when the user is under age, returns an error" do
      params = %{"name" => "Alex", "age" => "10"}
      expected_result = {:error, "You shall not pass alex"}

      result = Welcomer.welcome(params)

      assert result == expected_result
    end
  end
end
