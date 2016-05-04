class Subject < ActiveRecord::Base
  belongs_to :qualification
  validates :unique_id, uniqueness: true
end
