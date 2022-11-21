def substrings(text, dictionary)
    result = Hash.new(0)
    lowered_text = text.downcase
  
    dictionary.each do |word|
       p word
       p matches = lowered_text.scan(word)
      result[word] = matches unless matches == 0
    end
  
    return result
  end
  
  dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
  
  p substrings("siit", dictionary)