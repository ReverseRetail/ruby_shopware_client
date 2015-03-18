require 'json'
require 'terminal-table'

module Shopware
  module CLI
    module Subcommands
      module Orders
        module Show
          def self.included(thor)
            thor.class_eval do
              desc 'show ID', 'Show Order with ID'
              option :dump, type: :boolean, default: false, aliases: '-d'
              def show(id)
                order = @client.get_order id

                output(order, options.dump)
              end

              desc 'show_by_number number', 'Show Order with number'
              option :dump, type: :boolean, default: false, aliases: '-d'
              def show_by_number(number)
                order = @client.find_order_by_number number

                output(order, options.dump)
              end

              no_commands do
                def output(order, dump)
                  if order
                    if not dump
                      id   = order['id']
                      if !order['billing'].nil?
                        name = order['billing']['firstName'] + ' ' + order['billing']['lastName']
                      elsif !order['shipping'].nil?
                        name = order['shipping']['firstName'] + ' ' + order['shipping']['lastName']
                      else
                        name = order['email']
                      end

                      table = Terminal::Table.new headings: ['Property', 'Value'] do |tb|
                        tb << ['ID', id]     if id
                        tb << ['Name', name] if name
                      end

                      puts table
                    else
                      puts JSON.pretty_generate order
                    end
                  else
                    info 'Order was not found.'
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