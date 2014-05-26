module Shopware
  module CLI
    module Subcommands
      module Mannol
        module Import
          module Models
            class Variant
              attr_accessor :number, :supplier_number, :content_value, :content_unit,
                            :properties, :image_small, :image_big, :category,
                            :subcategory, :subcategory_description, :subsubcategory,
                            :car_categories

              def initialize
                @properties = []

                @car_categories = []
              end

              def content
                content_unit ? "#{content_value} #{convert_unit content_unit}" : content_value
              end

              def purchase_unit
                content_value.to_f
              end

              def reference_unit
                1.to_f
              end

              def unit_id
                case @content_unit
                when 'L'
                  1
                when 'Kg'
                  6
                else
                  nil
                end
              end

              def convert_unit(unit)
                case unit
                when 'L'
                  'Liter'
                when 'Kg'
                  'Kilogramm'
                else
                  unit
                end
              end
            end
          end
        end
      end
    end
  end
end