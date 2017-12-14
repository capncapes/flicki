class User < ApplicationRecord
  has_many :wikis

  enum role: [:admin, :standard, :premium]

  after_initialize do
  	if self.new_record?
      self.role ||= :standard
    end
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
