module Sequences
  def self.fromtoby(from, to, by)
    x = from
    while x <= to
      yield x
      x += by
    end
  end
end

Sequences.fromtoby(1, 10, 2) { |x| print x }
