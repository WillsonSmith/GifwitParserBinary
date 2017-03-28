defmodule GifwitParserBinary do
  def main(args) do
    args |> parse_args |> process
  end

  def process([]) do
    IO.puts "No arguments given"
  end

  def process(options) do
    cond do
      is_nil(options[:i]) ->
        IO.puts "Input is required"
      true ->
        output = options[:o] || "gifwit_downloads"
        GifwitLibraryParser.parse_and_download(options[:i], output)
        IO.puts "Finished"
    end
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(
      args,
      switches: [
        i: :string,
        o: :string
      ]
    )
    options
  end
end
