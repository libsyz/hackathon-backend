class User < ApplicationRecord
  acts_as_token_authenticatable
  validates_presence_of :email, :encrypted_password, :name, :surname, :position, :company
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :hackathon_sessions
  has_many :hackathons, through: :hackathon_sessions
       
end
