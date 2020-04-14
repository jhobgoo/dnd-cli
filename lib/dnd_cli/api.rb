class API

  URL = 'http://dnd5eapi.co/api/spells'
  spell_object = ''

  def self.get_spells
    api_response = HTTParty.get(URL)
    api_response['results'].map do |hash|
      Spell.new(hash['name'], hash['index'])
    end
#    binding.pry
  end

  def self.get_descriptions(spell_object)
    api_response = HTTParty.get(URL + "/#{spell_object.index}")
    spell_object.description = api_response['desc']
    spell_object.material = api_response['material']
#      binding.pry
  end

end
