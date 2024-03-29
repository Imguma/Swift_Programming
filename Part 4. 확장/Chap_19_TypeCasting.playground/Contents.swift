import UIKit

// 19-4

/*
// Coffee는 Latte나 Americano인척 할 수 없음
// Latte나 Americano는 Coffee인척 할 수 있음 (커피는 라떼랑 아메리카노 안에 포함되니까)
class Coffee {
    let name: String
    let shot: Int
    
    var description: String {
        return "\(shot) shot(s) \(name)"
    }
    init(shot: Int) {
        self.shot = shot
        self.name = "coffee"
    }
}

class Latte: Coffee {
    var flavor: String
    
    override var description: String {
        return "\(shot) shot(s) \(flavor) latte"
    }
    
    init(flavor: String, shot: Int) {
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano: Coffee {
    let iced: Bool
    
    override var description: String {
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }
    
    init(shot: Int, iced: Bool) {
        self.iced = iced
        super.init(shot: shot)
    }
}

let coffee: Coffee = Coffee(shot: 1)
print(coffee.description)

let myCoffee: Americano = Americano(shot: 2, iced: false)
print(myCoffee.description)

let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)
print(yourCoffee.description)

print(coffee is Coffee)    // T
print(coffee is Americano) // F
print(coffee is Latte)     // F

print(myCoffee is Coffee)  // T
print(yourCoffee is Coffee)// T

print(myCoffee is Latte)   // F
print(yourCoffee is Latte) // T
*/


// 19-6

/*
protocol SomeProtocol {}
class SomeClass: SomeProtocol {}

let intType: Int.Type = Int.self
let stringType: String.Type = String.self
let classType: SomeClass.Type = SomeClass.self
let protocolProtocol: SomeProtocol.Protocol = SomeProtocol.self

var someType: Any.Type

someType = intType
print(someType)

someType = stringType
print(someType)

someType = classType
print(someType)

someType = protocolProtocol
print(someType)
*/


// 19-19

/*
class Coffee {
    let name: String
    let shot: Int
    
    var description: String {
        return "\(shot) shot(s) \(name)"
    }
    init(shot: Int) {
        self.shot = shot
        self.name = "coffee"
    }
}

class Latte: Coffee {
    var flavor: String
    
    override var description: String {
        return "\(shot) shot(s) \(flavor) latte"
    }
    
    init(flavor: String, shot: Int) {
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano: Coffee {
    let iced: Bool
    
    override var description: String {
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }
    
    init(shot: Int, iced: Bool) {
        self.iced = iced
        super.init(shot: shot)
    }
}

let coffee: Coffee = Coffee(shot: 1)
//print(coffee.description)

let myCoffee: Americano = Americano(shot: 2, iced: false)
//print(myCoffee.description)

let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)
//print(yourCoffee.description)

//실패할 가능성 있는 조건부 연산자 as?
//만약 coffee가 참조하는 인스턴스가 Americano 타입의 인스턴스라면
//actingOne 임시 상수에 할당하라!
if let actingOne: Americano = coffee as? Americano {
    print("This is Americano")
} else {
    print(coffee.description)
}

if let actingOne: Latte = coffee as? Latte {
    print("This is Latte")
} else {
    print(coffee.description)
}

if let actingOne: Coffee = coffee as? Coffee {
    print("This is Just Coffee")
} else {
    print(coffee.description)
}

if let actingOne: Americano = myCoffee as? Americano {
    print("This is Americano")
} else {
    print(coffee.description)
}

if let actingOne: Latte = myCoffee as? Latte {
    print("This is Latte")
} else {
    print(coffee.description)
}

if let actingOne: Coffee = myCoffee as? Coffee {
    print("This is Just Coffee")
} else {
    print(coffee.description)
}

// 강제 연산자 as!
let castedCoffee: Coffee = yourCoffee as! Coffee

// 런타임 오류!
//let castedAmericano: Americano = coffee as! Americano
*/


// 19-11

