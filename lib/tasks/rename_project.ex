defmodule Mix.Tasks.RenameProject do
  use Mix.Task

  @app_name "phx_app_template"
  def run([new_project_name]) do
    files = ls_r(".")

    files
    |> Enum.filter(fn path -> Path.extname(path) in [".exs", ".ex", ".eex"] end)
    |> Enum.reject(fn path -> String.starts_with?(path, "./deps") end)
    |> Enum.reject(fn path -> String.starts_with?(path, "./assets") end)
    |> Enum.reject(fn path -> String.starts_with?(path, "./_build") end)
    |> Enum.each(fn path -> change_app_name(path, @app_name, new_project_name) end)

    clean_artifacts()
  end

  def change_app_name(file_path, from, to) do
    camelize_from = Macro.camelize(from)
    camelize_to = Macro.camelize(to)

    code = File.read!(file_path)

    new_code =
      String.replace(code, [from, camelize_from], fn match ->
        case match do
          ^from -> to
          ^camelize_from -> camelize_to
        end
      end)

    new_file_path = String.replace(file_path, from, to)
    File.mkdir_p(Path.dirname(new_file_path))
    File.rename(file_path, new_file_path)
    File.write!(new_file_path, new_code)
  end

  def clean_artifacts() do
    files = ls_r(".")

    files
    |> Enum.reject(fn path -> String.starts_with?(path, "./deps") end)
    |> Enum.reject(fn path -> String.starts_with?(path, "./assets") end)
    |> Enum.reject(fn path -> String.starts_with?(path, "./_build") end)
    |> Enum.filter(fn path -> File.dir?(path) end)
    |> Enum.filter(fn dir -> String.contains?(dir, @app_name) end)
    |> IO.inspect()
    |> Enum.each(&File.rm_rf!/1)
  end

  # Рекурсивный поиск файлов
  def ls_r(path \\ ".") do
    cond do
      File.regular?(path) ->
        [path]

      File.dir?(path) ->
        File.ls!(path)
        |> Enum.map(&Path.join(path, &1))
        |> Enum.map(&ls_r/1)
        |> Enum.concat()
        |> Enum.concat([path])

      true ->
        []
    end
  end
end
