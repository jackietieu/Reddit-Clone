# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :user_id, presence: true

  belongs_to :user

  has_many :post_subs
  has_many :subs,
    through: :post_subs

  has_many :comments
end
