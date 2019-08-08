class User < ApplicationRecord

  validates_presence_of :name, message: "users must have a name"
  validates_presence_of :email, message: "users must have an email"
  validates_format_of :email, with: /\A([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})\z/i, message: "email has an invalid format"
  validates_uniqueness_of :email, message: "an account with this email already exists"

  def method
  end

  def self.class_method
  end
end
