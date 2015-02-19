require 'cell'

describe Cell do

	let(:cell){Cell.new}
	let(:ship){double :ship}

	it "can have content" do
		cell.content = ship
		expect(cell.content).to eq ship
	end

  it "can be shot" do
    cell.content = ship
    allow(ship).to receive(:hit)
    cell.shoot
    expect(cell).to be_hit
  end

  it "hits its content once shot" do
    cell.content = ship
    expect(ship).to receive(:hit)
    cell.shoot

  end
end