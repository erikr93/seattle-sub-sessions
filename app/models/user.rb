class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

    has_many :events, dependent: :destroy
    has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
    has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

    has_many :following, through: :active_relationships, source: :followed
    has_many :followers, through: :passive_relationships, source: :follower

    validates :email,
    presence: true,
    uniqueness: {case_sensitive: false}

    validates :password,
    length: { in: 8..72 },
    on: :create

    has_secure_password

    def self.authenticate(params)
        User.find_by_email(params[:email]).try(:authenticate, params[:password])
    end
    #follow
    def follow(other)
        active_relationships.create(followed_id: other.id)
    end
    #unfollow
    def unfollow(other)
        active_relationships.create(followed_id: other.id).destroy
    end
    def following(other)
         following.include(other)
     end
end
