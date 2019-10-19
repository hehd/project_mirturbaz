class Country < ApplicationRecord

  validates :name, { presence: true,
                     uniqueness: true,
                     length: { maximum: 50 },
                     format: { with: /\A[a-zA-Z]+\z/,
                               message: "only allows letters"
                     }
  }

end
