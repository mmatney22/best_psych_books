class MAPumpkinFarms::CLI

  def call 
    puts "\nWelcome to New England Fall Events!\n"
    get_farms
    list_farms
    get_user_farm
  end
  
  def get_farms
    @farms = MAPumpkinFarms::Farm.all             #sets variable to all array, containing farm objects
  end
  
  def list_farms
    puts "Choose a farm to see more information:"
    @farms.each.with_index(1) {|farm, index| puts "#{index}. #{farm.name}"}    #iterates over array, and lists farms
  end
  
  def get_user_farm
    chosen_farm = gets.strip.to_i
    list_info_for(chosen_farm) if valid_input?(chosen_farm, @farms)        #if valid input, show list of farms
  end
  
  def valid_input?(input, data)
    input.to_i <= data.length && input.to_i > 0        #change input to integar and check validity
  end
  
  def list_info_for(chosen_farm)
    farm = @farms[chosen_farm - 1] 
    farm.get_info                               #set variable to array item of @state, minus 1 for correct index
    puts "Here is info for #{farm.name}:"
    farm.info.each.with_index(1) do |info, index|       #go thru all farms and lists info
      puts "#{index}. #{info.name}"
    end
  end
  
end