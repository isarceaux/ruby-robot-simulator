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



end

