import UIKit
import Security

// 22-2

/*
prefix operator **

// BinaryInteger 프로토콜에 해당하는 값이면 해당 연산자를 사용할수 있도록 제네렉을 이용하여 구현!
prefix func ** <T: BinaryInteger> (value: T) -> T {
    return value * value
}

let minusFive: Int = -5
let five: UInt = 5

let sqrtMinusFive: Int = **minusFive
let sqrtFive: UInt = **five

print(sqrtMinusFive)
print(sqrtFive)
*/


// 22-6

/*
func swapTwoValues<T>(_ a: inout T, _ b: inout T){
    let temporaryA: T = a
    a = b
    b = temporaryA
}

var numberOne: Int = 5
var numberTwo: Int = 10

var stringOne: String = "A"
var stringTwo: String = "B"

var anyOne: Any = 1
var anyTwo: Any = "Two"

swapTwoValues(&numberOne, &numberTwo)
print("\(numberOne), \(numberTwo)")

swapTwoValues(&stringOne, &stringTwo)
print("\(stringOne), \(stringTwo)")

swapTwoValues(&anyOne, &anyTwo)
print("\(anyOne), \(anyTwo)")
*/


// 22-7

/*
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var doubleStack: Stack<Double> = Stack<Double>()

doubleStack.push(1.0)
print(doubleStack.items)
doubleStack.push(2.0)
print(doubleStack.items)
doubleStack.pop()
print(doubleStack.items)

var stringStack: Stack<String> = Stack<String>()

stringStack.push("1")
print(stringStack.items)
stringStack.push("2")
print(stringStack.items)
stringStack.pop()
print(stringStack.items)

var anyStack: Stack<Any> = Stack<Any>()

anyStack.push(1.0)
print(anyStack.items)
anyStack.push("2")
print(anyStack.items)
anyStack.push(3)
print(anyStack.items)
anyStack.pop()
print(anyStack.items)

// 22-9

extension Stack {
    var topElement: Element? { // Stack은 제네릭 타입이지만 익스텐션 정의에는 따로 타입 매개변수를 명시해주지 않았다.
        return self.items.last  // 대신 기존의 제네릭 타입에서 정의되어 있던 Element라는 타입을 사용할 수 있다.
    }
}

print(doubleStack.topElement)
print(stringStack.topElement)
print(anyStack.topElement)
*/


// 22-16, 17

/*
protocol Container {
    associatedtype ItemType // 존재하지 않는 ItemType을 연관 타입으로 정의하여 프로토콜 정의에서 타입 이름으로 활용
    var count: Int { get }
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

class MyContainer: Container {
    // 연관 타입인 ItemType 대신에 실제 타입인 Int타입으로 구현해도
    // 이는 프로토콜의 요구사항을 모두 충족하므로 큰 문제가 없다.
    // 이유는 프로토콜에서 ItemType이라는 연관 타입만 정의했을 뿐, 특정 타입을 지정하지 않았기 때문!
    // 프로토콜 정의를 준수하기 위해 구현할 때는 ItemType을 하나의 타입으로 일관성있게 구현하면 됨
    var items: Array<Int> = Array<Int>()
    
    var count: Int {
        return items.count
    }
    
    func append(_ item: Int) {
        items.append(item)
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}
*/


// 22-18, 19

/*
protocol Container {
    associatedtype ItemType // 존재하지 않는 ItemType을 연관 타입으로 정의하여 프로토콜 정의에서 타입 이름으로 활용
    var count: Int { get }
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

struct IntStack: Container {
    typealias ItemType = Int  // ItemType을 어떤 타입으로 사용할지 명확히 해주고 싶을때 타입 별칭 지정
    
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
*/


// 22-20

protocol Container {
    associatedtype ItemType // 존재하지 않는 ItemType을 연관 타입으로 정의하여 프로토콜 정의에서 타입 이름으로 활용
    var count: Int { get }
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

struct Stack<Element>: Container { // ItemType이라는 연관 타입 대신 Element 타입 매개변수 사용해도
                                   // Stack 구조체는 Container 프로토콜 완벽히 준수
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    mutating func append(_ item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

// 22-21

extension Stack {
    // Indices라는 플레이스홀더를 사용하여 매개변수를 제네릭하게 받아들일 수 있음
    // Indices는 Sequence 프로토콜을 준수하는 타입
    // Indices 타입 Iterator의 Element 타입이 Int 타입이어야 하는 제약 추가됨
    subscript<Indices: Sequence>(indices: Indices) -> [Element] where Indices.Iterator.Element == Int {
        var result = [ItemType]()
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}

var integerStack: Stack<Int> = Stack<Int>()
integerStack.append(1)
integerStack.append(2)
integerStack.append(3)
integerStack.append(4)
integerStack.append(5)

print(integerStack[0...2])
