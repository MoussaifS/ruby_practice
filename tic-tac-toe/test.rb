# a = [[1], [1, 2], [3, 3], [0, 0], [0, 1], [0, 2], [0, 2], [1, 2], [2, 5]]
# b = [[111 , 33,45] , [] , ['d' , ',w' , '3']]

# a = Array.new(3, Array.new(3 , 2))
# p a[1][1]

# for i in 0..2
#   print "|"
#   for x in 0..2
#     print "#{b[i][x]}|"
#   end
#   print"\n"
#   puts"-----------"
# end
 




# win = [
#   [[0, 0], [0, 1], [0, 2]],
#   [[1, 0], [1, 1], [1, 2]],
#   [[2, 0], [2, 1], [2, 2]],

#   [[0, 0], [1, 0], [2, 0]],
#   [[0, 1], [1, 1], [2, 1]],

#   [[0, 2], [1, 1], [2, 1]]
# ]
# # p win[2].index(a.pop)


# # win.each do |index|
# #   if (index & a).length == 3
# #     p 'winner'
# #     p a
# #   end
# # end


loop do 
    round = 0
    p "#{round}"
    round =+ 1
    break if round == 10
end



a = [] 

a.push([4,3])
a.push([2,1])

p a.pop[1] 