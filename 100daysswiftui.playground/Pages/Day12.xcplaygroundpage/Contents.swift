import Cocoa

class Animal {
    var legs:Int
    init(legs:Int) {
        self.legs = legs
    }
    func Speak(){
    }
}
class Dog: Animal{
    override init(legs: Int) {
        super.init(legs: legs)
    }
    override func Speak() {
        print("WoFF Woof")
    }
}
class Corgi: Dog{
    override init(legs: Int) {
        super.init(legs: legs)
    }
    override func Speak() {
        print("corgi woof wof")
    }
}
var coorgi = Corgi(legs: 4)
coorgi.legs
coorgi.Speak()
class Poodle: Dog{
    override init(legs: Int) {
        super.init(legs: legs)
    }
    override func Speak() {
        print("poodle woof wof")
    }
}
var poodle = Poodle(legs: 4)
poodle.legs
poodle.Speak()

class Cat:Animal{
    var isTame:Bool
    override func Speak() {
        print("meow")
    }
    init(isTame:Bool, legs:Int){
        self.isTame = isTame
        super.init(legs: legs)
    }
}
class Persian:Cat{
    override init(isTame: Bool,legs:Int) {
        super.init(isTame: isTame, legs:legs)
    }
    override func Speak() {
        print("persian meow")
    }
}
var persian = Persian(isTame: true, legs: 4)
persian.legs
persian.isTame
persian.Speak()
class Lion:Cat{
    override init(isTame: Bool,legs:Int) {
        super.init(isTame: isTame, legs:legs)
    }
    override func Speak() {
        print("A Lion meow")
    }
}
var lion =  Lion(isTame: false, legs: 4)
lion.Speak()
lion.legs
lion.isTame
