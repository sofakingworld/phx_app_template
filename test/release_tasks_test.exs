defmodule ReleaseTasksTest do
  use PhxAppTemplate.DataCase

  test "#migrate" do
    assert [{:ok, _, _}] = ReleaseTasks.migrate
  end
end