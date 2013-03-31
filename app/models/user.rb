class User < ActiveRecord::Base
  has_many :articles

  attr_accessible :name, :email, :password, :is_admin

  def to_s
    name
  end

  def admin?
    is_admin
  end

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password == password
      user
    else
      nil
    end
  end
end
