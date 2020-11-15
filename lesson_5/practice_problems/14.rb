hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |_produce, details|
  case details[:type]
  when 'fruit'
    details[:colors].map(&:capitalize)
  when 'vegetable'
    details[:size].upcase
  end
end.tap { |result| p result }

# There was no need to include the name of the first parameter, could have left
# it as _