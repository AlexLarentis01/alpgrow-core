defmodule AlpgrowVernemqPlugin.MixProject do
  use Mix.Project

  def project do
    [
      app: :alpgrow_vernemq_plugin,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :httpoison, :exjsx]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 0.9.0"},
      {:exjsx, "~> 3.2"}
    ]
  end
end
