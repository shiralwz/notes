require 'spec_helper'

describe User do
  it 'should validate password' do
    user = User.create!(username: 'test', password: 'right')
    user.authenticate('right').should be_true
    user.authenticate('wrong').should be_false
  end
end
