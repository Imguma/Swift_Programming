import UIKit

// 20-3

/*
protocol SomeProtocol {
    var settableProperty: String { get set }  // 읽고 쓰기 모두 요구
    var notNeedToBeSerrableProperty: String { get }  // 읽기만 요구
}

protocol AnotherProtocol { // 타입 프로퍼티를 요구하려면 static 사용
    static var someTypeProperty: Int { get set } // 읽고 쓰기 모두 요구
    static var anotherTypeProperty: Int { get }  // 읽기만 요구
}
*/


// 20-4

/*
// 무언가의 전송을 위한 from과 to를 요구
protocol Sendable {
    var from: String { get }  // 읽기 전용을 요구했지만
    var to: String { get }    // 읽고 쓰기 모두 가능한 것으로 구현해도 문제 없음
}

class Message: Sendable {  // Sendable 프로토콜 채택
    var sender: String
    var from: String {  // 읽기 전용 프로퍼티
        return self.sender
    }
    
    var to: String
    
    init(sender: String, receiver: String) {
        self.sender = sender
        self.to = receiver
    }
}

class Mail: Sendable {  // Sendable 프로토콜 채택
    var from: String
    var to: String
    
    init(sender: String, receiver: String) {
        self.from = sender
        self.to = receiver
    }
}
*/


// 20-5

/*
// 무언가를 수신받을 수 있는 기능
protocol Receiveable {
    func received(data: Any, from: Sendable)
}

// 무언가를 발신할 수 있는 기능
protocol Sendable {
    var from: Sendable { get }
    var to: Receiveable? { get }
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}

// 수신, 발신이 가능한 Message 클래스
class Message: Sendable, Receiveable { // 프로토콜 채택
    // 발신은 발신 가능한 객체, 즉 Sendable 프로토콜을 준수하는 타입의 인스턴스여야 함
    var from: Sendable {
        return self
    }
    
    // 상대방은 수신 가능한 객체, 즉 Sendable 프로토콜을 준수하는 타입의 인스턴스여야 함
    var to: Receiveable?
    
    // 메시지 보내기(발신)
    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("Message has no receiver")
            return
        }
        // 수신 가능한 인스턴스의 received 메서드 호출
        receiver.received(data: data, from: self.from)
    }
    
    // 메시지 받기(수신)
    func received(data: Any, from: Sendable) {
        print("Message received \(data) from \(from)")
    }
    
    // class 메서드이므로 상속 가능 (static이면 상속 불가능)
    class func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

// 수신, 발신이 가능한 Mail 클래스
class Mail: Sendable, Receiveable {  // 프로토콜 채택
    var from: Sendable {
        return self
    }
    
    var to: Receiveable?
    
    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("Mail has no receiver")
            return
        }
        receiver.received(data: data, from: self.from)
    }
    
    func received(data: Any, from: Sendable) {
        print("Mail received \(data) from \(from)")
    }
    
    // static 메서드이므로 상속 불가능
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}


// 인스턴스 생성
let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

// 아직 수신받을 인스턴스가 없다.
myPhoneMessage.send(data: "Hello")

// Message 인스턴스는 발신과 수신 모두 가능하므로 메시지 주고 받을 수 있음
myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello")

// 인스턴스 생성
let myMail: Mail = Mail()
let yourMail: Mail = Mail()

// 아직 수신받을 인스턴스가 없다.
myMail.send(data: "Hi")

// 발신 수신 모두 가능
myMail.to = yourMail
myMail.send(data: "Hi")

myMail.to = myPhoneMessage
myMail.send(data: "Bye")

// instance as? Sendable -> instance가 참조하는 인스턴스가 Sendable 타입의 인스턴스인가?
Message.isSendableInstance("Hello")  // false

// Mail과 Message는 Sendable 프로토콜을 준수
Message.isSendableInstance(myPhoneMessage)  // true

Message.isSendableInstance(yourPhoneMessage)  // to 프로퍼티가 설정되어있지 않아 보낼 수 없는 상태
Mail.isSendableInstance(myPhoneMessage)  // true
Mail.isSendableInstance(myMail)   // true
*/


