require 'rails_helper'

describe Question do
  let(:question) { create(:question) }

  it { should validate_presence_of :text }
  it { should validate_presence_of :user }
  it { should validate_length_of :text }
  it { should belong_to(:user) }

  it "is valid with valid attributes" do
    expect(question).to be_valid
  end
end
