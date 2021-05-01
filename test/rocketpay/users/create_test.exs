defmodule Rocketpay.Users.CreateTest do
  use Rocketpay.DataCase, async: true

  alias Rocketpay.User
  alias Rocketpay.Users.Create
  alias Rocketpay.Repo

  describe "call/1" do
    test "when all params is valid, return an user" do
      params = %{
        name: "Jhonatan",
        nickname: "jhonatan",
        password: "123456",
        email: "jhonatan@gmail.com",
        age: 20
      }

      {:ok, %User{id: id}} = Create.call(params)
      user = Repo.get(User, id)

      assert %User{
               id: ^id,
               name: "Jhonatan",
               nickname: "jhonatan",
               email: "jhonatan@gmail.com",
               age: 20
             } = user
    end

    test "when there are invalid params, return an error" do
      params = %{
        name: "Jhonatan",
        nickname: "jhonatan",
        email: "jhonatan@gmail.com",
        age: 17
      }

      {:error, changeset} = Create.call(params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        password: ["can't be blank"]
      }

      assert errors_on(changeset) == expected_response
    end
  end
end
