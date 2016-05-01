defmodule ExAdmin.RepoTest do
  use ExUnit.Case
  require Logger
  import TestExAdmin.TestHelpers
  alias ExAdmin.Repo

  setup do
    Application.put_env :ex_admin, :repo, TestExAdmin.Repo
    :ok
  end

  test "changeset supports different primary key" do
    params = %{name: "test", description: "desc"}
    cs = %ExAdmin.Changeset{changeset: TestExAdmin.Noid.changeset(%TestExAdmin.Noid{}, params)}
    res = Repo.insert(cs)
    assert res.name == "test"
    assert res.description == "desc"
  end

end
