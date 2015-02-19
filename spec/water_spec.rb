require 'water'

describe Water do
  it "can be hit" do
    expect(Water.new.hit).to eq "splash"
  end
end