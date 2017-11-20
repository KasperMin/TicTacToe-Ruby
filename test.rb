
x = { :one => 'p', :two => 2}
y = { :one => 'h', :three => 3}
i = 0

while i < y.length

  if y.has_key? y.keys[i]
    puts y.keys[i]
  end

  i += 1
end

def squares_to_symbol
  squares = (1..9).to_a
  squares.collect { |e| e.to_s.to_sym }
end
