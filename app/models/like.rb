class Like < ApplicationRecord

  belongs_to :post

  belongs_to :user, optional: true 

  validates :type_react, inclusion: { in: %w[like dislike not_interested neutral] }
end
