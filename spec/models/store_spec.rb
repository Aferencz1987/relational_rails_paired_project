require 'rails_helper'

RSpec.describe Store do
  it{should have_many :tools}
end