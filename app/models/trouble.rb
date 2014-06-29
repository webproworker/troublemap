class Trouble < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :name, presence:true, length: { minimum: 2 }
  validates :description, presence:true
  validates :author, presence:true, length: {minimum: 4}
  validates :severity, presence:true
  belongs_to :city

  has_attached_file :photo, 
    :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, 
    :content_type => /^image\/(jpg|jpeg|png|gif|jpeg|x-png|pjpeg)/, 
    :message => "Sunt acceptate doar imagini de maximum 2MB in format .PNG, .JPG, .JPEG, .GIF"
  validates_attachment_size :photo,
    :in => 0.megabytes..2.megabytes,
    :message => "Dimensiunea imaginii nu trebuie sa depaseasca 2MB."

  acts_as_gmappable

  # geocoded_by :address

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
  # DON'T FORGET to place an address field too
    "#{latitude}, #{longitude}, #{address}"

  end

end
