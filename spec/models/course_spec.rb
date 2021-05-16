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
    # ----------------
    context 'when the user exists in the course' do
      before do 
        create(:course_users, course_id: course.id, user_id: user.id, role_id: role.id) 
      end
      # ESTE TEST NO VA ACA
      it 'not creates the resource' do
        expect(course.add_user(user, role)).to_not be_valid
        #expect {course.add_user(user, role)}.to  raise_error(ActiveRecord::RecordInvalid,'This user is already in this course.')
      end
    end
  end
end
