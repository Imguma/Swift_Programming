import UIKit

// 23-1, 2
/*
protocol Receiveable {
    func received(data: Any, from: Sendable)
}

extension Receiveable {
    func received(data: Any, from: Sendable) {
        print("\(self) received \(data) from \(from)")
    }
}

protocol Sendable {
    var from: Sendable { get }
    var to: Receiveable? { get }
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}

extension Sendable {
    var from: Sendable {
        return self
    }
    
    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("Message has no receiver")
            return
        }
        receiver.received(data: data, from: self.from)
    }
    
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

// Message와 Mail 클래스는 Sendable, Receiveable 프로토콜을 채택하고 있지만
// 실제로 구현한 것은 저장 인스턴스 프로퍼티인 to뿐!
// 그 외의 기능은 이미 각 프로토콜의 익스텐션에 구현되어 있다.
class Message: Sendable, Receiveable {
    var to: Receiveable?
}

class Mail: Sendable, Receiveable {
    var to: Receiveable?
    
    // 익스텐션에서 구현한 기능을 사용하지 않고 타입의 특성에 따라 조금 변형해서 재정의 가능!
    func send(data: Any) {
        print("Mail의 send 메서드는 재정의되었습니다.")
    }
}

let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

myPhoneMessage.send(data: "Hello")

myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello")

let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.send(data: "Hi")

myMail.to = yourMail
myMail.send(data: "Hi")

myMail.to = myPhoneMessage
myMail.send(data: "Bye")

Message.isSendableInstance("Hello")

Message.isSendableInstance(myPhoneMessage)

Message.isSendableInstance(yourPhoneMessage)
Mail.isSendableInstance(myPhoneMessage)
Mail.isSendableInstance(myMail)

let mailInstance: Mail = Mail()
mailInstance.send(data: "Hello")
*/


// 23-3
/*
protocol SelfPrintable {
    func printSelf()
}

extension SelfPrintable where Self: Container {
    func printSelf() {
        print(items)
    }
}

protocol Container: SelfPrintable {
    associatedtype ItemType  // 연관 타입
    
    var items: [ItemType] { get set }
    var count: Int { get }
    
    mutating func append(item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

extension Container {
    mutating func append(item: ItemType) {
        items.append(item)
    }
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> ItemType {
        return items[i]
    }
}

protocol Popable: Container {
    mutating func pop() -> ItemType?
    mutating func push(_ item: ItemType)
}

extension Popable {
    mutating func pop() -> ItemType? {
        return items.removeLast()
    }
    
    mutating func push(_ item: ItemType) {
        self.append(item: item)
    }
}

protocol Insertable: Container {
    mutating func delete() -> ItemType?
    mutating func insert(_ item: ItemType)
}

extension Insertable {
    mutating func delete() -> ItemType? {
        return items.removeFirst()
    }
    mutating func insert(_ item: ItemType) {
        self.append(item: item)
    }
}

struct Stack<Element>: Popable {
    var items: [Element] = [Element]()
}

struct Queue<Element>: Insertable {
    var items: [Element] = [Element]()
}

var myIntStack: Stack<Int> = Stack<Int>()
var myStringStack: Stack<String> = Stack<String>()
var myIntQueue: Queue<Int> = Queue<Int>()
var myStringQueue: Queue<String> = Queue<String>()

myIntStack.push(3)
myIntStack.printSelf()

myIntStack.push(2)
myIntStack.printSelf()

myIntStack.pop()
myIntStack.printSelf()

myStringStack.push("A")
myStringStack.printSelf()

myStringStack.push("B")
myStringStack.printSelf()

myStringStack.pop()
myStringStack.printSelf()

myIntQueue.insert(3)
myIntQueue.printSelf()

myIntQueue.insert(2)
myIntQueue.printSelf()

myIntQueue.delete()
myIntQueue.printSelf()

myStringQueue.insert("A")
myStringQueue.printSelf()

myStringQueue.insert("B")
myStringQueue.printSelf()

myStringQueue.delete()
myStringQueue.printSelf()
*/

// 23-5

/*
let items: Array<Int> = [1,2,3]

let mappedItems: Array<Int> = items.map { (item: Int) -> Int in
    return item * 10
}

print(mappedItems)
*/

// 23-6, 7, 8, 9, 10

/*
protocol SelfPrintable {
    func printSelf()
}

extension SelfPrintable where Self: Container {
    func printSelf() {
        print(items)
    }
}

protocol Container: SelfPrintable {
    associatedtype ItemType  // 연관 타입
    
    var items: [ItemType] { get set }
    var count: Int { get }
    
    mutating func append(item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

extension Container {
    mutating func append(item: ItemType) {
        items.append(item)
    }
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> ItemType {
        return items[i]
    }
}

protocol Popable: Container {
    mutating func pop() -> ItemType?
    mutating func push(_ item: ItemType)
}

extension Popable {
    mutating func pop() -> ItemType? {
        return items.removeLast()
    }
    
    mutating func push(_ item: ItemType) {
        self.append(item: item)
    }
}

protocol Insertable: Container {
    mutating func delete() -> ItemType?
    mutating func insert(_ item: ItemType)
}

extension Insertable {
    mutating func delete() -> ItemType? {
        return items.removeFirst()
    }
    mutating func insert(_ item: ItemType) {
        self.append(item: item)
    }
}

struct Stack<Element>: Popable {
    var items: [Element] = [Element]()
    
    func map<T>(transform: (Element) -> T) -> Stack<T> {
        var transformedStack: Stack<T> = Stack<T>()
        
        for item in items {
            transformedStack.items.append(transform(item))
        }
        return transformedStack
    }
    
    func filter(includeElement: (Element) -> Bool) -> Stack<Element> {
        var filteredStack: Stack<ItemType> = Stack<ItemType>()
        
        for item in items {
            if includeElement(item) {
                filteredStack.items.append(item)
            }
        }
        return filteredStack
    }
    
    func reduce<T>(_ initialResult: T, nextPartialResult: (T, Element) -> T) -> T {
        var result: T = initialResult
        
        for item in items {
            result = nextPartialResult(result, item)
        }
        
        return result
    }
}

struct Queue<Element>: Insertable {
    var items: [Element] = [Element]()
}

var myIntStack: Stack<Int> = Stack<Int>()

myIntStack.push(1)
myIntStack.push(5)
myIntStack.push(2)
myIntStack.printSelf()
var myStrStack: Stack<String> = myIntStack.map{ "\($0)" }
myStrStack.printSelf()

let filteredStack: Stack<Int> = myIntStack.filter { (item: Int) -> Bool in
    return item < 5
}

filteredStack.printSelf()

let combinedInt: Int = myIntStack.reduce(100) { (result: Int, next: Int) -> Int in
    return result + next
}

print(combinedInt)

let combinedDouble: Double = myIntStack.reduce(100.0) { (result: Double, next: Int) -> Double in
    return result + Double(next)
}

print(combinedDouble)

let combinedString: String = myIntStack.reduce("") { (result: String, next: Int) -> String in
    return result + "\(next)"
}

print(combinedString)
*/

// 23-11

protocol SelfPrintable {
    func printSelf()
}

extension SelfPrintable {
    func printSelf() {
        print(self)
    }
}

extension Int: SelfPrintable {}
extension String: SelfPrintable {}
extension Double: SelfPrintable {}

1024.printSelf()
3.14.printSelf()
"hana".printSelf()
