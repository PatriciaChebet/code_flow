# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.Recursion do
  @moduledoc """
  Fix or complete the code to make the tests pass.
  """
  alias CodeFlow.Fake.Customers
  alias CodeFlow.Schemas.OrderItem
  alias CodeFlow.Schemas.Customer

  @doc """
  Sum a list of OrderItems to compute the order total.
  """
  def order_total(order_items) do
    calculate_total(order_items, 0)
  end

  defp calculate_total([%OrderItem{} = order_item | rest_items], total) do
    calculate_total(rest_items, total + (order_item.item.price * order_item.quantity)) 
  end

  defp calculate_total([], total) do
    total
  end

  @doc """
  Count the number of active customers. Note: Normally this would be done with a
  query to an SQL database. This is just to practice conditionally incrementing
  a counter and looping using recursion.
  """
  def count_active(customers) do
    count_active_customers(customers, 0)
  end

  defp count_active_customers([%Customer{active: true} | rest_customer], active_customers) do
    count_active_customers(rest_customer, active_customers + 1)
  end

  defp count_active_customers([_customer | rest_customer], active_customers) do
    count_active_customers(rest_customer, active_customers)
  end

  defp count_active_customers([], active_customers) do
    active_customers
  end
  @doc """
  Create the desired number of customers. Provide the number of customers to
  create. Something like this could be used in a testing setup.
  """
  def create_customers(_number) do

  end

  @doc """
  Compute the value in the Fibonacci sequence for the number. If the number is
  "10", then the result is 10 plus the value of the 9th index of the fibonacci
  sequence.
  https://en.wikipedia.org/wiki/Fibonacci_number
  """
  def fibonacci(_num) do

  end
end
