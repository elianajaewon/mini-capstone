require "unirest"
require "pp"

response = Unirest.get("http://localhost:3000/product_all_url")
all_products = response.body
pp all_products

# table = TTY::Table.new ['header1','header2'], [['a1', 'a2'], ['b1', 'b2']]
# table.render(:ascii)

# table = TTY::Table[['a1', 'a2'], ['b1', 'b2']]
# table = TTY::Table.new [['a1', 'a2'], ['b1', 'b2']]
# table = TTY::Table.new rows: [['a1', 'a2'], ['b1', 'b2']]