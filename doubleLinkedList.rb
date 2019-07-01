require 'byebug'

# ------------------------------------------------------------------------------
# structure:
#  nil < [prev|head|next] < [prev|body|next] > [prev|tail|next] > nil
# ------------------------------------------------------------------------------

# Node class
class Node
  attr_accessor :prev, :next, :data

  def initialize(data)
    self.data = data
  end
end

# Double Linked List class
class DoubleList
  # inserts a node
  def insert(data); end

  # deletes a node
end
