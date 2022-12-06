require 'rails_helper'

describe User, type: :model do
  require 'rails_helper'

  describe User, type: :model do
    context 'validation tests' do
      it 'ensures email presence' do
        user = User.new(username: 'test', password_digest: 'test12345').save
        expect(user).to eq(false)
      end
  
      it 'ensures username presence' do
        user = User.new(email: 'john@gmail.com', password_digest: 'john12345').save
        expect(user).to eq(false)
      end
  
      it 'ensures password presence' do
        user = User.new(username: 'doe', email: 'doe@gmail.com').save
        expect(user).to eq(false)
      end
  
      it 'should save successfully' do
        user = User.new(username: 'doe', email: 'doe@gmail.com', password_digest: 'doe12345').save
        expect(user).to eq(true)
      end

      it 'should not save if username is too short' do
        user = User.new(username: 'do', email: 'doe@gmail.com')
        expect(user).to_not be_valid
      end

      it 'should not save if username is too long' do
        user = User.new(username: 'doe' * 10, email: 'doe@gmail.com')
        expect(user).to_not be_valid
      end

      it 'should not save if REGEX is not followed' do
        user = User.new(username: 'doe', email: 'doe@gmail')
        expect(user).to_not be_valid
      end
    end
  end
end


