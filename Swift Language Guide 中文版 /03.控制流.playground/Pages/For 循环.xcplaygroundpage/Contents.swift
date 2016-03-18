//: [Previous](@previous)


//: For 循环
/*
for循环用来按照指定的次数多次执行一系列语句。Swift 提供两种for循环形式：

for-in用来遍历一个区间（range），序列（sequence），集合（collection），系列（progression）里面所有的元素执行一系列语句。
for条件递增（for-condition-increment）语句，用来重复执行一系列语句直到达成特定条件达成，一般通过在每次循环完成后增加计数器的值来实现。
*/

// ##For-In

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

// ( _ ) 下划线忽略参数
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

// 遍历数组
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}

// 遍历字典
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// 遍历字符串
let hello = "Hello"
for character in hello.characters {
    print(character)
}


//: For条件递增（for-condition-increment）

/*
    for initialization; condition; increment {
        statements
    }
*/

/*
    initialization
    while condition {
    statements
    increment
}
*/

//: [Next](@next)
