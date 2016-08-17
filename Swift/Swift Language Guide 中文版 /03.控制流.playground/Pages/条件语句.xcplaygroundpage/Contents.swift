//: [Previous](@previous)

//: IF

    var temperatureInFahrenheit = 90
    if temperatureInFahrenheit <= 32 {
        print("It's very cold. Consider wearing a scarf.")
    } else if temperatureInFahrenheit >= 86 {
        print("It's really warm. Don't forget to wear sunscreen.")
    } else {
        print("It's not that cold. Wear a t-shirt.")
    }
// 输出 "It's really warm. Don't forget to wear sunscreen."


//: SWITCH

/*
    switch some value to consider {
    case value 1:
        respond to value 1
    case value 2,value 3:
        respond to value 2 or 3
    default:
        otherwise, do something else
}
*/
    let someCharacter: Character = "e"
    switch someCharacter {
    case "a", "e", "i", "o", "u":
        print("\(someCharacter) is a vowel")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        print("\(someCharacter) is a consonant")
    default:
        print("\(someCharacter) is not a vowel or a consonant")
    }
// 输出 "e is a vowel"


// 区间匹配（Range Matching）

    let count = 3_000_000_000_000
    let countedThings = "stars in the Milky Way"
    var naturalCount: String
    switch count {
    case 0:
        naturalCount = "no"
    case 1...3:
        naturalCount = "a few"
    case 4...9:
        naturalCount = "several"
    case 10...99:
        naturalCount = "tens of"
    case 100...999:
        naturalCount = "hundreds of"
    case 1000...999_999:
        naturalCount = "thousands of"
    default:
        naturalCount = "millions and millions of"
    }
    print("There are \(naturalCount) \(countedThings).")
// 输出 "There are millions and millions of stars in the Milky Way."


// 元组（Tuple）

    let somePoint = (1, 1)
    switch somePoint {
    case (0, 0):
        print("(0, 0) is at the origin")
    case (_, 0):
        print("(\(somePoint.0), 0) is on the x-axis")
    case (0, _):
        print("(0, \(somePoint.1)) is on the y-axis")
    case (-2...2, -2...2):
        print("(\(somePoint.0), \(somePoint.1)) is inside the box")
    default:
        print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
    }
// 输出 "(1, 1) is inside the box"


// 值绑定（Value Bindings）







//: [Next](@next)
