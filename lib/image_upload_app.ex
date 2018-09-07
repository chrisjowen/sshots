defmodule ImageUploadApp do
  use Application

  @options  [ recv_timeout: 50000, body_format: :binary]

  defp screenshot(path) do

      url = "https://www.pohheng.com.sg/#{path}"

      IO.inspect("Screen shoting #{url}")


      url_encoded = URI.encode_www_form(url)
      path =  "ss_" <> String.replace(path, "/", "")

      IO.inspect("Encoded  #{url_encoded}")


      ss_uri = "http://api.screenshotmachine.com/?key=10943c&format=png&delay=9000&device=desktop&cacheLimit=0&dimension=1920xfull&url=#{url_encoded}"

      case HTTPoison.get(ss_uri, [],  @options) do
        {:ok, response} ->
          File.write!("out/#{path}.png", response.body)
        _ -> IO.inspect("Unable to process #{path}")
      end

  end

  defp crawl(path, visited) do
    cond do
      Enum.member?(visited, path) -> []
      true ->
        # screenshot(path)
        url = "https://www.pohheng.com.sg/#{path}"
        IO.inspect("Finding links for #{url}")
        LinkFinder.findLinks(url) |> Enum.filter(fn link -> !Enum.member?(visited, link) end)
    end
  end

  defp visit([], visited), do: visited
  defp visit(to_visit, visited) do
     [next | remaining_to_visit] = to_visit
     next_to_visit = crawl(next, visited)
     visit(Enum.uniq((remaining_to_visit ++ next_to_visit)), (visited ++ [next]))
  end


  def start(_type, _args) do
    links = visit([""], []) |> Enum.join(",")



    links
      |> String.split(",")
      |> Enum.each(&screenshot/1)

    {:ok, self()}
  end
end
