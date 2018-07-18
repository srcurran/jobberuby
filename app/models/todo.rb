class Todo < ApplicationRecord

  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true

  def change_status
    update_attribute(:content, nil)
  end

end
