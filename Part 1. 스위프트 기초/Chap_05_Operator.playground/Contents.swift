import UIKit

//스위프트의 나머지 연산과 나누기 연산자
/*
let number: Double = 5.0
//스위프트는 부동소수점 타입의 나머지 연산까지 지원
var result: Double = number.truncatingRemainder(dividingBy: 1.5)
result = 12.truncatingRemainder(dividingBy: 2.5)
*/


//5-1
/*
var valueA: Int = 3
var valueB: Int = 5
var biggerValue: Int = valueA > valueB ? valueA : valueB

valueA = 0
valueB = -3
biggerValue = valueA > valueB ? valueA : valueB

var stringA: String = ""
var stringB: String = "String"
var resultValue: Double = stringA.isEmpty ? 1.0 : 0.0
resultValue = stringB.isEmpty ? 1.0 : 0.0
*/


//5-2
/*
var unsingedInteger: UInt8 = 0
//UInt는 부호가 없는 양의 정수만을 표현하기 때문에 0아래로 내려가는 연산을 하면 오류
//let errorUnderflowResult: UInt8 = unsingedInteger - 1 //런타임 오류
let underflowedValue: UInt8 = unsingedInteger &- 1

unsingedInteger = UInt8.max
//범위를 벗어나는 오버플로(오류)
//let errorOverflowResult: UInt8 = unsingedInteger + 1  //런타임 오류
let overflowedValue: UInt8 = unsingedInteger &+ 1
*/


//5-5
/*
let intValue: Int = 1
// (1 << 3) + 5 => 8 + 5 => 13
let resultValue1: Int = intValue << 3 + 5
// (1 * 3) + 5 => 3 + 5 => 8
let resultValue2: Int = 1 * 3 + 5
*/


//5-6, 7
/*
//Int 타입의 제곱을 구하는 연산자로 **을 전위 연산자로 사용
prefix operator ** //전위 연산자 정의

//전위 연산자 함수를 구현할 때는 함수 func키워드 앞에 prefix 키워드 추가
prefix func ** (value: Int) -> Int {
    return value * value
}

let minusFive: Int = -5
let sqrtMinusFive: Int = **minusFive

print(sqrtMinusFive)

//5-9

//5-9 **함수 중복 정의
prefix func ** (value: String) -> String {
    return value + " " + value
}
let resultString: String = **"yagom"
print(resultString)
*/
 
//5-8
/*
//기존에 존재하는 전위 연산자 !
//!는 정수에 사용되지만 문자열에도 사용하려고 함
//문자열 앞에 사용하면 문자열이 비어있는지 확인하는 연산자로 중복 정의
prefix func ! (value: String) -> Bool {
    return value.isEmpty
}

var stringValue: String = "yagom"
var isEmptyString: Bool = !stringValue

print(isEmptyString)

stringValue = ""
isEmptyString = !stringValue

print(isEmptyString)
*/


//5-10
/*
postfix operator **  //후위 연산자 정의

postfix func ** (value: Int) -> Int {
    return value + 10
}

let five: Int = 5
let fivePlusTen: Int = five**

print(fivePlusTen)
*/

//5-11
/*
//하나의 피연산자에 전위 연산과 후위 연산을 한 줄에 사용하게 되면 후위 연산 먼저 수행
prefix operator **   //전위 연산자 정의
postfix operator **  //후위 연산자 정의

prefix func ** (value: Int) -> Int {
    return value * value
}

postfix func ** (value: Int) -> Int {
    return value + 10
}

let five: Int = 5
let sqrtFivePlusTen: Int = **five**  //후위 연산부터

print(sqrtFivePlusTen)
*/

//5-13
/*
//String 타입의 contains(_: )메서드를 사용하기 위해 임포트
import Foundation
infix operator ** : MultiplicationPrecedence

//뒤에 오는 문자열(rhs)이 앞의 문자열(lhs) 안에 속해 있는지 확인하는 함수
func ** (lhs: String, rhs: String) -> Bool {
    return lhs.contains(rhs)  //lhs안에 rhs가 있냐?
}

let helloYagom: String = "Hello yagom"
let yagom: String = "yagom"
let isContainsYagom: Bool = helloYagom ** yagom
*/


//5-14
class Car {
    var modelYear: Int?
    var modelName: String?
}

struct SmartPhone {
    var company: String?
    var model: String?
}

// == 연산자 재정의
// Car 클래스의 인스턴스 끼리 비교
func == (lhs: Car, rhs: Car) -> Bool {
    return lhs.modelName == rhs.modelName
}

// SmartPhone 구조체의 인스턴스 끼리 비교
func == (lhs: SmartPhone, rhs: SmartPhone) -> Bool {
    return lhs.model == rhs.model
}

let myCar = Car()
myCar.modelName = "S"

let yourCar = Car()
yourCar.modelName = "S"

var myPhone = SmartPhone()
myPhone.model = "SE"

var yourPhone = SmartPhone()
yourPhone.model = "6"

print(myCar == yourCar)
print(myPhone == yourPhone)
