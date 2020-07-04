defmodule PhxAppTemplateTest do
  use ExUnit.Case, async: true

  @app "phx_app_template"

  test "Compiles release" do
    {compile_result, 0} =
      System.cmd("mix", ["release", "--overwrite"], env: [{"MIX_ENV", "test"}])

    assert compile_result =~ ~r/_build.*\/#{@app}/
  end
end
