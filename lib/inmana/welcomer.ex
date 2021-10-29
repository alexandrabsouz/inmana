defmodule Inmana.Welcomer do
  # Receber nome e idade de um usuario
  # Se o usuario se chamar banana e se tiver idade 42, ele recebe uma mensagem especial
  # Se o usuario for maor de idade receber uma mensagem normal
  # Se o usuario for menor de idade retornamos um erro
  # Temos que tratar o nome do usuario para entradas erradas

  def welcome(%{"name" => name, "age" => age}) do
    age  = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "You are special Banana!"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall not pass #{name}"}
  end
end
