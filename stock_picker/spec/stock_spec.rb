require './code.rb'

describe 'result' do
  it 'return' do 
  expect(stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eql([1, 4])
  end
end
