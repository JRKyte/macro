class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :trackable, :validatable
end