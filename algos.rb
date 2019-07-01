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
puts '-' * 80

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
  points.map { |e| [sqrt((e[0]**2) + (e[1]**2)).round(3), e] }.sort.first(num)
end

puts '> Find the k points nearest to the origin (0,0) from a group:'
puts "  group: #{group}"
puts '  - k: 1 ' + get_k_points_nearest_origin(group, 1).to_s
puts '  - k: 2 ' + get_k_points_nearest_origin(group, 2).to_s
puts '  - k: 3 ' + get_k_points_nearest_origin(group, 3).to_s
puts '  - k: 4 ' + get_k_points_nearest_origin(group, 4).to_s
puts '-' * 80

#-------------------------------------------------------------------------------
# Check if a parenthesis expression is balanced. Classic.
# ex:
# exp1 = [{({([])})}] -> Balanced
# exp2 = [({{([({})])})] -> Unbalanced

exp1 = '[{({([])})}[{()}][{}]]' # balanced
exp2 = '[({{([({})])})({[]([])})]' # unbalanced

def check_balanced(exp)
  t = []
  exp.each_char{ |e|
    if (e == ')' && t[-1] == '(') || (e == ']' && t[-1] == '[') || (e == '}' && t[-1] == '{')
      t.pop
    else
      t.push(e)
    end
  }
  t.empty? ? 'balanced' : 'unbalanced'
end

puts '> Check if a parenthesis expression is balanced. Classic..'
puts exp1 + ' -> ' + check_balanced(exp1)
puts exp2 + ' -> ' + check_balanced(exp2)
puts '-' * 80
