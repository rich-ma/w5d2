# == Schema Information
#
# Table name: post_subs
#
#  id      :bigint(8)        not null, primary key
#  sub_id  :integer          not null
#  post_id :integer          not null
#

class PostSub < ApplicationRecord
  # validates :sub_id, :post_id, presence: true
  # validates :sub, :post, presence: true
  # validates :post_id, uniqueness: { scope: :sub_id }
  
  belongs_to :post,
  foreign_key: :post_id,
  class_name: :Post
  
  belongs_to :sub,
    foreign_key: :sub_id,
    class_name: :Sub
    
    
end
