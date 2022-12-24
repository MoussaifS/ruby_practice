# require 'erb'

# meaning_of_life = 42

# question = "The Answer to the Ultimate Question of Life, the Universe, and Everything is <%= meaning_of_life + 5 %>"
# template = ERB.new question

# results = template.result(binding)
# puts results





def phone_number(number)
    if number.length < 10 || (number.length == 11 && number[0] != 1) || number.length > 11
      "check the number online"
    elsif number.length == 11
      number[1..10]
    else
      number
    end
end

p phone_number('123456789011')