defmodule Identicon do
# to execute the project the first time, at the console in the path projects
# mix deps.get

# to execute the project, launh at the console: iex -S mix
# Identicon.main("asdf")

  def main(input) do
    input
    |> hash_input
    |> getcolors
    |> build_grid
    |> filter_odd
    |> pixels_map
    |> draw_image
    |> save_image(input)
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

  def getcolors(%Identicon.Image{hex: [r, g, b | _others]} = input) do
    %Identicon.Image{input | color: {r, g, b} }
  end

  def build_grid(%Identicon.Image{hex: hex} = input) do
    grid =
      hex
      |> Enum.chunk_every(3, 3, :discard) #First, divide the array in pieces of 3 elements
      |> Enum.map(&mirror/1)              #Second, each piece is processed by mirror function
      |> List.flatten                     #Third, join all pieces in one array its better to save into file
      |> Enum.with_index                  #Forth, the array index is adding for each element

    %Identicon.Image{input | grid: grid}
  end

  def mirror(row) do
    [first, second | _others] = row;
    row ++ [second, first]
  end

  def filter_odd(%Identicon.Image{grid: grid} = input) do
    grid = Enum.filter(grid, fn({code, _others}) ->
       rem(code, 2) == 0
    end)

    %Identicon.Image{input| grid: grid}
  end

  def pixels_map (%Identicon.Image{grid: grid} = input) do
    pixel_map = Enum.map(grid, fn({_code, index}) ->
        x = rem(index, 5) * 50
        y = div(index, 5) * 50

        top_left = {x,y}
        botton_right = {x+50,y+50}

        {top_left,botton_right}
    end)

    %Identicon.Image{input | pixel_map: pixel_map}
  end

  def draw_image(%Identicon.Image{color: color, pixel_map: pixel_map}) do
    image = :egd.create(250, 250)
    fill = :egd.color(color)

    Enum.each(pixel_map, fn({top_left,botton_right}) ->
        :egd.filledRectangle(image, top_left, botton_right, fill)
    end)

    :egd.render(image)
  end

  def save_image(image, filename) do
    File.write("#{filename}.png", image)
  end

  def hello do
    :world
  end
end
