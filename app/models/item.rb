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

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :charges_id
    validates :area_id
    validates :schedule_id
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charges
  belongs_to :area
  belongs_to :schedule

  has_one_attached :image
end
