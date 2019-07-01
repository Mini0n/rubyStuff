require 'byebug'

#-------------------------------------------------------------------------------
# Find the most repeated k numbers of a group
# ex:
# group = [1,1,1,1,2,2,2,3,3,4]
# k = 1 -> 1 w/ 4 repetitions
# k = 2 -> [ (1,4), (2,3) ]
# k = 3 -> [ (1,4), (2,3), (3,2) ]
# etc

group = [1, 1, 1, 1, 2, 3, 3, 3, 3, 4, 4, 4, 5, 5, 6]

def get_most_k_reps(group, num)
  group.group_by(&:itself).sort_by { |_, v| -v.length }.first(num)
       .map { |a, b| [a, b.length] }
end

puts '> Find the most repeated k numbers of a group:'
puts "  group: #{group}"
puts '  - k: 1 ' + get_most_k_reps(group, 1).to_s
puts '  - k: 2 ' + get_most_k_reps(group, 2).to_s
puts '  - k: 3 ' + get_most_k_reps(group, 3).to_s
puts '  - k: 4 ' + get_most_k_reps(group, 4).to_s
puts '  - k: 5 ' + get_most_k_reps(group, 5).to_s

#-------------------------------------------------------------------------------