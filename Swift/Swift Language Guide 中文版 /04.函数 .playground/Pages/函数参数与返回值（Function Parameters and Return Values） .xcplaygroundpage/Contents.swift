//: [Previous](@previous)


//: 函数参数与返回值（Function Parameters and Return Values）

import Foundation
/*
函数参数与返回值在Swift中极为灵活。你可以定义任何类型的函数，包括从只带一个未名参数的简单函数到复杂的带有表达性参数名和不同参数选项的复杂函数。
*/


//: 多重输入参数（Multiple Input Parameters）

func halfOpenRangeLength(start: Int, end: Int) -> Int {
    return end - start
}

print(halfOpenRangeLength(1, end: 10))
// prints "9"


//: 无参函数（Functions Without Parameters）

func sayHelloWorld() -> String {
    return "hello, world"
}

print(sayHelloWorld())
// prints "hello, world"


//: 无返回值函数（Functions Without Return Values）

func sayGoodbye(personName: String) {
    print("Goodbye, \(personName)!")
}

sayGoodbye("Dave")
// prints "Goodbye, Dave!"


/* 忽略返回值 */
func printAndCount(stringToPrint: String) -> Int {
    print(stringToPrint)
    return stringToPrint.characters.count
}

func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint)
}

printAndCount("hello, world")
// prints "hello, world" and returns a value of 12

printWithoutCounting("hello, world")
// prints "hello, world" but does not return a value


//: 多重返回值函数（Functions with Multiple Return Values）

func count(string: String) -> (vowel: Int, consonant: Int, other: Int) {
    var vowels = 0, consonants = 0, others = 0
    for character in string.characters {
        switch String(character).lowercaseString {
        case "a", "e", "i", "o", "u":
            ++vowels
        case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
        "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
            ++consonants
        default:
            ++others
        }
    }
    return (vowels, consonants, others)
}
/* 需要注意的是，元组的成员不需要在函数中返回时命名，因为它们的名字已经在函数返回类型中有了定义。 */

let total = count("some arbitrary string!")
print("\(total.vowel) vowels and \(total.consonant) consonants")
// prints "6 vowels and 13 consonants"


//: 外部参数名（External Parameter Names）

func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String {
    return s1 + joiner + s2
}


func join1(string1: String, toString2: String, withJoiner: String) -> String {
    return string1 + withJoiner + toString2
}


//: 默认参数值（Default Parameter Values）

func join2(string2 s1: String, toString2 s2: String, withJoiner2 joiner: String = " ") -> String {
    return s1 + joiner + s2
}

func join3(s1: String, _ s2: String, _ joiner: String = " ") -> String {
    return s1 + joiner + s2
}


//: 可变参数（Variadic Parameters）

func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

arithmeticMean(1, 2, 3, 4, 5)
// returns 3.0, which is the arithmetic mean of these five numbers

arithmeticMean(3, 8, 19)
// returns 10.0, which is the arithmetic mean of these three numbers

/* 注意： 一个函数至多能有一个可变参数，而且它必须是参数表中最后的一个。这样做是为了避免函数调用时出现歧义。*/


/*: 常量参数和变量参数（Constant and Variable Parameters）
注意： 对变量参数所进行的修改在函数调用结束后便消失了，并且对于函数体外是不可见的。变量参数仅仅存在于函数调用的生命周期中。
*/



//: 输入输出参数（In-Out Parameters）

//注意： 输入输出参数不能有默认值，而且可变参数不能用 inout 标记。如果你用 inout 标记一个参数，这个参数不能被 var 或者 let 标记。
// 你只能将变量作为输入输出参数。你不能传入常量或者字面量（literal value），因为这些量是不能被修改的。当传入的参数作为输入输出参数时，需要在参数前加&符，表示这个值可以被函数修改。

func swapTwoInts(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, b: &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// prints "someInt is now 107, and anotherInt is now 3”













//: [Next](@next)
