b = [ [1,2,3], [4,5,6], [7,8,9]]

b.each { |b0_index| p b0_index }

b.each { |bx| bx.each { |by| p "#{by} is b[#{b.index(bx)}][#{bx.index(by)}]" } }
