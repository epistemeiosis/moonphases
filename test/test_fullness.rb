require 'test/unit'
require 'moonphases'
require 'date'
require 'pathname'

class FullnessTest < Test::Unit::TestCase
 
  def test_fullness_to_s
   fullness = Fullness.new(99, "+")
   assert_equal "Phase: Full", fullness.to_s 
  end
  
  def test_fullness_newmoon
    fullness = Fullness.new(1, "-")
    assert_equal "Phase: New", fullness.to_s 
  end
  
  def test_fullness_first_quarter
    fullness = Fullness.new(50, "+")
    assert_equal "Phase: First Quarter", fullness.to_s
  end
  
  def test_fullness_third_quarter
    fullness = Fullness.new(50, "-")
    assert_equal "Phase: Third Quarter", fullness.to_s
  end
  
  def test_fullness_waxing_crescent
    fullness = Fullness.new(15, "+")
    assert_equal "Phase: Waxing Crescent", fullness.to_s
  end
  
  def test_fullness_waning_crescent
    fullness = Fullness.new(15, "-")
    assert_equal "Phase: Waning Crescent", fullness.to_s
  end
  
  def test_fullness_waxing_gibbous
    fullness = Fullness.new(76, "+")
    assert_equal "Phase: Waxing Gibbous", fullness.to_s
  end
  
  def test_fullness_waning_gibbous
    fullness = Fullness.new(76, "-")
    assert_equal "Phase: Waning Gibbous", fullness.to_s
  end
  
  def test_fullness_large_crescent_not_quarter
    fullness = Fullness.new(42, "+")
    assert_equal "Phase: Waxing Crescent", fullness.to_s
    fullness = Fullness.new(42, "-")
    assert_equal "Phase: Waning Crescent", fullness.to_s
  end
  
  def test_fullness_small_gibbous_not_quarter
    fullness = Fullness.new(56, "+")
    assert_equal "Phase: Waxing Gibbous", fullness.to_s
    fullness = Fullness.new(56, "-")
    assert_equal "Phase: Waning Gibbous", fullness.to_s
  end
 
  def test_fullness_display_direction
    fullness = Fullness.new(37, "+")
    assert_equal "Waxing", fullness.display_direction
    fullness = Fullness.new(37, "-")
    assert_equal "Waning", fullness.display_direction
  end
  
  def test_fullness_is_quarter
    fullness = Fullness.new(50, "+")
    assert_equal true, fullness.is_quarter?
    fullness = Fullness.new(50, "-")
    assert_equal true, fullness.is_quarter?
    fullness = Fullness.new(44, "+")
    assert_equal false, fullness.is_quarter?
  end
  
  def test_fullness_display_direction_with_quarters
    fullness = Fullness.new(50, "+")
    assert_equal "First", fullness.display_direction
    fullness = Fullness.new(50, "-")
    assert_equal "Third", fullness.display_direction
  end
  
   def test_fullness_is_new
    fullness = Fullness.new(5, "+")
    assert_equal true, fullness.is_new?
    fullness = Fullness.new(5, "-")
    assert_equal true, fullness.is_new?
    fullness = Fullness.new(12, "+")
    assert_equal false, fullness.is_new?
   end
   
  def test_fullness_is_crescent
    fullness = Fullness.new(30, "+")
    assert_equal true, fullness.is_crescent?
    fullness = Fullness.new(30, "-")
    assert_equal true, fullness.is_crescent?
    fullness = Fullness.new(3, "+")
    assert_equal false, fullness.is_crescent?
  end   

  def test_fullness_is_gibbous
    fullness = Fullness.new(60, "+")
    assert_equal true, fullness.is_gibbous?
    fullness = Fullness.new(60, "-")
    assert_equal true, fullness.is_gibbous?
    fullness = Fullness.new(3, "+")
    assert_equal false, fullness.is_gibbous?
  end  
end
