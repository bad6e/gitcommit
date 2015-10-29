require 'rails_helper'

RSpec.describe Stat, type: :model do
  stat = Stat.new(name: "Bret Doucette",
                  commits: 100,
                  streaks: 22,
                  current_streaks: 7)

  it "is valid" do
    expect(stat).to be_valid
  end

  it "is invalid without a name" do
    stat.name = nil
    expect(stat).to_not be_valid
  end

  it "is invalid with negative commits" do
    stat.commits = -100
    expect(stat).to_not be_valid
  end

  it "is invalid with negative streaks" do
    stat.streaks = -100
    expect(stat).to_not be_valid
  end

  it "is invalid with negative current_streaks" do
    stat.current_streaks = -100
    expect(stat).to_not be_valid
  end
end
