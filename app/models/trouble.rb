class Trouble < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :name, presence:true, length:{ minimum: 3 }
  validates :city, presence:true, length:{ minimum: 2 }

  acts_as_gmappable

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{city}, #{address}"
  end
end
