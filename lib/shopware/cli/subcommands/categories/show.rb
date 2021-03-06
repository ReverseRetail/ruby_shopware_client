require 'json'
require 'terminal-table'

module Shopware
  module CLI
    module Subcommands
      module Categories
        module Show
          def self.included(thor)
            thor.class_eval do
              desc 'show ID', 'Show category with ID'
              option :dump, type: :boolean, default: false, aliases: '-d'
              def show(id)
                category = @client.get_category id

                if category
                  if not options.dump
                    id             = category['id']
                    name           = category['name']
                    active         = category['active']
                    position       = category['position']
                    parent_id      = category['parentId']
                    children_count = category['childrenCount']
                    article_count  = category['articleCount']

                    table = Terminal::Table.new headings: ['Property', 'Value'] do |tb|
                      tb << ['ID', id]                         if id
                      tb << ['Name', name]                     if name
                      tb << ['Active', active]                 if active
                      tb << ['Position', position]             if position
                      tb << ['Parentable ID', parent_id]       if parent_id
                      tb << ['Children count', children_count] if children_count
                      tb << ['Article count', article_count]   if article_count
                    end

                    puts table
                  else
                    puts JSON.pretty_generate category
                  end
                else
                  info 'Category was not found.'
                end
              end
            end
          end
        end
      end
    end
  end
end