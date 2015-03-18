module Shopware
  module API
    class Client
      module Orders
        def get_orders
          response = self.class.get '/orders'

          response['data']
        end

        def get_order(id)
          response = self.class.get "/orders/#{id}"

          response['data']
        end

        def find_order_by_number(number)
          response = self.class.get "/orders/#{number}?useNumberAsId=true"

          response['data']
        end

        def create_order(properties)
          # FIXME - isn't possible!
          response = self.class.post '/orders', body: properties

          response['data']
        end

        def update_order(id, properties)
          response = self.class.put "/orders/#{id}", body: properties

          response['data']
        end

        def delete_order(id)
          self.class.delete "/orders/#{id}"
        end
      end
    end
  end
end