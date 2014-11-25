class Person < ActiveRecord::Base

  validates :last_name, presence: true

  validate :first_name_or_title

  def first_name_or_title
    if !first_name.present? && !title.present?
      errors.add(:first_name, "/ last name or title / last name must be entered")
    end
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  has_many :assignments
  has_many :locations, through: :assignments

end
