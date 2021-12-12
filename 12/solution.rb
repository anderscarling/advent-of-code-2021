CONNECTIONS = DATA.read.each_line.map { _1.strip.split("-") }.then { _1 + _1.map(&:reverse) }

def find_paths(&should_revisit)
  queue = []
  queue << ['start']

  found = []
  while path = queue.pop
    if path.last == 'end'
      found.push(path)
      next
    end

    CONNECTIONS
      .select { |a, b| a == path.last && (!path.include?(b) || should_revisit.call(b, path)) }
      .map    { |a, b| path.dup << b }
      .each   { queue << _1 }
  end

  found
end

# Part 1

paths_pt1 = find_paths { |cave, path| cave =~ /[[:upper:]]/ }
puts "Found #{paths_pt1.count} paths when revisiting no small caves"

# Part 2

paths_pt2 = find_paths do |cave, path|
   case cave
   when /[[:upper:]]/ then true
   when 'start', 'end' then false
   else path.select { _1 =~ /[[:lower:]]/ }.tally.values.max < 2
   end
end
puts "Found #{paths_pt2.count} paths when revisiting one small cave"

__END__
yw-MN
wn-XB
DG-dc
MN-wn
yw-DG
start-dc
start-ah
MN-start
fi-yw
XB-fi
wn-ah
MN-ah
MN-dc
end-yw
fi-end
th-fi
end-XB
dc-XB
yw-XN
wn-yw
dc-ah
MN-fi
wn-DG
