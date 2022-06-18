import UIKit

// 21-3
/*
extension Int { // 두 개의 연산 프로퍼티 추가
    var isEven: Bool {
        return self % 2 == 0
    }
    
    var isOdd: Bool {
        return self % 2 == 1
    }
}

print(1.isEven)
print(2.isEven)
print(1.isOdd)
print(2.isOdd)

var number: Int = 3
print(number.isEven)
print(number.isOdd)

number = 2
print(number.isEven)
print(number.isOdd)
*/


// 21-4

/*
extension Int {
    func multiply(by n: Int) -> Int {  // 인스턴스 메서드
        return self * n
    }
    
    mutating func multiplySelf(by n: Int) {  // 가변 메서드
        self = self.multiply(by: n)
    }
    
    static func isIntTypeInstance(_ instance: Any) -> Bool {  // 타입 메서드
        return instance is Int
    }
}

print(3.multiply(by: 2))
print(4.multiply(by: 5))

var number: Int = 3

number.multiplySelf(by: 2)
print(number)

number.multiplySelf(by: 3)
print(number)

Int.isIntTypeInstance(number)
Int.isIntTypeInstance(3)
Int.isIntTypeInstance(3.0)
Int.isIntTypeInstance("3")

prefix operator ++

struct Position {
    var x: Int
    var y: Int
}

extension Position {
    // + 중위 연산 구현
    static func + (left: Position, right: Position) -> Position {  // 타입 메서드들 추가!
        return Position(x: left.x + right.x, y: left.y + right.y)
    }
    
    // - 전위 연산 구현
    static prefix func - (vector: Position) -> Position {
        return Position(x: -vector.x, y: -vector.y)
    }
    
    // += 복합할당 연산자 구현
    // 함수의 파라미터는 기본적으로 상수임! 전달받은 파라미터를 함수 내부에서 변경하려고 시도하면 컴파일 에러가 발생.
    // 함수의 파라미터를 함수 내부에서 변경하고 함수가 종료된 후에도 변경한 값이 지속되도록 하려면 변수의 주소값을 넘겨 직접 접근할 수 있도록 도와주는 inout 키워드를 사용
    static func += (left: inout Position, right: Position) {
        left = left + right
    }
}

extension Position {
    // == 비교 연산자 구현
    static func == (left: Position, right: Position) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
    
    // != 비교 연산자 구현
    static func != (left: Position, right: Position) -> Bool {
        return !(left == right)
    }
}

extension Position {
    // ++ 사용자 정의 연산자 구현
    static prefix func ++ (position: inout Position) -> Position {
        position.x += 1
        position.y += 1
        return position
    }
}

var myPosition: Position = Position(x: 10, y: 10)
var yourPosition: Position = Position(x: -5, y: -5)

print(myPosition + yourPosition)
print(-myPosition)

myPosition += yourPosition
print(myPosition)

print(myPosition == yourPosition)
print(myPosition != yourPosition)

print(++myPosition)
*/


// 21-5

// 익스텐션을 통한 이니셜라이저 추가
/*
extension String {
    init(intTypeNumber: Int) {
        self = "\(intTypeNumber)"
    }
    
    init(doubleTypeNumber: Double) {
        self = "\(doubleTypeNumber)"
    }
}

let stringFromInt: String = String(intTypeNumber: 100)
let stringFromDouble: String = String(doubleTypeNumber: 100.0)

class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Person {  // 클래스 확장할 때 지정/디이니셜라이저는 클래스 타입의 구현부에 위치해야함
    convenience init() {  // 편의 이니셜라이저 추가
        self.init(name: "Unknown")
    }
}

let someOne: Person = Person()
print(someOne.name)
*/


// 21-6

/*
// 익스텐션을 통한 초기화 위임 이니셜라이저 추가

struct Size {  // 모든 저장 프로퍼티는 기본값을 가짐, 추가로 사용자 정의 이니셜라이저를 구현하지 않았음
               // -> 기본이니셜라이저와 멤버와이즈 이니셜라이저 사용 가능!
    var width: Double = 0.0
    var height: Double = 0.0
}

struct Point { // 모든 저장 프로퍼티는 기본값을 가짐, 추가로 사용자 정의 이니셜라이저를 구현하지 않았음
               // -> 기본이니셜라이저와 멤버와이즈 이니셜라이저 사용 가능!
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Rect {
    var origin: Point = Point()
    var size: Size = Size()
}

let defaultRect: Rect = Rect()
let memberwiseRect: Rect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {  // 추가해주는 새로운 이니셜라이저는 멤버와이즈 이니셜라이저에게 초기화를 위임해줄 수 있음
        let originX: Double = center.x - (size.width / 2)
        let originY: Double = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect: Rect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
*/


// 21-7

/*
extension String {
    subscript(appendValue: String) -> String {  // 서브스크립트 추가
        return self + appendValue
    }
    
    subscript(repeatCount: UInt) -> String {    // 서브스크립트 추가
        var str: String = ""
        
        for _ in 0..<repeatCount {
            str += self
        }
        return str
    }
}

print("abc"["def"])
print("abc"[3])
*/


// 21-8

extension Int {
    enum Kind {  // 열거형 타입 추가
        case negative, zero, positive
    }
    
    var kind: Kind {  // Kind 타입의 연산 프로퍼티 추가
        switch self { // 인스턴스가 양수, 음수, 0인지 판단하여 Kind 반환
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

print(1.kind)
print(0.kind)
print((-1).kind)

func printIntegerKinds(numbers: [Int]) { // Int타입의 배열을 전달받아 각 값의 부호를 출력해주는 함수
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}

printIntegerKinds(numbers: [3,19,-27,0,-6,0,7])
