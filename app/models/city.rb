class City < ApplicationRecord

  validates :name, { presence: true,
                     uniqueness: true,
                     format: { with: /\A[a-zA-Z0-9а-яА-Я'\s-]+\z/,
                               message: "only allows letters"
                     }
  }

  belongs_to :region
  has_many   :camps,
             :dependent => :destroy

end
