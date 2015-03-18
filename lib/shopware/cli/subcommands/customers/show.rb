require 'json'
require 'terminal-table'

module Shopware
  module CLI
    module Subcommands
      module Customers
        module Show
          def self.included(thor)
            thor.class_eval do
              desc 'show ID', 'Show Customer with ID'
              option :dump, type: :boolean, default: false, aliases: '-d'
              def show(id)
                customer = @client.get_customer id

                output(customer, options.dump)
              end

              desc 'show_by_number number', 'Show Customer with number'
              option :dump, type: :boolean, default: false, aliases: '-d'
              def show_by_number(number)
                customer = @client.find_customer_by_number number

                output(customer, options.dump)
              end

              no_commands do
                def output(customer, dump)
                  if customer
                    if not dump
                      id   = customer['id']
                      if !customer['billing'].nil?
                        name = customer['billing']['firstName'] + ' ' + customer['billing']['lastName']
                      elsif !customer['shipping'].nil?
                        name = customer['shipping']['firstName'] + ' ' + customer['shipping']['lastName']
                      else
                        name = customer['email']
                      end

                      table = Terminal::Table.new headings: ['Property', 'Value'] do |tb|
                        tb << ['ID', id]     if id
                        tb << ['Name', name] if name
                      end

                      puts table
                    else
                      puts JSON.pretty_generate customer
                    end
                  else
                    info 'Customer was not found.'
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end