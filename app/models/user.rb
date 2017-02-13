class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
  before_create :generate_uuid
  validates :username, presence: true

  private

  def generate_uuid
    UUIDHelper.assign_to(self)
  end
end
