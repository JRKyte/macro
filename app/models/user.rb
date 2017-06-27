class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :trackable, :validatable

  ROLES = %w[trainer client].freeze

  validates :role, inclusion: { in: ROLES }
  validates :name, presence: { if: :client? }
  do_not_validate_attachment_file_type :image

  belongs_to :trainer, class_name: 'User', optional: true
  has_many :clients, class_name: 'User', foreign_key: 'trainer_id'
  has_attached_file :image, styles: { thumb: "60x60#" }, default_url: "/assets/:style/missing.png"

  def trainer?
    role == 'trainer'
  end

  def client?
    role == 'client'
  end
end
