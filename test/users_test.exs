defmodule TechChallenge.UsersTest do
  use TechChallenge.DataCase

  alias TechChallenge.Users

  describe "register_user/1" do
    @valid_attrs %{
      username: "admin",
      image: "https://cdn.com",
      email: "admin@admin.com",
      password: "secret"
    }
    @invalid_attrs %{}

    test "with valid data inserts user" do
      assert {:ok, user} = Users.register_user(@valid_attrs)
      assert user.image == "https://cdn.com"
      assert user.username == "admin"
      assert user.email == "admin@admin.com"
    end

    test "with invalid data access must be prevented" do
      assert {:error, _changeset} = Users.register_user(@invalid_attrs)
    end

    test "verify unique usernames" do
      assert {:ok, _user} = Users.register_user(@valid_attrs)
      assert {:error, changeset} = Users.register_user(@valid_attrs)
      assert %{username: ["has already been taken"]} = errors_on(changeset)
    end

    test "not accept long usernames" do
      attrs = Map.put(@valid_attrs, :username, String.duplicate("a", 41))
        {:error, changeset} = Users.register_user(attrs)
      assert %{username: ["Max. 40 chars"]} = errors_on(changeset)
    end

    test "must have at least 4 characters of password" do
      attrs = Map.put(@valid_attrs, :password, "122")
        {:error, changeset} = Users.register_user(attrs)
      assert %{password: ["should be at least 4 character(s)"]} = errors_on(changeset)
    end
  end

  describe "authenticate_by_username_and_pass/2" do
    @pass "654321"

    setup do
      {:ok, user: user_fixture(password: @pass)}
    end

    test "test user return with a correct password", %{user: user} do
      assert {:ok, auth_user} =
        Users.authenticate_by_username_and_pass(user.username, @pass)

      assert auth_user.id == user.id
    end

    test "prevent login by entering an invalid password", %{user: user} do
      assert {:error, :unauthorized} =
        Users.authenticate_by_username_and_pass(user.username, "badpass")
    end

    test "user not found" do
      assert {:error, :not_found} =
        Users.authenticate_by_username_and_pass("unknownuser", @pass)
    end

  end
end
