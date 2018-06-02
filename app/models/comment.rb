class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  accepts_nested_attributes_for :user, reject_if: proc { |attributes| attributes['content'].blank? }


  def user_attributes=(user_attributes)
    puts "User Attributes = #{user_attributes}"
    self.user = User.find_or_create_by(username: user_attributes)
  end

end
