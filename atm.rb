# def withdraw(amount)
#   if amount <= 0
#     false
#   elsif amount%5 == 0
#     twenties = Array.new(amount/20, 20)
#     tens = Array.new(amount%20/10, 10)
#     fives = Array.new(amount%20%10/5, 5)
#     twenties + tens + fives
#   else
#     false
#   end
# end


# def withdraw(amount)
#   if amount <= 0
#     false
#   elsif amount%5 == 0
#     initi = amount
#     notes = [100, 20, 10, 5]
#     result = [0]
#     notes.each do |n| 
#       amount = initi - result.reduce(:+)
#       if amount > 0
#       result = result + Array.new(amount/n,n)
#       end
#     end 
#     result - [0]   
#   else
#     false
#   end
# end

# denominations = [100, 20, 10, 5]
#result += Array.new((amount - result.reduce(:+))/n,n)
    #result - [0]


def withdraw(amount)
  notes = [100, 20, 10, 5]
  return false if amount <= 0 || amount % 5 != 0
  result = []
  notes.each do |n|
    while(amount - n >= 0) do
      result << n
      amount = amount - n
    end
  end
  result
end




# import required testing libraries
require 'minitest/spec'
require 'minitest/autorun'

# BELOW ARE THE TESTS FOR AUTOMATICALLY CHECKING YOUR SOLUTION.
# THESE TESTS ARE FOR STEP 1.
# THESE NEED TO BE REPLACED AFTER EACH STEP.
describe 'atm' do
  [
    [-1, false],
    [0, false],
    [7, false],
    [53, false],
    [35, [20, 10, 5]],
    [40, [20, 20]],
    [65, [20, 20, 20, 5]],
    [70, [20, 20, 20, 10]],
    [75, [20, 20, 20, 10, 5]],
    [175, [100,20, 20, 20, 10, 5]]
  ].each do |input, expected|
    it "should return #{expected} when $#{input} is withdrawn" do
      withdraw(input).must_equal expected
    end
  end
end