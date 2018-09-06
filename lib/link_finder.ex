defmodule LinkFinder do



  defp empty?(""), do: true
  defp empty?(nil), do: true
  defp empty?(_), do: false
  defp not_empty?(it), do: !empty?(it)


  def findLinks(url) do
        case HTTPoison.get(url) do
        {:ok, response} ->
          Floki.find(response.body, "a")
            |> Floki.attribute("href")
            |> Enum.filter(&not_empty?/1)
            |> Enum.uniq
        _ -> []
      end
  end

end
