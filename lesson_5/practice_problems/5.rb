munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}


total_age = 0
munsters.each do |_member, details|
  total_age += details['age'] if details['gender'] == 'male'
end

puts total_age

# I wasn't sure if I needed to do some snazzy selection for this one. LS
# solution was all the same with exception of their use of each_value to access
# the details hash, rather than each and defining the dead _member parameter.