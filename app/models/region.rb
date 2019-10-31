class Region < ApplicationRecord

  validates :name, { presence: true,
                     uniqueness: true,
                     format: { with: /\A[0-9a-zA-Z0-9а-яА-Я'\s-]+\z/,
                               message: "only allows letters"
                     }
  }

  belongs_to :country
  has_many   :cities,
             :dependent => :destroy

end
