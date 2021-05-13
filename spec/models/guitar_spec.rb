require 'rails_helper'

RSpec.describe Guitar, type: :model do
  it {should belong_to :manufacturer}
end
