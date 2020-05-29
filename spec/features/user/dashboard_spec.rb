require 'rails_helper'

RSpec.describe 'User Dashboard Index' do
  describe 'As a logged in user' do
    describe 'I can see dashboard' do
      before(:each) do
        @user = create(:user)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

        visit '/user'
      end

        it 'I can see edit profile button and it routes to correct page' do

          click_link "Edit Profile"

          expect(current_path).to eq("/user/#{@user.id}/edit")
        end

        it 'I can see new trip button and it routes to correct page' do

          click_link "New Trip"

          expect(current_path).to eq("/user/trips/new")
        end

        it 'I can see upcoming trips button and it routes to correct page' do

          click_link "Upcoming Trips"

          expect(current_path).to eq("/user/upcoming_trips")
        end

        it 'I can see past trips button and it routes to correct page' do

          click_link "Past Trips"

          expect(current_path).to eq("/user/past_trips")
        end
      end
    end
  end
