class Region < ApplicationRecord

  validates :name, { presence: true,
                     uniqueness: true,
                     length: { maximum: 50 },
                     format: { with: /\A[a-zA-Z\s]+\z/,
                               message: "only allows letters"
                     }
  }

  belongs_to :country
  has_many   :cities,
             :dependent => :destroy

end
