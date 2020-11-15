flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
p flintstones.map.with_index { |name, index| [name, index] }.to_h

name_and_age = []
counter = 0
loop do
  break if counter == flintstones.size
  name_and_age << [flintstones[counter], counter]
  counter += 1
end
p name_and_age.to_h

=begin

# Solution

LS used each_with_index, intialized a hash, and used setter method to add each
pair to the hash.

I was wondering about how you add new pairs to a hash. It's true, you've just
gotta use setter methods.

flintstones[name] = index

I think that is the most clear way of writing the method, doesn't call to_h on
it, it's most consistent with the aim of the method.