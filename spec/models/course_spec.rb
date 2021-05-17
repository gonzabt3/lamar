require 'rails_helper'

RSpec.describe Course, type: :model do

  describe '::add_user' do
    let!(:course) { create(:course) }
    let!(:user){ create(:user) }
    let!(:role){ create(:role, name: 'professor') }
    context 'when the user does not exist in the course' do
      it 'creates the relation CourseUsers' do
        expect{
          course.add_user(user, role)
        }.to change { CourseUsers.count}
      end
      it 'creates the correct relation' do
        course.add_user(user, role)
        expect(CourseUsers.first.user).to eq(user)
        expect(CourseUsers.first.course).to eq(course)
      end
    end
  end
end
