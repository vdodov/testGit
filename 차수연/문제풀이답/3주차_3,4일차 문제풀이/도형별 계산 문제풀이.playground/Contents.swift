
import Foundation

// Square, Circle, Sphere, Cone
// 위 4개 도형에 대한 예제


/***************************************************
 Square
 ***************************************************/

class Square {
  let dimension: Int
  var area: Int {
    return dimension * dimension
  }
  var perimeter: Int {
    return 4 * dimension
  }
  
  init(dimension: Int) {
    self.dimension = dimension
  }
}

let square = Square(dimension: 5)
square.area
square.perimeter



/***************************************************
 Circle
 ***************************************************/

class Circle {
  let radius: Double
  var area: Double {
    return .pi * radius * radius
  }
  var circumference: Double {
    return 2 * .pi * radius
  }
  init(radius: Double) {
    self.radius = radius
  }
}

let circle = Circle(radius: 6)
circle.area
circle.circumference


/***************************************************
 Sphere
 ***************************************************/

class Sphere {
  let radius: Double
  var volume: Double {
    return pow(radius, 3) * .pi * 4 / 3
  }
  init(radius: Double) {
    self.radius = radius
  }
}

let sphere = Sphere(radius: 3)
sphere.volume



/***************************************************
 Cone
 ***************************************************/

class Cone {
  let radius: Double
  let height: Double
  var volume: Double {
    return pow(radius, 2) * height * .pi / 3
  }
  init(radius: Double, height: Double) {
    self.radius = radius
    self.height = height
  }
}

let cone = Cone(radius: 4, height: 10)
cone.volume
