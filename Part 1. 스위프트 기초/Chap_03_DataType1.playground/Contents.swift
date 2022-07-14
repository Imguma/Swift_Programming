import UIKit

//3-1
/*
var integer: Int = -100
let unsignedInteger : UInt = 50 //상수 선언, UInt -> 0포함 양의 정수
print("integer 값: \(integer), unsignedInteger 값: \(unsignedInteger)")
print("Int 최대값: \(Int.max), Int 최솟값: \(Int.min)")
print("UInt 최대값: \(UInt.max), UInt 최솟값: \(UInt.min)")

let largeInteger: Int64 = Int64.max
let smallUnsignedInteger: UInt8 = UInt8.max
print("Int64 최댓값: \(largeInteger), UInt8 최댓값: \(smallUnsignedInteger)")

//let tooLarge: Int = Int.max + 1  //범위 초과 오류
//let cannotBeNegative: UInt = -5  //음수가 될 수 x

//integer = unsignedInteger  //서로 다른 타입이므로 오류
integer = Int(unsignedInteger)  //타입 캐스팅
*/

//3-2
/*
let decimalInteger: Int = 28
let binaryInteger: Int = 0b11100 //2진수
let octalInteger: Int = 0o34 //8진수
let hexadecimalInteger: Int = 0x1C //16진수
*/

//3-3
/*
var boolean: Bool = true
boolean.toggle() //true - false 반전
let x: Bool = true
let isTimeUnlimited: Bool = false
print("boolean: \(boolean)")
print("시간은 무한합니까? \(isTimeUnlimited)")
*/

//3-4
/*
//Float은 6자리 숫자까지 표현 가능
var floatValue: Float = 1234567890.1

let doubleValue: Double = 1234567890.1

print("floatValue: \(floatValue), doubleValue: \(doubleValue)")

floatValue = 123456.1
print(floatValue)

var num: Int = Int.random(in: -100...100)
print(num)
*/

//3-5,6
/*
let alphabetA: Character = "A"
print(alphabetA)

let name: String = "벌레"
var intro: String = String()

intro.append("제 이름은")
intro = intro + " " + name + "입니다"
print(intro)

print("name의 글자 수: \(name.count)")
print("introduece가 비어있습니까?: \(intro.isEmpty)")

let unicodeScalarValue: String = "\u{2665}"
*/

//3-7
let hello: String = "hello"
let bug: String = "벌레"
var greeting: String = hello + " " + bug + "!"
print(greeting)

greeting = hello
greeting += " "
greeting += bug
greeting += "!"
print(greeting)

var isSameString: Bool = false

isSameString = hello == "Hello"
print(isSameString) //false

isSameString = hello == "hello"
print(isSameString) //true

isSameString = bug == "벌레"
print(isSameString) //true


//메서드를 통한 접두어, 접미어 확인
var hasPrefix: Bool = false
hasPrefix = hello.hasPrefix("he")
print(hasPrefix)  //true

hasPrefix = hello.hasPrefix("HE")
print(hasPrefix)  //false

var hasSuffix: Bool = false
hasSuffix = hello.hasSuffix("HE")
print(hasSuffix)  //false

hasSuffix = hello.hasSuffix("llo")
print(hasSuffix)  //true

//메서드를 통한 대소문자 변환
var convertedStirng: String = ""
convertedStirng = hello.uppercased()
print(convertedStirng)  //HELLO

convertedStirng = hello.lowercased()
print(convertedStirng)  //hello

var isEmptyString: Bool = false
isEmptyString = greeting.isEmpty
print(isEmptyString) //false

print(greeting.count)
