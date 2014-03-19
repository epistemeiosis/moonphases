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
      if @direction == "+"
        "Phase: Waxing Crescent"
      else 
        "Phase: Waning Crescent"
      end
    elsif @percent > 45 && @percent <= 55
      if @direction == "-"
        "Phase: Last Quarter"
      else 
        "Phase: First Quarter"
      end
    elsif @percent > 55 && @percent <= 90
      if @direction == "+"
        "Phase: Waxing Gibbous"
      else 
        "Phase: Waning Gibbous"
      end
    else 
      "Phase: Full"
    end
  end
  
end
