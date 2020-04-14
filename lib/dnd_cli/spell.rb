class Spell

  attr_accessor :index, :name, :description, :material

  @@all = []

  def initialize(name, index)
    @index = index
    @name = name
    @description = description
    @material = material
    @@all << self
  end

  def self.all
    @@all
  end

  # def name=(name)
  #   @name = name
  # end
  #
  # def name
  #   @name
  # end

end

#binding.pry
#spell_object = Spell.new('Acid Arrow', 'acid-arrow')
# spell_object.name

#binding.pry
