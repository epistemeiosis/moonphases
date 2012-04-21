require 'date'

class MoonData
  def initialize( nasaDataLines )
    @dataPoints = Array.new

    # Read the year first, we'll need it in a minute to make Date objects.    
    @year = nasaDataLines[0][/-?\d+/].to_i
    # Parse out all the dates
    nasaDataLines.each do |dataLine|
      dataLine.scan( /([A-Za-z]{3}\s+\d+\s+\d+:\d+\s+)/ ).each do |date|
        @dataPoints << parseDate( date[0] )
      end
    end
  end
  
  def getNumDataPoints
    @dataPoints.length
  end
  
  def getDataPoint( index )
    @dataPoints[ index ]
  end
  
  def getYear
    @year
  end
  
  def parseDate( dateString )
    parsed = dateString.scan(/([A-Za-z]{3})\s+(\d+)\s+(\d+:\d+)/)
    Date.new( @year, getMonth( parsed[0][0] ), parsed[0][1].to_i )
  end
  
  def getMonth( monthString )
    lowerCase = monthString.downcase
    if "jan".eql? lowerCase
      return 1
    elsif "feb".eql? lowerCase
      return 2
    elsif "mar".eql? lowerCase
      return 3
    elsif "apr".eql? lowerCase
      return 4
    elsif "may".eql? lowerCase
      return 5
    elsif "jun".eql? lowerCase
      return 6
    elsif "jul".eql? lowerCase
      return 7
    elsif "aug".eql? lowerCase
      return 8
    elsif "sep".eql? lowerCase
      return 9
    elsif "oct".eql? lowerCase
      return 10
    elsif "nov".eql? lowerCase
      return 11
    elsif "dec".eql? lowerCase
      return 12
    end
  end
end