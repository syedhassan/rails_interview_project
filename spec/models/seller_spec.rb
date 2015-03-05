require 'rails_helper'

describe Seller do
  it 'is valid with a name' do
    seller = Seller.new(name: 'Seller1')
    expect(seller).to be_valid
  end
end
