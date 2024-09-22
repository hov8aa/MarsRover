class Move
    DIRECTIONS = ['N','E','S','W'] #Clockwise directions

#    def initialize(x, y, direction)
#      @x, @y, @direction = x, y, direction
#    end

    def initialize(x, y, direction)
        @x = x
        @y = y
        if DIRECTIONS.include?(direction)
          @direction = direction
        else
          raise ArgumentError, "Invalid direction: #{direction}. Must be one of #{DIRECTIONS.join(', ')}"
        end
      end
    

    
    def run_commands(commands)
      # Logic to execute commands (L, M, R) and update position
        commands.each_char do |command|
            case command
                when 'L'
                    turn_left
                when 'R'
                    turn_right
                when 'M'
                    mover
                end
            end
    end
  
# Turn left (counter clockwise)
    def turn_left
        current_index = DIRECTIONS.index(@direction)
        @direction = DIRECTIONS[(current_index-1) % 4] # Move left in the array
    end

# Turn right ( clockwise)
    def turn_right
        current_index = DIRECTIONS.index(@direction)
        @direction = DIRECTIONS[(current_index+1) % 4] # Move right in the array
    end

#Move forward in the current direction
    def mover
        case @direction
        when 'N'
            @y +=1
        when 'S'
            @y -=1
        when 'E'
            @x +=1
        when 'W'
            @x -=1
        end
    end

# Public method to display the rover's final position and direction
def display_position
    puts "#{@x} #{@y} #{@direction}"
    puts "thank you for playing"
end

end

#Input and out section
def get_user_input

    #Get the upper-right plateau coordinates (we are not using them in this example)
    puts "Enter the upper-right coordinagtes of the plateau (e.g., 5 5)"
    plateau_size = gets.chomp

    #Get initial rover position
    puts "Enter the rover's initial position and direction (e.g., 1 2 N)"
    initial_position = gets.chomp.split
    x = initial_position[0].to_i
    y = initial_position[1].to_i
    direction = initial_position[2]

    #Create a Move instance
    move = Move.new(x,y,direction)

    # Get the movement instructions
    puts "Enter the movement instructions (e.g., LMLMLMLMM)"
    commands = gets.chomp

    #Run the commands
    move.run_commands(commands)

    #Display final position and direction
    move.display_position
end    

# Call the method to get input and run the rover
get_user_input
  