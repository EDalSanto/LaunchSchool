require 'sequel'

def create_database
  system('dropdb', '--if-exists', 'billing2')
  system('createdb', 'billing2')
end

def create_customers
  DB.create_table(:customers) do
    primary_key :id
    String      :name, text: true, null: false
    String      :payment_token, fixed: true, size: 8, null: false, unique: true

    constraint(:customers_payment_token_pattern_constraint) do
      payment_token =~ /^[A-Z]{8}$/
    end
  end
end

def insert_customer_row(name, payment_token)
  DB[:customers].insert(name: name, payment_token: payment_token)
end

def insert_customers
  insert_customer_row('Pat Johnson', 'XHGOAHEQ')
  insert_customer_row('Nancy Monreal', 'JKWQPJKL')
  insert_customer_row('Lynn Blake', 'KLZXWEEE')
  insert_customer_row('Chen Ke-Hua', 'KWETYCVX')
  insert_customer_row('Scott Lakso', 'UUEAPQPS')
  insert_customer_row('Jim Pornot', 'XKJEYAZA')
end

def create_services
  DB.create_table(:services) do
    primary_key :id
    String      :description, text: true, null: false
    BigDecimal  :price, size: [10, 2], null: false

    constraint(:services_price_non_negative_constraint) { price >= 0.00 }
  end
end

def insert_service_row(description, price)
  DB[:services].insert(description: description, price: price)
end

def insert_services
  insert_service_row('Unix Hosting', 5.95)
  insert_service_row('DNS', 4.95)
  insert_service_row('Whois Registration', 1.95)
  insert_service_row('High Bandwidth', 15.00)
  insert_service_row('Business Support', 250.00)
  insert_service_row('Dedicated Hosting', 50.00)
  insert_service_row('Bulk Email', 250.00)
  insert_service_row('One-to-one Training', 999.00)
end

def create_customers_services
  DB.create_table(:customers_services) do
    primary_key :id
    foreign_key :customer_id, :customers, on_delete: :cascade
    foreign_key :service_id, :services
  end
end

def insert_customer_service_row(customer_id, service_id)
  DB[:customers_services].insert(customer_id: customer_id,
                                 service_id: service_id)
end

# rubocop:disable Metrics/MethodLength
def insert_customers_services
  insert_customer_service_row(1, 1) # Pat Johnson/Unix Hosting
  insert_customer_service_row(1, 2) #            /DNS
  insert_customer_service_row(1, 3) #            /Whois Registration
  insert_customer_service_row(3, 1) # Lynn Blake/Unix Hosting
  insert_customer_service_row(3, 2) #           /DNS
  insert_customer_service_row(3, 3) #           /Whois Registration
  insert_customer_service_row(3, 4) #           /High Bandwidth
  insert_customer_service_row(3, 5) #           /Business Support
  insert_customer_service_row(4, 1) # Chen Ke-Hua/Unix Hosting
  insert_customer_service_row(4, 4) #            /High Bandwidth
  insert_customer_service_row(5, 1) # Scott Lakso/Unix Hosting
  insert_customer_service_row(5, 2) #            /DNS
  insert_customer_service_row(5, 6) #            /Dedicated Hosting
  insert_customer_service_row(6, 1) # Jim Pornot/Unix Hosting
  insert_customer_service_row(6, 6) #           /Dedicated Hosting
  insert_customer_service_row(6, 7) #           /Bulk Email
end
# rubocop:enable Metrics/MethodLength

DB = Sequel.connect "postgres://localhost/billing2"

#create_database
#
#create_customers
#insert_customers
#
#create_services
#insert_services
#
#create_customers_services
#insert_customers_services
#

services_by_customer = DB[:customers].select(:customers__name, :services__price, :services__description)
                        .join(:customers_services, customers_services__customer_id: :id)
                        .join(:services, services__id: :customers_services__service_id)
                        .order(:name, :description)
                        .group(:customers__name, :services__price, :services__description)

services_by_name = services_by_customer.all.group_by { |row| row[:name] }
services_by_name.each do |name, service_info|
  puts name
  service_info.each do |info|
    price = format('$%.2f', info[:price])
    puts "  #{info[:description]} #{price}"
  end
end
