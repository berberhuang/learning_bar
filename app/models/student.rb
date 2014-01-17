class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # def update_with_password(params={}) 
  #   if params[:password].blank? 
  #     params.delete(:password) 
  #     params.delete(:password_confirmation) if params[:password_confirmation].blank? 
  #   end 
  #   update_attributes(params) 
  # end

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username,:phone,:email, :password, :password_confirmation, :remember_me,:description,:resume
  #paperclip
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "128x128>", :tiny=>"45X45>" }, :default_url => "/images/:style/default_avatar.png"
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

  has_many :attends
  has_many :courses,:through=>:attends

  has_many :student_skill_ships
  has_many :skills,:through=>:student_skill_ships
end
