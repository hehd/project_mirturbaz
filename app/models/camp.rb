class Camp < ApplicationRecord

  validates :name, { presence: true,
                     uniqueness: true,
                     length: { maximum: 50 },
                     format: { with: /\A[a-zA-Z\s]+\z/,
                               message: "only allows letters"
                     }
  }
  validates :price, { numericality: { greater_than: 0,
                                      allow_nil: true
                      }
  }

  belongs_to :city

end
