class User < ApplicationRecord
  validates :email, :name, :surname, :presence => true
  
  def favorite_name
    nickname || "#{name} #{surname}"
  end
end
