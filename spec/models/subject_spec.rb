require 'rails_helper'

RSpec.describe Subject, type: :model do
  it { is_expected.to validate_uniqueness_of(:title) }
  it { is_expected.to belong_to(:qualification) }
  it { is_expected.to have_db_column(:title).of_type(:string) }
  it { is_expected.to have_db_column(:colour).of_type(:string) }
  it { is_expected.to have_db_column(:unique_id).of_type(:integer) }
end
