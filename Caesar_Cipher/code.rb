
def caesar_cipher(text , shift)
    sentence = ''
    alphabites_downCase  = ("a".."z" ).to_a 
    alphabites_upCase  = ("A".."Z" ).to_a
    text.split('').each do |letter| 
    
    if ((alphabites_downCase +  alphabites_upCase).any?(letter))
        if alphabites_downCase.any?(letter)
            
            sentence.concat(alphabites_downCase[(alphabites_downCase.index(letter) + shift) % 26 ])
        else
            sentence.concat(alphabites_upCase[(alphabites_upCase.index(letter) + shift) % 26 ])
        end
    else 
        sentence.concat(letter) 
    end
    
  end
  sentence
end


 p caesar_cipher("What a string!", 5)