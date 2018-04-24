require 'rails_helper'

describe Question do
  it { should validate_presence_of :question }

  it { should have_many :responses }
  it { should belong_to :user }
end
