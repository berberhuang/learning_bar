class Student < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  # def update_with_password(params={}) 
  #   if params[:password].blank? 
  #     params.delete(:password) 
  #     params.delete(:password_confirmation) if params[:password_confirmation].blank? 
  #   end 
  #   update_attributes(params) 
  # end

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username,:phone,:email, :password, :password_confirmation,
                  :remember_me,:description,:resume,:provider, :uid
  #paperclip
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "128x128>", :tiny=>"55X55>" }, :default_url => "/images/:style/default_avatar.png"
  validates_attachment :avatar, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }

  has_many :attends
  has_many :courses,:through=>:attends

  has_many :student_skill_ships
  has_many :skills,:through=>:student_skill_ships

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    student = Student.where(:provider => access_token.provider, :uid => access_token.uid ).first
    registered_user = Student.where(:email => access_token.info.email).first
    if student
      return student
    elsif registered_user
      return registered_user
    else
      return false
    end
  end
   def self.create_for_google_oauth2(access_token, signed_in_resource=nil)
     data= access_token.info
     student = Student.create(username: data["name"],
          provider:access_token.provider,
          email: data["email"],
          uid: access_token.uid ,
          password: Devise.friendly_token[0,20],
        )
   end
end
