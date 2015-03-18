require 'terminal-table'

module Shopware
  module CLI
    module Subcommands
      module Customers
        module List
          def self.included(thor)
            thor.class_eval do
              desc 'list', 'List customers'
              def list
                customers = @client.get_customers

                unless customers.empty?
                  table = Terminal::Table.new headings: ['ID', 'email']

                  customers.each do |customer|
                    id   = customer['id']
                    name = customer['email']

                    table << [id, name]
                  end

                  puts table
                else
                  info 'No customers found.'
                end
              end
            end
          end
        end
      end
    end
  end
end