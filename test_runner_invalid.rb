require "roman-numerals"

require_relative "roman_numerals_transducer.rb"

valid_romans = (1..3999).map { |i| RomanNumerals.to_roman(i) }.to_set
transducer = RomanNumeralTransducer.new("")

symbols = ["I", "V", "X", "L", "C", "D", "M"]
invalid_accepted = []

(1..5).each do |length|
  symbols.repeated_permutation(length).each do |combo|
    word = combo.join("")
    
    # Skip if it's a valid Roman numeral
    next if valid_romans.include?(word)
    
    transducer.set_word(word)
    result = transducer.start()

    if result != nil
      invalid_accepted.push(word)
    end
  end
end

puts("Found #{invalid_accepted.size()} invalid words accepted#{":" if invalid_accepted.size > 0}")
puts(invalid_accepted.join(", "))
