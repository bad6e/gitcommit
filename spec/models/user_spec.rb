require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(nickname: "Bret Doucette",
                  uid: 100,
                  token: 22)

  it "is valid" do
    expect(user).to be_valid
  end
end
