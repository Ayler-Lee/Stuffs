//: [Previous](@previous)

//: 函数类型（Function Types）


//这两个函数的类型是 (Int, Int) -> Int，可以读作“这个函数类型，它有两个 Int 型的参数并返回一个 Int 型的值。”。
func addTwoInts(a: Int, b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(a: Int, b: Int) -> Int {
    return a * b
}

// 这个函数的类型是：() -> ()，或者叫“没有参数，并返回 Void 类型的函数”。没有指定返回类型的函数总返回 Void。
//在Swift中，Void 与空的元组是一样的。
func printHelloWorld() {
    print("hello, world")
}


//: 使用函数类型（Using Function Types）


// “定义一个叫做 mathFunction 的变量，类型是‘一个有两个 Int 型的参数并返回一个 Int 型的值的函数’，并让这个新变量指向 addTwoInts 函数”。
var mathFunction: (Int, Int) -> Int = addTwoInts

print("Result: \(mathFunction(2, 3))")
// prints "Result: 5"

mathFunction = multiplyTwoInts
print("Result: \(mathFunction(2, 3))")
// prints "Result: 6"

let anotherMathFunction = addTwoInts
// anotherMathFunction is inferred to be of type (Int, Int) -> Int
anotherMathFunction(2, b: 3) // 参数名


//: 函数类型作为参数类型（Function Types as Parameter Types）

func printMathResult(mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, a: 3, b: 5)
// prints "Result: 8”


//: 函数类型作为返回类型（Function Type as Return Types）

//func stepForward(input: Int) -> Int {
//    return input + 1
//}
//func stepBackward(input: Int) -> Int {
//    return input - 1
//}
//
//func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
//    return backwards ? stepBackward : stepForward
//}
//
//var currentValue = 3
//let moveNearerToZero = chooseStepFunction(currentValue > 0)
//// moveNearerToZero now refers to the stepBackward() function
//
//print("Counting to zero:")
//// Counting to zero:
//while currentValue != 0 {
//    print("\(currentValue)... ")
//    currentValue = moveNearerToZero(currentValue)
//}
//print("zero!")
// 3...
// 2...
// 1...
// zero!



//: 嵌套函数（Nested Functions）


func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
var currentValue = -4
let moveNearerToZero = chooseStepFunction(currentValue > 0)
// moveNearerToZero now refers to the nested stepForward() function
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
// -4...
// -3...
// -2...
// -1...
// zero!



//: [Next](@next)
