# ---
# Excerpted from "Thinking Elixir - CodeFlow", published by Mark Ericksen.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact me if you are in doubt. I make
# no guarantees that this code is fit for any purpose. Visit
# https://thinkingelixir.com/available-courses/code-flow/ for course
# information.
# ---
defmodule CodeFlow.With do
  @moduledoc """
  Defining a workflow or "Code Flow" using a `with` statement.
  """
  alias CodeFlow.Schemas.Order
  alias CodeFlow.Fake.Customers
  alias CodeFlow.Fake.Orders
  alias CodeFlow.Fake.Items

  @spec place_new_order(customer_id :: integer, item_id :: integer, quantity :: integer) ::
          {:ok, Order.t()} | {:error, String.t()}
  def place_new_order(customer_id, item_id, quantity) do
    with {:customer, {:ok, customer}} <- {:customer, Customers.find(customer_id)},
         {:item, {:ok, item}} <- {:item, Items.find(item_id)},
         {:new_order, {:ok, %Order{} = new_order}} <- {:new_order, Orders.new(customer)},
         {:added_item, {:ok, updated_order}} <- {:added_item, Orders.add_item(new_order, item, quantity)},
         {:notified_customer, :ok} <- {:notified_customer, Customers.notify(customer, new_order, {:order_placed, new_order})} do
           {:ok, new_order}
        else 
          {:customer, :error} -> 
            {:error, "Customer not found"}
          {:item, :error} ->
            {:error, "Item not found"}
          {:new_order, :error} ->
            {:error, "Cannot create order for inactive customer"}
          {:added_item, :error} ->
            {:error, "Cannot order an inactive item"}
          {:notified_customer, :error} ->
            case :error do
              :timeout ->
                {:error, "Timed out attempting to notify customer"}
              nil -> 
                {:error, "Customer contact email missing"}
            end
  end
end
end
