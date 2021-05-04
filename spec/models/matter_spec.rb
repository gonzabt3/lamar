require 'rails_helper'

RSpec.describe Matter, type: :model do
  describe '#create' do
    let!(:university) { create(:university) }
    let!(:career) { create(:career, university: university) }
    context 'with valid params' do
      it 'create a matter resource' do
        expect{
          Matter.create(name: 'matter-test-name', career: career)
        }.to change{ Matter.count}
      end
    end
    context 'with invalid params' do
      context 'with empty name' do
        it 'does not create a matter resource' do
          expect{
            Matter.create(name: '', career: career)
          }.not_to change{ Matter.count}
        end
      end
      context 'without asociated career' do
        it 'does not create a matter resource' do
          expect{
            Matter.create(name: 'matter-test-name')
          }.not_to change{ Matter.count}
        end
      end
    end
  end
  
end
