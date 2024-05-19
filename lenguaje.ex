defmodule Ejemplo do

  def main do
    loop()
  end

  def loop do
    IO.puts("Menu:")
    IO.puts("1. Escribir en archivo")
    IO.puts("2. Realizar Network I/O ")
    IO.puts("3. Salir ")
    IO.puts("Ingrese su elección:")

    case IO.gets("") |> String.trim() do
      "1" ->
        escribir_archivo()
        loop()
      "2" ->
        network_io()
        loop()
      "3" ->
        IO.puts("Saliendo...")
      _ ->
        IO.puts("Opción inválida. Intente de nuevo.")
        loop()
    end
  end

  def escribir_archivo do
    IO.puts("Ingrese el contenido para escribir en el archivo:")
    contenido = IO.gets("") |> String.trim()
    File.write("archivo.txt", contenido <> "\n")
    IO.puts("Contenido escrito en el archivo.")
  end

  def network_io do
IO.puts("Ingrese la URL:")
url = IO.gets("") |> String.trim()
case :httpc.request(:get, {url, []}, [], []) do
  {:ok, {{_, 200, _}, _, body}} ->
    IO.puts("Respuesta exitosa: #{body}")
  {:ok, {{_, code, _}, _, _}} ->
    IO.puts("Respuesta con código de estado #{code}")
  {:error, reason} ->
    IO.puts("Error al realizar la solicitud: #{reason}")
end
  end
end

Ejemplo.main()
