class User < ApplicationRecord
  has_many :battles

  validates :username, presence: true, uniqueness: {case_sensitive: false},
                       length: {minimum: 3, maximum: 20},
                       format: {with:    /\A\w+\z/,
                                message: "only allows letters, numbers and underscores"}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :trackable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
