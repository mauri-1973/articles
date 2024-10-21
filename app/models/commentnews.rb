class Commentnews < ApplicationRecord
  belongs_to :post
  belongs_to :user, optional: true  # comentarios pueden ser sin usuario
end
