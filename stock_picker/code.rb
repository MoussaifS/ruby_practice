def stock_picker(stockArray)
  low = stockArray[0]
  high = 0
  best_deal = []
  profit = 0
  buy = []
  sell = []

  for i in 0..stockArray.length - 1

    if low >= stockArray[i]
      low = stockArray[i]
      for x in stockArray[i] + 1..stockArray.length - 1
        if(high <= stockArray[x])
        high = stockArray[x]
        if(low + high > profit)
          p profit = low + high
          best_deal.push(stockArray.index(low))
          best_deal.push(stockArray.index(high))
        end 
      end
    end
  end
  end
  best_deal
end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
