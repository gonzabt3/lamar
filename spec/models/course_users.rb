require 'rails_helper'

RSpec.describe CourseUsers, type: :model do

  describe 'validations' do
    let!(:course) { create(:course) }
    let!(:user){ create(:user) }
    let!(:role){ create(:role, name: 'professor') }
    context 'when the user exists in the course' do
      before do 
        create(:course_users, course_id: course.id, user_id: user.id, role_id: role.id) 
      end
      it 'not valid' do
        expect(course.add_user(user, role)).to_not be_valid
      end
    end
  end
end