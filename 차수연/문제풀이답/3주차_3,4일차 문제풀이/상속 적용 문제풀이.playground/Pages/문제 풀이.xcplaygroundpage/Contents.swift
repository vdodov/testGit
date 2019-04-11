//: [Previous](@previous)

class Animal {
  var brain = true
  var legs: Int
  init(legs: Int = 0) {
    self.legs = legs
  }
}

class Human: Animal {
  override init(legs: Int = 2) {
    super.init(legs: legs)
  }
}

class Pet: Animal {
  var fleas: Int
  init(fleas: Int = 0) {
    self.fleas = fleas
    super.init(legs: 4)
  }
}


class Dog: Pet {
  override init(fleas: Int = 8) {
    super.init(fleas: fleas)
  }
}


class Cat: Pet {
  override init(fleas: Int = 4) {
    super.init(fleas: fleas)
  }
}

print("\n---------- [ Animal ] ----------\n")

let animal = Animal()
print("animal brain :", animal.brain)
print("animal legs :", animal.legs)


print("\n---------- [ Human ] ----------\n")

let human = Human()
print("human brain :", human.brain)
print("human legs :", human.legs)


print("\n---------- [ Pet ] ----------\n")

let pet = Pet()
print("pet brain :", pet.brain)
print("pet legs :", pet.legs)
print("pet fleas :", pet.fleas)


print("\n---------- [ Dog ] ----------\n")

let dog = Dog()
print("dog brain :", dog.brain)
print("dog legs :", dog.legs)
print("dog fleas :", dog.fleas)

print("\n---------- [ Cat ] ----------\n")

let cat = Cat()
print("cat brain :", cat.brain)
print("cat legs :", cat.legs)
print("cat fleas :", cat.fleas)


//: [Next](@next)
