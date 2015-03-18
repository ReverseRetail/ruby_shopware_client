module Shopware
  module CLI
    module Subcommands
      module Orders
        module Delete
          def self.included(thor)
            thor.class_eval do
              desc 'delete ID', 'Delete order with ID'
              def delete(id)
                result = @client.delete_order id

                if result['success']
                  ok 'Order delete.'
                else
                  error 'Order could not be deleted.'
                end
              end
            end
          end
        end
      end
    end
  end
end