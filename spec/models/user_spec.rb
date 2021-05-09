require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context 'with valid params' do
      it 'creates a resource' do
        expect{
          User.create(email: 'test-user@gmail.com', name: 'test-name', surname: 'test-surname', nickname: 'test-nickname')
        }.to change { User.count}
      end
    end
    context 'with invalid params' do
      context 'with empty surname' do
        it 'does not create a resource' do
          expect{
            User.create(email: 'test-user@gmail.com', name: 'test-name')
          }.not_to change { User.count  }
        end
      end
      context 'without email' do
        it 'does not create a resource' do
          expect{
            User.create( name: 'test-name', surname: 'test-surname', nickname: 'test-nickname')
          }.not_to change { User.count  }
        end
      end
    end
  end

  describe '::favorite_name' do
    describe 'when user has nickname' do
      let(:user) { create(:user, name: 'test-name', surname: 'test-surname', nickname: 'test-nickname') }
      it 'returns nickname' do
        expect(user.favorite_name).to eq(user.nickname)
      end
    end
    describe 'when user not has nickname' do
      let(:user) { create(:user, name: 'test-name', surname: 'test-surname', nickname: nil) }
      it 'returns name and username' do
        expect(user.favorite_name).to eq("#{user.name} #{user.surname}")
      end
    end
  end
end