/*
class Coffee {
    let name: String
    let shot: Int
    
    var description: String {
        return "\(shot) shot(s) \(name)"
    }
    init(shot: Int) {
        self.shot = shot
        self.name = "coffee"
    }
}

class Latte: Coffee {
    var flavor: String
    
    override var description: String {
        return "\(shot) shot(s) \(flavor) latte"
    }
    
    init(flavor: String, shot: Int) {
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano: Coffee {
    let iced: Bool
    
    override var description: String {
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }
    
    init(shot: Int, iced: Bool) {
        self.iced = iced
        super.init(shot: shot)
    }
}

// 해당 인스턴스가 어떤 타입의 인스턴스인지 확인
func checkType(of item: AnyObject) {
    if item is Latte {
        print("item is Latte")
    } else if item is Americano {
        print("item is Americano")
    } else if item is Coffee {
        print("item is Coffee")
    } else {
        print("Unknown Type")
    }
}

let coffee: Coffee = Coffee(shot: 1)
let myCoffee: Americano = Americano(shot: 2, iced: false)
let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)
let actingConstant: Coffee = Latte(flavor: "vanilla", shot: 2)

checkType(of: coffee)
checkType(of: myCoffee)
checkType(of: yourCoffee)
checkType(of: actingConstant)
*/


// 19-12

/*
class Coffee {
    let name: String
    let shot: Int
    
    var description: String {
        return "\(shot) shot(s) \(name)"
    }
    init(shot: Int) {
        self.shot = shot
        self.name = "coffee"
    }
}

class Latte: Coffee {
    var flavor: String
    
    override var description: String {
        return "\(shot) shot(s) \(flavor) latte"
    }
    
    init(flavor: String, shot: Int) {
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano: Coffee {
    let iced: Bool
    
    override var description: String {
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }
    
    init(shot: Int, iced: Bool) {
        self.iced = iced
        super.init(shot: shot)
    }
}

// 어떤 타입인지 판단하는 동시에 실질적으로 해당 타입의 인스턴스로 사용할수 있도록 캐스팅
func castTypeToAppropriate(item: AnyObject) {
    if let castedItem: Latte = item as? Latte {
        print(castedItem.description)
    } else if let castedItem: Americano = item as? Americano {
        print(castedItem.description)
    } else if let castedItem: Coffee = item as? Coffee {
        print(castedItem.description)
    } else {
        print("Unknown Type")
    }
}

let coffee: Coffee = Coffee(shot: 1)
let myCoffee: Americano = Americano(shot: 2, iced: false)
let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)
let actingConstant: Coffee = Latte(flavor: "vanilla", shot: 2)

castTypeToAppropriate(item: coffee)
castTypeToAppropriate(item: myCoffee)
castTypeToAppropriate(item: yourCoffee)
castTypeToAppropriate(item: actingConstant)
*/


// 19-13

class Coffee {
    let name: String
    let shot: Int
    
    var description: String {
        return "\(shot) shot(s) \(name)"
    }
    init(shot: Int) {
        self.shot = shot
        self.name = "coffee"
    }
}

class Latte: Coffee {
    var flavor: String
    
    override var description: String {
        return "\(shot) shot(s) \(flavor) latte"
    }
    
    init(flavor: String, shot: Int) {
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano: Coffee {
    let iced: Bool
    
    override var description: String {
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }
    
    init(shot: Int, iced: Bool) {
        self.iced = iced
        super.init(shot: shot)
    }
}

// Any는 모든 타입의 인스턴스
func checkAnyType(of item: Any) {
    switch item {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let latte as Latte:
        print(latte.description)
    case let stringConverter as (String) -> String:
        print(stringConverter("yagom"))
    default:
        print("something else : \(type(of: item))")
    }
}

let coffee: Coffee = Coffee(shot: 1)
let myCoffee: Americano = Americano(shot: 2, iced: false)
let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)
let actingConstant: Coffee = Latte(flavor: "vanilla", shot: 2)

checkAnyType(of: 0)
checkAnyType(of: 0.0)
checkAnyType(of: 42)
checkAnyType(of: 3.14159)
checkAnyType(of: -0.25)
checkAnyType(of: "hello")
checkAnyType(of: (3.0, 5.0))
checkAnyType(of: yourCoffee)
checkAnyType(of: coffee)
checkAnyType(of: { (name: String) -> String in "Hello, \(name)" })
