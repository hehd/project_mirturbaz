class Region < ApplicationRecord

  validates :name, { presence: true,
                     uniqueness: true,
                     length: { maximum: 50 },
                     format: { with: /\A[a-zA-Z\s]+\z/,
                               message: "only allows letters"
                     }
  }


end
