//: [Previous](@previous)

//:函数的定义与调用（Defining and Calling Functions）


// 定义

func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}


// 调用

print(sayHello("Anna"))
// prints "Hello, Anna!"
print(sayHello("Brian"))
// prints "Hello, Brian!"

//简化

func sayHelloAgain(personName: String) -> String {
    return "Hello again, " + personName + "!"
}
print(sayHelloAgain("Anna"))
// prints "Hello again, Anna!"


//: [Next](@next)
