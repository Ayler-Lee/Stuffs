//: [Previous](@previous)

//: 字符串的 Unicode 表示（Unicode Representations of Strings）

 let dogString = "Dog!🐶"

/*: 
  UTF-8
*/
//您可以通过遍历字符串的utf8属性来访问它的UTF-8表示。 其为UTF8View类型的属性，UTF8View是无符号8位 (UInt8) 值的集合，每一个UInt8值都是一个字符的 UTF-8 表示：
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ")
}
print("\n")
// 68 111 103 33 240 159 144 182


//: UTF-16
//您可以通过遍历字符串的utf16属性来访问它的UTF-16表示。 其为UTF16View类型的属性，UTF16View是无符号16位 (UInt16) 值的集合，每一个UInt16都是一个字符的 UTF-16 表示：
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ")
}
print("\n")
// 68 111 103 33 55357 56374

//: Unicode 标量 (Unicode Scalars)
//您可以通过遍历字符串的unicodeScalars属性来访问它的 Unicode 标量表示。 其为UnicodeScalarView类型的属性， UnicodeScalarView是UnicodeScalar的集合。 UnicodeScalar是21位的 Unicode 代码点。
//每一个UnicodeScalar拥有一个value属性，可以返回对应的21位数值，用UInt32来表示。
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ")
}
print("\n")
// 68 111 103 33 128054

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// !
// 🐶
//: [Next](@next)
