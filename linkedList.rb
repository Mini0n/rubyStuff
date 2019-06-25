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

  # insert a new node with the given data
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

  # delete the 1st found element with the given data
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

  # returns a new LinkedList with the elems: self + list
  def cat(list)
    r = self.dup
    r.tail.next = list.head
    r.tail = list.tail
    r.size += list.size
    r
  end

  # returns the 1st node found with the data searched
  def find(data)
    n = self.head
    n = n.next until n.nil? || (r = found(n, data))
    return n if r
  end

  # clear list
  def clear
    delete self.head.data while self.head
  end

  # goes through list and yields each element
  def each
    return nil unless block_given?
    n = self.head
    while n
      yield n
      n = n.next
    end
  end

  # prints the list
  def print
    return '[empty]' unless self.head
    r = '| '
    each { |el| r += el.data + ' | ' }
    r
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

list2 = LinkedList.new
list2.insert 'mosca4'
list2.insert 'mosca5'

list3 = list.cat list2
list3.print

byebug


puts '--- test ended'