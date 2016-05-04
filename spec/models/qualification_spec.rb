require 'rails_helper'

RSpec.describe Qualification, type: :model do
   it { is_expected.to have_many(:subjects) }
   it { is_expected.to have_db_column(:name).of_type(:string) }
end
