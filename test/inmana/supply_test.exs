defmodule Inmana.SupplyTest do
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Supply

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        description: "Carne",
        expiration_date: "2021-04-23",
        responsible: "Fulano",
        restaurant_id: "5fa31512-8662-4735-a9e4-a5a5149d9577"
      }

      response = Supply.changeset(params)

      assert %Changeset{
               changes: %{
                 description: "Carne",
                 expiration_date: ~D[2021-04-23],
                 responsible: "Fulano",
                 restaurant_id: "5fa31512-8662-4735-a9e4-a5a5149d9577"
               },
               valid?: true
             } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{
        description: "C",
        responsible: "F"
      }

      expected_response = %{
        description: ["should be at least 3 character(s)"],
        expiration_date: ["can't be blank"],
        responsible: ["should be at least 3 character(s)"],
        restaurant_id: ["can't be blank"]
      }

      response = Supply.changeset(params)

      assert %Changeset{
               valid?: false
             } = response

      assert errors_on(response) == expected_response
    end
  end
end
