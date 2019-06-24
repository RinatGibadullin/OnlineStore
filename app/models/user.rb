class User < ApplicationRecord
	has_many :orders
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  	validates :phone,:presence => true,
                 :numericality => true,
                 :length => { :minimum => 10, :maximum => 15 }
    # def is_admin
    # 	if !current_user.nil? && current_user.admin == true
    # 		return true
    # 	else
    # 		return false
    # 	end
    # end
end
