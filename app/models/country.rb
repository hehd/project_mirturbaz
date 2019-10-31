class Country < ApplicationRecord

  validates :name, { presence: true,
                     uniqueness: true,
                     format: { with: /\A[a-zA-Z0-9а-яА-Я'\s-]+\z/,
                               message: "only allows letters"
                     }
  }

  has_many :regions,
           :dependent => :destroy

end
