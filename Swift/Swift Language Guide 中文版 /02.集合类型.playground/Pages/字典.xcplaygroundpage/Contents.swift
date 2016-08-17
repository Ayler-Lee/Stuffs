//: [Previous](@previous)

//: 字典

/*
Swift 的字典使用Dictionary<KeyType, ValueType>定义,其中KeyType是字典中键的数据类型，ValueType是字典中对应于这些键所存储值的数据类型。

KeyType的唯一限制就是可哈希的，这样可以保证它是独一无二的，所有的 Swift 基本类型（例如String，Int， Double和Bool）都是默认可哈希的，并且所有这些类型都可以在字典中当做键使用。未关联值的枚举成员（参见枚举）也是默认可哈希的。
*/

//: 字典字面量

var airports: [String:String] = ["TYO": "Tokyo", "DUB": "Dublin"] // var


//: 读取和修改字典

// .count
print("The dictionary of airports contains \(airports.count) items.")
// 打印 "The dictionary of airports contains 2 items."（这个字典有两个数据项）


// .isEmpty
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}
// 打印 "The airports dictionary is not empty.(这个字典不为空)"


// 新增 (可去重)
airports["LHR"] = "London"
// airports 字典现在有三个数据项

// 改 value
airports["LHR"] = "London Heathrow"
// "LHR"对应的值 被改为 "London Heathrow

// updateValue(forKey:)
// 在这个键不存在对应值的时候设置值 或者 在存在时更新已存在的值
// 这个方法返回更新值之前的 原值
if let oldValue = airports.updateValue("Dublin Internation", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// 输出 "The old value for DUB was Dublin."（DUB原值是dublin）

airports["APL"] = "Apple Internation"
// "Apple Internation"不是真的 APL机场, 删除它
airports["APL"] = nil
// APL现在被移除了

// removeValueForKey
// 键值对存在的情况下会移除该键值对 并且返回被移除的value 或者在没有值的情况下返回nil
if let removedValue = airports.removeValueForKey("DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
// prints "The removed airport's name is Dublin International."


//: 字典遍历

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

// 遍历 keys
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

//遍历 values
for airportName in airports.values {
    print("Airport name: \(airportName)")
}

// 用 keys 创建数组
let airportCodes = Array(airports.keys)

// 用 values 创建数组
let airportNames = Array(airports.values)



// : 创建一个空字典

var namesOfIntegers = Dictionary<Int, String>()
var namesOfIntegers2 = [Int: String]()
namesOfIntegers[16] = "sixteen"
// namesOfIntegers 现在包含一个键值对
namesOfIntegers = [:]
// namesOfIntegers 又成为了一个 Int, String类型的空字典


//: [Next](@next)
