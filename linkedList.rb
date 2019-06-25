require 'byebug'
# ------------------------------------------------------------------------------

# Definition:
# [ 1 | next ] -> [ 2 | next ] -> [ 3 | nil ]
#     (head)   ...  ("body")  ...   (tail)
# ------------------------------------------------------------------------------

# Linked List Node Element
class Node
  attr_accessor :data, :next

  def initialize(data)
    self.data = data
    self.next = nil # <- redundant but clear, it's nil if unitilized
  end
end

# Linked List Class
class LinkedList
  attr_accessor :head, :tail, :size

  def initialize
    self.head = nil
    self.tail = nil
    self.size = 0
  end

  def insert(data)
    n = Node.new(data)
    if head
      self.tail.next = n
    else
      self.head = n
    end
    self.tail = n
    self.size += 1
  end

  def delete(data)
    return nil unless self.head
    n = self.head
    if (r = found(n, data))
      self.head = n.next
    else
      n = n.next until n.next.nil? || (r = found(n.next, data))
      n.next = n.next.next if r
    end
    self.tail = n unless n.next || !r
    self.tail = nil unless self.head
    self.size -= 1 if r
  end

  def print
    n = head
    r = ''
    until n.nil? do
      r += n.data + ' > '
      n = n.next
    end
    puts r + '|'
  end

  # -- helpers --
  def found(node, data)
    node.data == data
  end



end



list = LinkedList.new
list.insert 'mosca'
list.insert 'mosca2'
list.insert 'mosca3'

# r = list.delete ''
# puts 'result: ' + r.inspect

byebug


puts '--- test ended'