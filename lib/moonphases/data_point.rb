require 'date'

class DataPoint
  def initialize( date, fullness )
    @date = date
    @fullness = fullness
  end
  
  def getDate
    @date
  end
  
  def getFullness
    @fullness
  end
end


