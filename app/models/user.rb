class User < ApplicationRecord
  rolify

  after_create :assign_default_role

  validates :email, :name, :surname, :presence => true
  
  def favorite_name
    nickname || "#{name} #{surname}"
  end

  private

  def assign_default_role
    self.add_role(:regular) if self.roles.blank?
  end
end
