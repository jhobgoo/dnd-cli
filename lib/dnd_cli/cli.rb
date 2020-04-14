class CLI

  def start
    self.welcome
    API.get_spells
    self.display_spells
    self.select_spell
  end

  def welcome
    puts "Greetings adventurer! My name is Zed, and I most humbly welcome you to Zed's Magnificent Goods!\n\n"
    sleep(3)
    puts "Now, don't be shy... Come! Are you in need of a new spell? Rest a moment, and allow me to fetch my most current spell offerings...\n\n"
    sleep(3)
    puts "."
    sleep(1)
    puts ".."
    sleep(1)
    puts "..."
    sleep(1)
    puts "Aha! Here it is! Please, have a look for yourself!\n\n"
    sleep(3)
  end

  def display_spells
    Spell.all.each.with_index(1) do |spell_object, index|
      puts "(#{index})" + " " + "#{spell_object.name}"
    end
#    binding.pry
  end

  def select_spell
    puts "[Enter the corresponding (number) of the spell for which you would like Zed to give you more information, or you may type exit to leave Zed's shop!]"
    puts ">"

    user_input = gets.to_s

      if user_input.include? "exit"
        puts "Of course, of course! Zed humbly thanks you for visiting his spell shop. Safe travels, adventurer!"
        exit
      elsif !self.valid_input?(user_input)
        puts "I deeply apologize adventurer, but it appears that spell is not on my list. Come, let me tell you about another spell on my list instead:\n\n"
        sleep(4)
        self.select_spell
      else
        spell_object = Spell.all[user_input.to_i - 1]
        API.get_descriptions(spell_object)
      end

    puts "Ahhh yes, #{spell_object.name} is it? A formidable spell in the hands of the right weilder, yes... Here's what I know about this spell:\n\n"
      spell_object.description.each do |element|
        puts "#{element}\n"
      end

      if spell_object.material != nil
        puts "To cast this spell requires #{spell_object.material.downcase}\n\n"
      end

    sleep(12) ##sleep timer to allow for reading of spell_description output before looping back to self.select_spell
    self.select_spell
  end

  def valid_input?(user_input)
    user_input.to_i.between?(1, 319) || user_input == ('exit')
  end

end

  # def select_spell
  #   puts "[Enter the corresponding (number) of the spell for which you would like Zed to give you more information, or you may type exit to leave Zed's shop!]"
  #   puts ">"
  #
  #   user_input = gets.strip.to_i
  #   spell_object = Spell.all[user_input - 1]
  #
  #     if self.valid_input?(user_input) == 'exit'
  #       puts "Of course, of course! Zed humbly thanks you for visiting his spell shop. Safe travels, adventurer!"
  #       exit
  #     elsif !self.valid_input?(user_input)
  #       puts "I deeply apologize adventurer, but it appears that spell is not on my list. Come, let me tell you about another spell on my list instead:\n\n"
  #       sleep(4)
  #       self.select_spell
  #     else
  #       API.get_descriptions(spell_object)
  #     end
  #
  #   puts "Ahhh yes, #{spell_object.name} is it? A formidable spell in the hands of the right weilder, yes... Here's what I know about this spell:\n\n"
  #     spell_object.description.each do |element|
  #       puts "#{element}\n"
  #     end
  #
  #     if spell_object.material != nil
  #       puts "To cast this spell requires #{spell_object.material.downcase}\n\n"
  #     end
  #
  #   sleep(12) ##sleep timer to allow for reading of spell_description output before looping back to self.select_spell
  #
  #   self.select_spell
  #
  # end
