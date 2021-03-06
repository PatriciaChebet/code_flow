# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Comprehension do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  alias CodeFlow.Schemas.User

  def award_unfair_points(users, points) do
    for person when person.active == true <- users, String.contains?(person.name, "uc") do
      %User{person | points: person.points + points}
    end
  end

  def build_chessboard() do
    for row <- 1..8, col <- ["a", "b", "c", "d", "e", "f", "g", "h"]  do 
          IO.inspect("#{col}#{row}")
          %{col: col, row: row, name: "#{col}#{row}"}
        end
  end

  def team_points(users) do
    for person when person.active == true <- users, reduce: 0 do
      sum ->
        sum + person.points
    end
  end
end
