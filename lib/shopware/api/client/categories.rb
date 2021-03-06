module Shopware
  module API
    class Client
      module Categories
        def get_categories
          response = self.class.get '/categories'

          response['data']
        end

        def get_category(id)
          response = self.class.get "/categories/#{id}"

          response['data']
        end

        def find_category_by_name(name)
          response = self.class.get '/categories'

          if response['success']
            categories = response['data']

            categories.each do |category|
              return category if category['name'] == name
            end
          end

          nil
        end

        def create_category(properties)
          response = self.class.post '/categories', body: properties

          response['data']
        end

        def update_category(id, properties)
          response = self.class.put "/categories/#{id}", body: properties

          response['data']
        end

        def delete_category(id)
          self.class.delete "/categories/#{id}"
        end
      end
    end
  end
end