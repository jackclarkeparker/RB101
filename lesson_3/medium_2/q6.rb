# How could the unnecessary duplication in this method be removed?

def color_valid(color)
  if color == "blue" || color == "green"
    true
  else
    false
  end
end

def color_valid(color)
  %w(blue green).include?(color)
end

=begin

# Post-Solution

I was wondering what duplication they meant. The first thing that I saw in this
method was that the conditional structure was unnecessary, expression used for
the condition already returns boolean objects. (The solution was just this; get
rid of controlflow structure)

I thought the duplication was in referencing color twice, so I also removed the
double citing of color.

As it turns out, the duplication the question was referencing was that the
method would give a boolean return value twice (once from evaluating the
boolean expression, and once from the explicit reference to a boolean object).
