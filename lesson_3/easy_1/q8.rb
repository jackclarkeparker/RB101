flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2,
                "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

p flintstones.select { |name, number| name == "Barney" }.to_a.flatten!

# Post-Solution

flintstones.assoc("Barney")
# Hash#assoc searches through the hash looking for a match between given object
# and key. Returns the matching key-value pair as a tuple or nil if no match is
# found.