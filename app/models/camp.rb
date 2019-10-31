class Camp < ApplicationRecord

  validates :name, { presence: true,
                     uniqueness: true,
                     length: { maximum: 50 },
                     format: { with: /\A[a-zA-Z0-9а-яА-Я'\s-]+\z/,
                               message: "only allows letters"
                     }
  }
  validates :price, { numericality: { greater_than: 0,
                                      allow_nil: true
                      }
  }
  validates_presence_of :name, :price
  belongs_to :city

end