// 20-6

/*
protocol Resettable {  // reset() 이라는 가변 메서드 요구
    mutating func reset()
}

class Person: Resettable {  // 가변 메서드 요구하는 프로토콜 Resettable 채택
    var name: String?
    var age: Int?
    
    func reset() {  // mutating 키워드 생략, 메서드 구현!
        self.name = nil
        self.age = nil
    }
}

struct Point: Resettable {
    var x: Int = 0
    var y: Int = 0
    
    mutating func reset() {   // 구조체는 값 타입이기 때문에 mutating 사용
        self.x = 0
        self.y = 0
    }
}

enum Direction: Resettable {
    case east, west, south, north, unknown
    
    mutating func reset() {   // 열거체는 값 타입이기 때문에 mutating 사용
        self = Direction.unknown
    }
}

// 만약 Resettable 프로토콜에서 가변 메서드를 요구하지 않았다면
// 값 타입의 인스턴스 내부 값을 변경하는 mutating 메서드는 구현 불가능!
*/


// 20-7, 8

/*
protocol Named {
    var name: String { get }
    
    init(name: String)  // 이니셜라이저 요구
}

struct Pet: Named {
    var name: String
    
    init(name: String) {  // 이니셜라이저 구현
        self.name = name
    }
}

// 클래스에서 이니셜라이저를 구현할 때 지정인지 편의 이니셜라이저인지는 중요하지 않으나
// 구현할 때 required 식별자를 붙여야 함
class Person: Named {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
}
*/


// 20-10

/*
protocol Named {
    var name: String { get }
    
    init(name: String)  // 이니셜라이저 요구
}

// 프로토콜이 요구하는 이니셜라이저가 이미 구현되어 있는 상황에서
// 그 클래스를 상속받은 클래스가 있다면, required와 override 모두 명시하여 구현
class School {  // School은 Named를 채택하진 않았지만 이미 이니셜라이저가 구현되어 있음
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class MiddleSchool: School, Named {  // School을 상속받고 Named 채택
    required override init(name: String) {  // 그래서 상속받은 이니셜라이저를 재정의 동시에
                                            // Named 프로토콜의 이니셜라이저 요구도 충족해야함
        super.init(name: name)
    }
}
*/


// 20-11

/*
protocol Named {
    var name: String { get }
    
    init?(name: String)  // 실패 가능한 이니셜라이저 요구 -> 실패 가능/일반 이니셜라이저 무방
}

struct Animal: Named {
    var name: String
    
    init!(name: String) {
        self.name = name
    }
}

struct Pet: Named {
    var name: String
    
    init(name: String){
        self.name = name
    }
}

class Person: Named {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
}

class School: Named {
    var name: String
    
    required init?(name: String) {
        self.name = name
    }
}

// 20-17

// 프로토콜 이름을 타입으로 갖는 변수 또는 상수에 그 프로토콜을 준수하는 어떤 인스턴스라도 할당 가능
var someNamed: Named = Animal(name: "Animal")

// Pet, Person, School 타입은 모두 Named 프로토콜 준수하기 때문에
// Named 프로토콜을 타입으로 갖는 변수 someNamed에 Pet, Person, School 타입의 인스턴스가 할당 될 수 있음
someNamed = Pet(name: "Pet")
someNamed = Person(name: "Person")
someNamed = School(name: "School")!
*/



// 20-12

