defmodule ImageUploadApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :image_upload_app,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison],
      mod: {ImageUploadApp, []},
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.0"},
      {:floki, "~> 0.20.0"}
    ]
  end
end
