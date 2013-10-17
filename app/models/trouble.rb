class Trouble < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :name, presence:true, length:{ minimum: 3 }

  acts_as_gmappable

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  # DON'T FORGET to place an address field too
    "#{address}"
  end

  belongs_to :city
  
end
