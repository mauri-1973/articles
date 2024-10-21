class Post < ApplicationRecord

  belongs_to :user, optional: true  # permite posts anónimos

  has_many :like, dependent: :destroy

  has_many :commentnews, dependent: :destroy

  Kinds = %w[like dislike not_interested neutral].freeze

  KindsSpanish = {"like" => "Me gusta", "dislike" => "No me gusta", "not_interested" => "No me interesa", "neutral" => "Neutral"}.freeze

  def formatted_created_at

    created_at.strftime('%d-%m-%Y')

  end
  def formatted_created_at_hour

    created_at.strftime('%H:%M:%S')

  end
  def count_reactions_by_type(type)

    like.where(type_react: type).count

  end

end
