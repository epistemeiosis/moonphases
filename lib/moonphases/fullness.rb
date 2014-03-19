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
    "Phase: " + 
    if is_new?
      "New"
    elsif is_crescent?
      "#{display_direction} Crescent"
    elsif is_quarter?
      "#{display_direction} Quarter"
    elsif is_gibbous?
      "#{display_direction} Gibbous"
    else 
      "Full"
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
  
  def is_new?
    @percent <= 10
  end
  
  def is_crescent?
    @percent > 10 && @percent <= 45
  end
  
  def is_gibbous?
    @percent > 55 && @percent <= 90
  end
    
end
