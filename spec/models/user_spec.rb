require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.new(name: 'John Doe', email: 'john.doe@example.com', password: 'password123')
      expect(user).to be_valid
    end

    # it 'is not valid without a name' do
    #   user = User.new(name: nil, email: 'john.doe@example.com', password: 'password123')
    #   expect(user).to_not be_valid
    # end

    # it 'is not valid without an email' do
    #   user = User.new(name: 'John Doe', email: nil, password: 'password123')
    #   expect(user).to_not be_valid
    # end

    # it 'is not valid with a duplicate email' do
    #   User.create(name: 'John Doe', email: 'john.doe@example.com', password: 'password123')
    #   duplicate_user = User.new(name: 'Jane Doe', email: 'john.doe@example.com', password: 'password123')
    #   expect(duplicate_user).to_not be_valid
    # end

    # it 'is not valid if email format is incorrect' do
    #   user = User.new(name: 'John Doe', email: 'john.doe@com', password: 'password123')
    #   expect(user).to_not be_valid
    # end

    # it 'is not valid without a password' do
    #   user = User.new(name: 'John Doe', email: 'john.doe@example.com', password: nil)
    #   expect(user).to_not be_valid
    # end

    # it 'is not valid if password is too short' do
    #   user = User.new(name: 'John Doe', email: 'john.doe@example.com', password: 'short')
    #   expect(user).to_not be_valid
    # end
  end
end
