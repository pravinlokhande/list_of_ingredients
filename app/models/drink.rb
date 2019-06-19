class Drink < ApplicationRecord
    # # belongs_to :ingredients, class_name: "ingredients", foreign_key: "ingredients_id"
    # has_many :ingredients, class_name: "ingredients", foreign_key: "reference_id"
    has_many :ingredients
end
