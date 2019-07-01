require 'byebug'

# ------------------------------------------------------------------------------
# structure:
#  nil < [prev|head|next] < [prev|body|next] > [prev|tail|next] > nil
# ------------------------------------------------------------------------------

class Node
  attr_accessor :prev, :next, :data

  def initialize(data)
    self.data = data
  end
end

class DoubleList

  # inserts a node
  def insert(data)

  end

  # deletes a node

end

# Despertar con los Chemicals acaba de ser terrible y bonito.
# Te despierta la música sintiendo que todo va mal y subiendo desde el ensueño
# Despiertas y la música dice: muévete, sin saber qué.
# Ves qué y la regadera es lejos del escolofrío del recuerdo.
# regresas calientito y estás listo para puchar pinches «replay»