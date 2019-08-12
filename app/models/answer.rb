class Answer < ApplicationRecord
  belongs_to :question
  has_many :answer_users
  has_many :users, :through => :answer_users

  def vote_number
    returned = ActiveRecord::Base.connection.execute("select * from answer_users where answer_id = #{self.id}")
    returned.sort.length
  end


end
