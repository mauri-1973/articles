class Article < ApplicationRecord

    belongs_to :country

    has_many :comments, dependent: :destroy

    has_many :reactions, dependent: :destroy

    has_many :users, through: :reactions #or comments doesn't matter


    Kinds = %w[like dislike not_interested neutral].freeze

    KindsSpanish = {"like" => "Me gusta", "dislike" => "No me gusta", "not_interested" => "No me interesa", "neutral" => "Neutral"}.freeze

    def formatted_when_went
        when_went.strftime('%d-%m-%Y')
    end

end
