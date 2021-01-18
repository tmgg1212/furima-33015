class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :price, numericality: { only_integer: true },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :category_id
    validates :condition_id
    validates :charges_id
    validates :area_id
    validates :schedule_id
    validates :explanation
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :charges

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :schedule

  has_one_attached :image
end
