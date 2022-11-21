def stock_picker(stockArray)
  low = stockArray[0]
  high = 0
  best_deal = []

  buy = []
  sell = []

  for i in 0..stockArray.length - 1
    low = stockArray[i] if low >= stockArray[i]
  end
  best_deal.push(low)
  for i in stockArray.index(low) + 1..stockArray.length - 1
    high = stockArray[i] if high <= stockArray[i]
  end
  best_deal.push(high)

  best_deal
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
