class Robot
  
  attr_accessor :bearing, :coordinates

  def orient(direction)
    directions = [:east, :west, :north, :south]
    if directions.include? direction
      @bearing = direction
    else
      raise ArgumentError
    end
  end

  def turn_right
    case @bearing
      when :north
        @bearing = :east
      when :east
        @bearing = :south
      when :south
        @bearing = :west
      when :west
        @bearing = :north
    end
  end

  def turn_left
    case @bearing
      when :north
        @bearing = :west
      when :east
        @bearing = :north
      when :south
        @bearing = :east
      when :west
        @bearing = :south
    end
  end

  def at(x,y)
    @coordinates = [x,y]
  end

  def advance
    case @bearing
      when :north
        @coordinates[1]+=1
      when :east
        @coordinates[0]+=1
      when :south
        @coordinates[1]-=1
      when :west
        @coordinates[0]-=1
    end
  end

end

#[@east, @west, @north, @south]


class Simulator

  def instructions(instructions)
    array = []
    instructions.length.times do |i|
      case instructions[i]
        when 'L'
          array << :turn_left
        when 'R'
          array << :turn_right
        when 'A'
          array << :advance
      end
    end
    return array
  end

  def place( robot , **f)
    robot.coordinates=[f[:x],f[:y]]
    robot.bearing=f[:direction]
  end

  def evaluate(robot,letters)
    instructions(letters).each do |method_robot|
      robot.send(method_robot)
    end   
    #Not working to be finished
  end

end


