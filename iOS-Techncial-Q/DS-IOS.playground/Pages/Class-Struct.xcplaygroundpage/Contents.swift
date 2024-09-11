import Foundation

var greeting = "Hello, playground"

//MARK:-  Class vs Struct
//Classes have additional capabilities that structures don’t have:
  ///Inheritance enables one class to inherit the characteristics of another.
  ///Type casting enables you to check and interpret the type of a class instance at runtime.
  ///Deinitializers enable an instance of a class to free up any resources it has assigned.
  ///Reference counting allows more than one reference to a class instance.
  ///For more information, see Inheritance, Type Casting, Deinitialization, and Automatic Reference Counting.
///
///
///
//Example 1:
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// the type of "library" is inferred to be [MediaItem]

//Checking Type

func checkOperator() {
    var movieCount = 0
    var songCount = 0
    for item in library {
        if item is Movie {
            movieCount += 1
        } else if item is Song {
            songCount += 1
        }
    }
    print("Media library contains \(movieCount) movies and \(songCount) songs")
    // Prints "Media library contains 2 movies and 3 songs"
}

checkOperator()

//Downcasting:
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}
// Movie: Casablanca, dir. Michael Curtiz
// Song: Blue Suede Shoes, by Elvis Presley
// Movie: Citizen Kane, dir. Orson Welles
// Song: The One And Only, by Chesney Hawkes
// Song: Never Gonna Give You Up, by Rick Astley

//Example:2

class Animal {
    func sound() {
        print("Some sound")
    }
}
class Dog: Animal {
    override func sound() {
        print("Bark")
    }
}

let myAnimal: Animal = Dog()
if let myDog = myAnimal as? Dog {
    myDog.sound()  // Output: Bark
}

// Any or Anyobject
  ///Why Use Any and AnyObject:
  ///Flexibility: They provide flexibility when working with collections or APIs that deal with mixed or dynamic types.
  ///Bridging with Objective-C: AnyObject is often used when interfacing with Objective-C, where dynamic typing is more common.
  ///Handling Dynamic Data: In cases like JSON parsing, where the structure is not known at compile time, Any can be useful to represent the data.

//Example: 1

//KeyNote: heterogeneous data structures
var things: [Any] = []

things.append(42)
things.append(3.14)
things.append("Hello")
things.append((3, 5))
things.append({ (name: String) -> String in "Hello, \(name)" })

for thing in things {
    switch thing {
    case let someInt as Int:
        print("An integer value of \(someInt)")
    case let someDouble as Double:
        print("A double value of \(someDouble)")
    case let someString as String:
        print("A string value of \"\(someString)\"")
    case let someTuple as (Int, Int):
        print("A tuple with values \(someTuple)")
    case let someFunction as (String) -> String:
        print(someFunction("World"))
    default:
        print("Something else")
    }
}
//Example: 2
var mixedArray: [Any] = [42, "Hello", 3.14, (x: 1, y: 2)]

class Car {
    var model: String
    init(model: String) {
        self.model = model
    }
}

class Bicycle {
    var hasBasket: Bool
    init(hasBasket: Bool) {
        self.hasBasket = hasBasket
    }
}

var vehicles: [AnyObject] = []

vehicles.append(Car(model: "Tesla Model 3"))
vehicles.append(Bicycle(hasBasket: true))

for vehicle in vehicles {
    if let car = vehicle as? Car {
        print("Car model: \(car.model)")
    } else if let bicycle = vehicle as? Bicycle {
        print("Bicycle has basket: \(bicycle.hasBasket)")
    }
}

