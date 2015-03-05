require 'rails_helper'

describe Location do
  it 'is valid with a name and address' do
    location = Location.new(name: 'location1', address: 'address1')
    expect(location).to be_valid
  end
end
