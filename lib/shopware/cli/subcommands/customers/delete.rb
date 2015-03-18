module Shopware
  module CLI
    module Subcommands
      module Customers
        module Delete
          def self.included(thor)
            thor.class_eval do
              desc 'delete ID', 'Delete customer with ID'
              def delete(id)
                result = @client.delete_customer id

                if result['success']
                  ok 'Customer delete.'
                else
                  error 'Customer could not be deleted.'
                end
              end
            end
          end
        end
      end
    end
  end
end