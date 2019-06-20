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
    self.next = nil # <- redundant but clear, tt's nil if unitilized
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

  def insert data
    n = Node.new(data)
    if self.head
      self.tail.next = n
    else
      self.head = n
    end
    self.tail = n
    self.size += 1
  end

  def delete data
    return nil unless data
    return unless self.size > 0
    n = head
    # address for found in head
    if (found(data, n) & n.next.nil?)
      self.head = nil
      self.tail = nil
      self.size -= 1 # <- refact
    else
      self.head = head.next
      self.size -= 1 # <- refact
    end
    # adreess for found in "body"

    # address for found tail
  end

  def print
    n = self.head
    r = ''
    until n.nil? do
      r += n.data + ' > '
      n = n.next
    end
    puts r + '|'
  end

  # -- helpers --
  def found(data, node)
    data == node.data
  end



end



list = LinkedList.new

byebug

puts '--- test ended'