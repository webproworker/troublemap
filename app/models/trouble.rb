class Trouble < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :name, presence:true, length:{ minimum: 3 }
  validates :city, presence:true, length:{ minimum: 2 }
end
