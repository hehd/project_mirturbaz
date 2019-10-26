class City < ApplicationRecord

  validates :name, { presence: true,
                     uniqueness: true,
                     length: { maximum: 50 },
                     format: { with: /\A[a-zA-Z\s]+\z/,
                               message: "only allows letters"
                     }
  }

  belongs_to :region
  has_many   :camps,
             :dependent => :destroy

end
