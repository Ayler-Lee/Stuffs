//: [Previous](@previous)

//: 控制转移语句（Control Transfer Statements）

/*
    continue
    break
    fallthrough
    return
*/

//: Continue

    let puzzleInput = "great minds think alike"
    var puzzleOutput = ""
    for character in puzzleInput.characters {
        switch character {
        case "a", "e", "i", "o", "u", " ":
            continue
        default:
            puzzleOutput.append(character)
        }
    }
    print(puzzleOutput)
// 输出 "grtmndsthnklk"


//: Break

// 循环语句中的 break

// Switch 语句中的 break

let numberSymbol: Character = "三"  // 简体中文里的数字 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}

if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}
// 输出 "The integer value of 三 is 3."


//: 贯穿（Fallthrough）

    let integerToDescribe = 5
    var description = "The number \(integerToDescribe) is"
    switch integerToDescribe {
    case 2, 3, 5, 7, 11, 13, 17, 19:
        description += " a prime number, and also"
        fallthrough
        
    case 4: // 不用匹配
        description += " wtf"
        fallthrough
        
    default:
        description += " an integer."
    }
    print(description)
// 输出 "The number 5 is a prime number, and also an integer."


//: 带标签的语句（Labeled Statements）

/*产生一个带标签的语句是通过 在该语句的关键词的同一行前面放置一个标签，并且该标签后面还需带着一个冒号。下面是一个while循环体的语法，同样的规则适用于所有的循环体和switch代码块。

labelName: while condition {
    statements
}
*/








//: [Next](@next)
