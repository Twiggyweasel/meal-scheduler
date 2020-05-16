require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }
  describe 'associations' do
    it { should have_many(:user_recipes) }
    it { should have_many(:favorite_user_recipes).conditions(is_favorite: true) }
    it { should have_many(:kid_friendly_user_recipes).conditions(is_kid_friendly: true) }
    it { should have_many(:recipes).through(:user_recipes) }
    it { should have_many(:favorite_recipes).through(:favorite_user_recipes) }
    it { should have_many(:kid_friendly_recipes).through(:kid_friendly_user_recipes) }
  end
  describe 'validations' do
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:username).is_at_least(5).is_at_most(60) }
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(5).is_at_most(30) }
    it { should validate_presence_of(:default_servings) }
    it { should validate_inclusion_of(:default_servings).in_range(1..5) }
  end
end