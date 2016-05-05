class Subject < ActiveRecord::Base
  belongs_to :qualification
  validates :title, uniqueness: { scope: :qualification_id }
end
