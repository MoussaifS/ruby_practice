require 'csv'
a = [ 'a' , 'sdsdsdsd']

def secret_word(words)
    selected_word = nil 
    while selected_word.nil? 
        selected_word = words[rand(0..words.length-1)]
        selected_word.length.between?(5,12) ? selected_word : selected_word = nil 
    end
    
     selected_word
end


words = File.read("hangman_words.csv").split("\n")
word = secret_word(words)
p word
# answer = Array.new(word.length , '_')
# p answer

def game (word)
    word = secret_word(word)
    wrong_letter = 0 #if 7 he loss 
    game = nil
    char = ''
    win = 0 
    answer = Array.new(word.length,'_')
    while game.nil?
        for i in (0 .. answer.length-1)
            print("#{answer[i]}")
        end
        
        loop do
            puts("\n enter only one letter")
            char = gets.chomp
            break if char.length == 1
        end
        p char
        p word[char]
        if word[char]
            answer[word.indexof?(char)] = char
            puts 'correct letter'
            win =+ 1
        else
            puts 'wrong answer'
        end
        
        if win == word.length
            game = false 
        end
    end
end

game(words)