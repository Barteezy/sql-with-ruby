require "database_connection"

class SqlExercise

  attr_reader :database_connection

  def initialize
    @database_connection = DatabaseConnection.new
  end

  def all_customers
    database_connection.sql("SELECT * from customers")
  end

  def limit_customers(num)
    database_connection.sql("SELECT * from customers limit #{num}")
  end

  def order_customers(order)
    database_connection.sql("SELECT * from customers order by name #{order}")

  end

  def id_and_name_for_customers
    database_connection.sql("SELECT id, name FROM customers")
  end

  def all_items
    database_connection.sql("SELECT * from items")
  end

  def find_item_by_name(name)
    database_connection.sql("SELECT * from items where name = '#{name}'").first
  end

  def count_customers
    count_hash = database_connection.sql("SELECT COUNT(name) FROM customers").first
    count_hash["count"].to_i
  end

  def sum_order_amounts
    amount_hash = database_connection.sql("SELECT sum(amount) FROM orders").first
    amount_hash["sum"].to_f
  end

  def minimum_order_amount_for_customers
    database_connection.sql("SELECT customer_id, min(amount) FROM orders group by customer_id")
  end

  def customer_order_totals
    database_connection.sql("select customers.id AS customer_id, customers.name, SUM(orders.amount) from orders inner join customers on orders.customer_id=customers.id GROUP BY customers.id")
  end

  def order_items_by_user
    database_connection.sql()
  end
end
