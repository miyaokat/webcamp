class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  has_many :books, dependent: :destroy

 validates :name,uniqueness: true
 validates :name, presence: true
 #validates :email, presence: true
 validates :name,length: { maximum: 20 }
 validates :name,length: { minimum: 2  }
 validates :introduction,length: { maximum: 50 }
 attachment :profile_image

 # deviseでemailを不必要にする
 #def email_required?
 #  false
 #end
 #def email_changed?
 #  false
 #end

end
