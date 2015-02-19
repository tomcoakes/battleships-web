require 'board'

describe Board do
  let(:cell){double :cell, content: :water}
  let(:cell_class){double :cell_class, :new => cell }
  let(:board){Board.new({size: 10, content: cell_class})}
  let(:ship){double :ship, size: 2, sunk?: false}
  let(:sunk_ship){double :ship, size: 2, sunk?: true}
  let(:small_ship){double :ship, size: 1}
  let(:second_cell){double :cell, content: ship}

	it 'has a grid of 100' do
		expect(board.grid.count).to eq 100
	end

  it "can place a ship" do
    first_cell = double :cell
    board.grid[:A1] = first_cell
    expect(board.grid[:A1]).to receive(:content=).with small_ship
    board.place(small_ship, :A1)
  end

  it "can place a 2 cell ship horizontally" do
    allow(cell).to receive(:content=)
    board.grid[:A2] = second_cell
    expect(board.grid[:A2]).to receive(:content=).with ship
    board.place(ship,:A1,:horizontally)
  end

  it "can place a 2 cell ship vertically" do
    allow(cell).to receive(:content=)
    board.grid[:B1] = second_cell
    expect(board.grid[:B1]).to receive(:content=).with ship
    board.place(ship, :B1, :vertically)
  end

  it "should be able to get all the coordiantes for a size and direction" do
    expect(board.get_coordinates(:A1, 3, :horizontally)).to eq [:A1, :A2, :A3]
  end

  it "should be able to get all the coordiantes for a direction vertically" do
    expect(board.get_coordinates(:A1, 3, :vertically)).to eq [:A1, :B1, :C1]
  end

  it "can hit a cell" do
    allow(second_cell).to receive(:hit?).and_return false
    board.grid[:A1] = second_cell
    expect(second_cell).to receive(:shoot)
    board.shoot_at(:A1)
  end

  it "can't hit the same cell twice" do
    allow(second_cell).to receive(:hit?).and_return true
    board.grid[:A1] = second_cell
    expect{board.shoot_at(:A1)}.to raise_error "You can't hit the same cell twice"
  end

  it "can know its floating ships" do
    board.grid[:A1] = second_cell
    expect(board.floating_ships?).to eq true
  end

  it "can know its floating ships" do
    allow(second_cell).to receive(:content).and_return(sunk_ship)
    board.grid[:A1] = second_cell
    expect(board.floating_ships?).to eq false
  end


end