require 'shopware/cli/subcommands/subcommand'
require 'shopware/cli/subcommands/orders/list'
require 'shopware/cli/subcommands/orders/show'
require 'shopware/cli/subcommands/orders/delete'

module Shopware
  module CLI
    module Subcommands
      class OrdersSubcommand < Subcommand
        include Orders::List
        include Orders::Show
        include Orders::Delete
      end
    end
  end
end