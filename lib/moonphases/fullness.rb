class Fullness
  def initialize( percent, direction )
    @percent = percent
    @direction = direction
  end
  
  def getPercent
    @percent
  end
  
  def getDirection
    @direction
  end
  
  def to_s
    if @percent <= 10
      "Phase: New"
    elsif @percent > 10 && @percent <= 45
      "Phase: #{display_direction} Crescent"
    elsif is_quarter?
      "Phase: #{display_direction} Quarter"
    elsif @percent > 55 && @percent <= 90
      "Phase: #{display_direction} Gibbous"
    else 
      "Phase: Full"
    end
  end
  
  def display_direction
    if @direction == "+"
      is_quarter? ? "First" : "Waxing"
    else
      is_quarter? ? "Third" : "Waning"
    end
  end
    
  def is_quarter?
    @percent > 45 && @percent <= 55
  end
    
end
