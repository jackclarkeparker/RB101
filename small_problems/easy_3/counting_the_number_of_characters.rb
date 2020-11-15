print "\nPlease write word or multiple words: "
input = gets.chomp
characters = input.delete(" ").length
puts "\nThere are #{characters} characters in \"#{input}\"."
