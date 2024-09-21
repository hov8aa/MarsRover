class Move
    DIRECTIONS = ['N','E','S','W'] #Clockwise directions

    def initialize(x, y, direction)
      @x, @y, @direction = x, y, direction
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

    def position
      [@x, @y, @direction]
    end
  end
  