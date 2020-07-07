numbers = 1234
numbers           .tap { |x| p x }
.to_s             .tap { |x| p x }
.split("")        .tap { |x| p x }
.map(&:to_i)      .tap { |x| p x }
.select(&:even?)  .tap { |x| p x }