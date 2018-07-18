# == Schema Information
#
# Table name: posts
#
#  id        :bigint(8)        not null, primary key
#  title     :string           not null
#  url       :string
#  content   :text
#  sub_id    :integer          not null
#  author_id :integer          not null
#

class Post < ApplicationRecord
  validates :title, :sub_id, :author_id, presence: true
  
  has_many :post_subs,
    foreign_key: :post_id,
    class_name: :PostSub,
    inverse_of: :post
    
  has_many :subs,
    through: :post_subs,
    source: :sub
  
  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User
    
  has_many :comments
end
