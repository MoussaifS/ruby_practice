require "./bubble.rb"
describe "alg" do 
    it "bubble sort" do 
        expect(bubble_sort([4,3,78,2,0,2])).to eql([0,2,2,3,4,78])
    end
end




 