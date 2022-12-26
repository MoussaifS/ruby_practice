def bubble_sort (array) 
    for i in 0..array.length - 1


        for x in i+1 .. array.length - 1
           
            temp = 0 
           if (array[i] > array[x])
                temp = array[i]
                array[i] = array[x]
                array[x] = temp  
           end
           
        end
        
    end 
    array
end
 