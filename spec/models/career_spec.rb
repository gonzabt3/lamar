require 'rails_helper'

RSpec.describe Career, type: :model do
  describe '#create' do
    let!(:university) { create(:university) }
    context 'with valid params' do
      it 'creates a resource' do
        expect{
          Career.create(name: 'test-career', university: university)
        }.to change { Career.count}
      end
    end
    context 'with invalid params' do
      context 'with empty name' do
        it 'does not create a resource' do
          expect{
            Career.create(name: '', university: university)
          }.not_to change { Career.count  }
        end
      end
      context 'without asociated university' do
        it 'does not create a resource' do
          expect{
            Career.create(name: '')
          }.not_to change { Career.count  }
        end
      end
    end
  end
end
