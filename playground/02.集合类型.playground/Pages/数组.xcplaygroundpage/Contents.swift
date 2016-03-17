//: [Previous](@previous)

//: 数组


var shoppingList = ["Eggs", "Milk"]


//: 访问和修改数组

print("The shopping list contains \(shoppingList.count) items.")
// 输出"The shopping list contains 2 items."（这个数组有2个项）


if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
// 打印 "The shopping list is not empty."（shoppinglist不是空的）


shoppingList.append("Flour")
// shoppingList 现在有3个数据项，有人在摊煎饼


shoppingList += ["Baking Powder"]
// shoppingList 现在有四项了
shoppingList += ["Chocolate Spread","Cheese","Butter"]
// shoppingList 现在有七项了


var firstItem = shoppingList[0]
// 第一项是 "Eggs"


shoppingList[0] = "Six eggs"
// 其中的第一项现在是 "Six eggs" 而不是 "Eggs"


shoppingList[4...6] = ["Bananas", "Apples"]
// shoppingList 现在有六项


shoppingList.insert("Maple Syrup", atIndex: 0)
// shoppingList 现在有7项
// "Maple Syrup" 现在是这个列表中的第一项


let mapleSyrup = shoppingList.removeAtIndex(0)
// 索引值为0的数据项被移除
// shoppingList 现在只有6项，而且不包括Maple Syrup
// mapleSyrup常量的值等于被移除数据项的值 "Maple Syrup"


// 数据项被移除后数组中的空出项会被自动填补，所以现在索引值为0的数据项的值再次等于"Six eggs":
firstItem = shoppingList[0]
// firstItem 现在等于 "Six eggs"


let apples = shoppingList.removeLast()
// 数组的最后一项被移除了
// shoppingList现在只有5项，不包括cheese
// apples 常量的值现在等于"Apples" 字符串


//: 数组的遍历

for item in shoppingList {
    print(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas



//: 创建并且构造一个数组


var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items。")
// 打印 "someInts is of type [Int] with 0 items。"（someInts是0数据项的Int[]数组）


someInts.append(3)
// someInts 现在包含一个INT值
someInts = []
// someInts 现在是空数组，但是仍然是[Int]类型的。


var threeDoubles = [Double](count: 3, repeatedValue:0.0)
// threeDoubles 是一种 [Double]数组, 等于 [0.0, 0.0, 0.0]


var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.5)
// anotherThreeDoubles is inferred as [Double], and equals [2.5, 2.5, 2.5]


var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles 被推断为 [Double], 等于 [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
//: [Next](@next)
