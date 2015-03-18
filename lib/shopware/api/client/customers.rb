module Shopware
  module API
    class Client
      module Customers
        def get_customers
          response = self.class.get '/customers'

          response['data']
        end

        def get_customer(id)
          response = self.class.get "/customers/#{id}"

          response['data']
        end

        def find_customer_by_number(number)
          response = self.class.get "/customers/#{number}?useNumberAsId=true"

          response['data']
        end

        def create_customer(properties)
          response = self.class.post '/customers', body: properties

          response['data']
        end

        def update_customer(id, properties)
          response = self.class.put "/customers/#{id}", body: properties

          response['data']
        end

        def delete_customer(id)
          self.class.delete "/customers/#{id}"
        end
      end
    end
  end
end