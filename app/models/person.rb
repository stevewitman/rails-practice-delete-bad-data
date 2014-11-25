class Person < ActiveRecord::Base

  validates :first_name, presence: true, unless: ->(user){user.title.present?}
  validates :last_name, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  has_many :assignments
  has_many :locations, through: :assignments

end
