require 'validation'
require 'validation/rule/not_empty'

module Shopware
  module CLI
    module Subcommands
      module Mannol
        module Import
          module Validators
            class CareProduct < Validation::Validator
              include Validation

              rule :number,        :not_empty
              rule :order_number,  :not_empty
              rule :name,          :not_empty
              rule :description,   :not_empty
              rule :supplier,      :not_empty
              rule :category,      :not_empty
              rule :subcategory,   :not_empty
            end
          end
        end
      end
    end
  end
end