/*
// 프로토콜의 상속
protocol Readable { // read()
    func read()
}

protocol Writeable { // write()
    func write()
}

protocol ReadSpeakable: Readable {  // read(), speak()
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writeable {  // read(), write(), speak()
    func speak()
}

class SomeClass: ReadWriteSpeakable {  // 세 프로토콜이 요구하는 메서드들 구현
    func read() {
        print("Read")
    }
    
    func write() {
         print("Write")
    }
    func speak() {
        print("Speak")
    }
}



// 20-13

// 클래스 전용 프로토콜의 정의
// 프로토콜의 상속 리스트에 class 키워드를 추가해 프로토콜이 클래스 타입에만 채택될 수 있도록 제한
// class 키워드가 맨 처음에 위치하도록 함
protocol ClassOnlyProtocol: class, Readable, Writeable {
    //
}

class SomeClass: ClassOnlyProtocol {
    func read() { }
    func write() { }
}

// 오류!! ClassOnlyProtocol은 클래스 타입에만 채택 가능함!!
struct SomeStruct: ClassOnlyProtocol {
    func read() { }
    func write() { }
}
*/


// 20-14

/*
protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

class Car: Named {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Truck: Car, Aged {
    var age: Int
    
    init(name: String, age: Int) {
        self.age = age
        super.init(name: name)
    }
}

func celebrateBirthday(to celebrator: Named & Aged) {
    print("Happy birthday \(celebrator.name)!! Now you are \(celebrator.age)")
}

let yagom: Person = Person(name: "yagom", age: 99)
celebrateBirthday(to: yagom)

let myCar: Car = Car(name: "Boong Boong")
//celebrateBirthday(to: myCar)   // 오류!! Aged 충족시키지 못함

//var someVariable: Car & Truck & Aged   // 오류!! 클래스 & 프로토콜 조합은 클래스 타입 한개만 조합 가능

var someVariable: Car & Aged  // Car 클래스의 인스턴스 역할도 수행할 수 있고, Aged 프로토콜 준수하는 인스턴스만 할당 가능

someVariable = Truck(name: "Truck", age: 5)

//someVariable = myCar   // Aged 프로토콜을 준수하지 않으므로 할당 불가능


// 20-15

print(yagom is Named)   // true
print(yagom is Aged)    // true

print(myCar is Named)   // ture
print(myCar is Aged)    // false

if let castedInstance: Named = yagom as? Named {
    print("\(castedInstance) is Named")
}
if let castedInstance: Aged = yagom as? Aged {
    print("\(castedInstance) is Aged")
}
if let castedInstance: Named = myCar as? Named {
    print("\(castedInstance) is Named")
}
if let castedInstance: Aged = myCar as? Aged {
    print("\(castedInstance) is Aged")
}  // 출력 없음. 캐스팅 실패
*/


// 20-16


import Foundation

// Movable 프로토콜은 선택적 요구사항인 fly() 메서드를 포함하므로 objc 속성을 부여
// objc 속성의 프로토콜을 사용하기 위해 Tiger, Bird는 각각 Objective-C의 클래스인 NSObject를 상속 받음
@objc protocol Moveable {
    func walk()
    @objc optional func fly()  // 선택적 요구사항
}

class Tiger: NSObject, Moveable {  // Tiger은 날 수 없기 때문에 fly()구현 x
    func walk() {
        print("Tiger walks")
    }
}

class Bird: NSObject, Moveable {   // Bird는 날 수 있기 때문에 fly() 구현
    func walk() {
        print("Birds walks")
    }
    
    func fly() {
        print("Bird flys")
    }
}

// 각 클래스의 인스턴스를 구현하여 사용할 경우 타입에 메서드가 구현되어있는지 확인할 수 있음
let tiger: Tiger = Tiger()
let bird: Bird = Bird()

tiger.walk()
bird.walk()
bird.fly()

// Movable 프로토콜 변수에 할당되었을 때는 인스턴스의 타입에 실제로 fly() 메서드가 구현되어 있는지 알수 없으므로
// 옵셔널 체인(?) 이용하여 fly() 메서드 호출
var movableInstance: Moveable = tiger
movableInstance.fly?()

movableInstance = bird
movableInstance.fly?()


