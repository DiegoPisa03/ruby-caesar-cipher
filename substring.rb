def substrings(string, dictionary)
  string.downcase!
  dictionary.reduce(Hash.new(0)) do |result, word|
    result[word] = string.scan(word).count if string.include?(word)
    # string.scan(word) : Busca todas las ocurrencias de la palabra en el string
    result
  end
end

puts substrings("Howdy partner, sit down! How's it going?", ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"])

