require 'rails_helper'

RSpec.describe Course, type: :model do

  describe '::add_professors' do
    context 'when the user to add not is in student list' do
      let!(:course) { create(:course) }
      let!(:user){ create(:user) }
      it 'creates the relation CourseProfessor' do
        expect{
          course.add_professors([user])
        }.to change { CourseProfessor.count}
      end
      it 'creates the correct relation' do
        course.add_professors([user])
        expect(CourseProfessor.first.user).to eq(user)
        expect(CourseProfessor.first.course).to eq(course)
      end
    end
    context 'when the user to add is in student list' do
      let!(:course) { create(:course) }
      let!(:user){ create(:user) }
      before do
        CourseStudent.create(user: user, course: course)
      end
      it 'does not create the relation CourseProfessor' do
        expect{
          course.add_professors([user])
        }.not_to change { CourseProfessor.count}
      end
    end
  end

  describe '::add_students' do
    context 'when the user to add not is in professor list' do
      let!(:course) { create(:course) }
      let!(:user){ create(:user) }
      it 'creates the relation CourseStudent' do
        expect{
          course.add_students([user])
        }.to change { CourseStudent.count}
      end
      it 'creates the correct relation' do
        course.add_students([user])
        expect(CourseStudent.first.user).to eq(user)
        expect(CourseStudent.first.course).to eq(course)
      end
    end
    context 'when the user to add is in student list' do
      let!(:course) { create(:course) }
      let!(:user){ create(:user) }
      before do
        CourseProfessor.create(user: user, course: course)
      end
      it 'does not create the relation CourseProfessor' do
        expect{
          course.add_students([user])
        }.not_to change { CourseStudent.count}
      end
    end
  end
end
