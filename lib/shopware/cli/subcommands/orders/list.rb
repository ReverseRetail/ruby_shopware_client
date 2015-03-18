require 'terminal-table'

module Shopware
  module CLI
    module Subcommands
      module Orders
        module List
          def self.included(thor)
            thor.class_eval do
              desc 'list', 'List orders'
              def list
                orders = @client.get_orders

                unless orders.empty?
                  table = Terminal::Table.new headings: ['ID', 'Number']

                  orders.each do |order|
                    id   = order['id']
                    name = order['number']

                    table << [id, name]
                  end

                  puts table
                else
                  info 'No orders found.'
                end
              end
            end
          end
        end
      end
    end
  end
end