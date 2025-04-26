require File.expand_path(File.dirname(__FILE__) + '/neo')

# You need to write the triangle method in the file 'triangle.rb'
require './triangle'
# triangle.rb
class TriangleError < StandardError
end

def triangle(a, b, c)
  # Сортируем стороны для удобства проверки
  sides = [a, b, c].sort
  
  # Проверка на невалидный треугольник
  if sides.any? { |side| side <= 0 } || sides[0] + sides[1] <= sides[2]
    raise TriangleError
  end

  # Определяем тип треугольника
  if a == b && b == c
    :equilateral  # Все стороны равны
  elsif a == b || b == c || a == c
    :isosceles    # Две стороны равны
  else
    :scalene      # Все стороны разные
  end
end

class AboutTriangleProject < Neo::Koan
  def test_equilateral_triangles_have_equal_sides
    assert_equal :equilateral, triangle(2, 2, 2)
    assert_equal :equilateral, triangle(10, 10, 10)
  end

  def test_isosceles_triangles_have_exactly_two_sides_equal
    assert_equal :isosceles, triangle(3, 4, 4)
    assert_equal :isosceles, triangle(4, 3, 4)
    assert_equal :isosceles, triangle(4, 4, 3)
    assert_equal :isosceles, triangle(10, 10, 2)
  end

  def test_scalene_triangles_have_no_equal_sides
    assert_equal :scalene, triangle(3, 4, 5)
    assert_equal :scalene, triangle(10, 11, 12)
    assert_equal :scalene, triangle(5, 4, 2)
  end
end
