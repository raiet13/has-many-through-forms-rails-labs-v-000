class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['username'].blank? }


  def user_attributes=(user_attributes)
    puts "User Attributes = #{user_attributes}"
    if user_attributes[:username] != ""
      self.user = User.find_or_create_by(user_attributes)
    end
  end

end
