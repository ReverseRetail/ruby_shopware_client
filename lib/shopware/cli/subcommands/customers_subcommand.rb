require 'shopware/cli/subcommands/subcommand'
require 'shopware/cli/subcommands/customers/list'
require 'shopware/cli/subcommands/customers/show'
require 'shopware/cli/subcommands/customers/delete'

module Shopware
  module CLI
    module Subcommands
      class CustomersSubcommand < Subcommand
        include Customers::List
        include Customers::Show
        include Customers::Delete
      end
    end
  end
end