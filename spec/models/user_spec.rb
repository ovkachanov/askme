require 'rails_helper'

describe User do
  let(:user) { build(:user) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should validate_uniqueness_of :username }
  it { should have_many(:questions) }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end
end
