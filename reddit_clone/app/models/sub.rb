# == Schema Information
#
# Table name: subs
#
#  id           :bigint(8)        not null, primary key
#  title        :string           not null
#  description  :text             not null
#  moderator_id :integer          not null
#

class Sub < ApplicationRecord
end
