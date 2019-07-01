require 'byebug'
include Math # use Math without Math.

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
puts '-'*46

#-------------------------------------------------------------------------------
# Find the k points nearest to the origin (0,0) from a group
# ex:
# group = [(1,1), (2,-3), (-1,2), (-4,5)]
# k = 1 -> (1,1)
# k = 2 -> [(1,1), (-1,2)]
# etc

group = [[1, -1], [2, 3], [-4, 5], [-7, 2], [9, -2], [3, -3], [5, 2],
         [3, 7], [-1, 4], [-3, 2], [-2, 2], [5, 3], [-3, 6], [-8, 6]]

def get_k_points_nearest_origin(points, num)
  points.map { |e| [sqrt((e[0]**2) + (e[1]**2)).round(3), e]}.sort.first(num)
end

puts '> Find the k points nearest to the origin (0,0) from a group:'
puts "  group: #{group}"
puts '  - k: 1 ' + get_k_points_nearest_origin(group, 1).to_s
puts '  - k: 2 ' + get_k_points_nearest_origin(group, 2).to_s
puts '  - k: 3 ' + get_k_points_nearest_origin(group, 3).to_s
puts '  - k: 4 ' + get_k_points_nearest_origin(group, 4).to_s

#-------------------------------------------------------------------------------