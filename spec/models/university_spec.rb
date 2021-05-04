require "rails_helper"

RSpec.describe University, type: :model do
  describe '#create' do
    context 'when params are valid' do
      it 'creates a resources' do
        expect { 
          University.create({name: 'test-name'})
        }.to change { University.count }
      end
      it 'creates a resources with valid flag as true' do
        University.create({name: 'test-name'})
        university = University.last
        expect(university.active).to be_truthy
      end
    end
    context 'when params are invalid' do
      context 'when name is empty' do
        it 'does not create a resources' do
          expect { 
            University.create(name: '')
          }.not_to change { University.count }
        end
      end
    end
  end
end