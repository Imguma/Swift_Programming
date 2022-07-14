import UIKit


/*
// 28-1

enum VendingMachineError: Error {
    case invalidSelection  // 유효하지 않은 선택
    case insufficientFunds(coinsNeeded: Int)  // 자금부족 - 필요한 동전 개수
    case outOfStock  // 품절
}


// 28-3

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Biscuit": Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func dispense(snack: String) {
        print("\(snack) 제공")
    }
    
    func vend(itemNamed name: String) throws {
        
        guard let item = self.inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= self.coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - self.coinsDeposited)
        }
        
        self.coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        self.inventory[name] = newItem
        
        self.dispense(snack:name)
    }
}

let favoriteSnacks = [
    "yagom": "Chips",
    "jinsung": "Biscuit",
    "heejin": "Chocolate"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    tryingVend(itemNamed: snackName, vendingMachine: vendingMachine)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) {
        tryingVend(itemNamed: name, vendingMachine: vendingMachine)
        self.name = name
    }
}

func tryingVend(itemNamed: String, vendingMachine: VendingMachine) {
    do {
        try vendingMachine.vend(itemNamed: itemNamed)
    } catch VendingMachineError.invalidSelection {
        print("유효하지 않은 선택")
    } catch VendingMachineError.outOfStock {
        print("품절")
    } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
        print("자금 부족 - 동전 \(coinsNeeded)개를 추가로 지급해주세요.")
    } catch {
        print("그 외 오류 발생 : ", error)
    }
}
let machine: VendingMachine = VendingMachine()
machine.coinsDeposited = 20

var purchase: PurchasedSnack = PurchasedSnack(name: "Biscuit", vendingMachine: machine)

print(purchase.name)

purchase = PurchasedSnack(name: "Ice Cream", vendingMachine: machine)

print(purchase.name)

for (person, favoriteSnack) in favoriteSnacks {
    print(person, favoriteSnack)
    try buyFavoriteSnack(person: person, vendingMachine: machine)
}
*/


// 28-4

/*
func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        throw SomeError.justSomeError
    }
    return 100
}

// try? 표현을 사용하여 호출한 함수가 오류를 던지면 반환 값이 nil로 반환됨
// 오류가 발생하지 않으면 옵셔널 값으로 반환됨
let x: Optional = try? someThrowingFunction(shouldThrowError: true)
print(x)

let y: Optional = try? someThrowingFunction(shouldThrowError: false)
print(y)
*/


// 28-6

/*
func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        throw SomeError.justSomeError
    }
    return 100
}

let y: Int = try! someThrowingFunction(shouldThrowError: false)
print(y)

//let x: Int = try! someThrowingFunction(shouldThrowError: true) // 런타임 오류
*/


// 28-7

/*
// 오류를 던지는 함수
func someThrowingFunction() throws {
    enum SomeError: Error {
        case justSomeError
    }
    throw SomeError.justSomeError
}

// 다시 던지기 함수

// someFunction을 보면 매개변수로 throws를 해주므로
// rethrows를 통해 자신의 매개변수로 전달받은 함수가 오류를 던짐
func someFunction(callback: () throws -> Void) rethrows {
    try callback()  // 다시 던지기 함수는 오류를 다시 던질 뿐 따로 처리하지 않음!
}

// try로 somFunction을 통해 somThrowinFunction 오류를 rethrows해주고
// 그것에 대한 반환된 오류를 catch 해줘서 print를 해주는 것
do {
    try someFunction(callback: someThrowingFunction)
} catch {
    print(error)
}
*/


// 28-8

/*
// 오류를 던지는 함수
func someThrowingFunction() throws {
    enum SomeError: Error {
        case justSomeError
    }
    
    throw SomeError.justSomeError
}

// 다시 던지기 함수
func someFunction(callback: () throws -> Void) rethrows {
    enum AnotherError: Error {
        case justAnotherError
    }
    
    do {
        // 매개변수로 전달한 오류 던지기 함수이므로
        // catch 절에서 제어할 수 있음
        try callback()
    } catch {
        throw AnotherError.justAnotherError
    }
    
    do {
        // 매개변수로 전달한 오류 던지기 함수가 아니므로
        // catch 절에서 제어할 수 없음
        try someThrowingFunction()
    } catch {
        // 오류 발생
        throw AnotherError.justAnotherError
    }
    
    // catch 절 외부에서 단독으로 오류를 던질 수는 없음. 오류 발생
    throw AnotherError.justAnotherError
}
*/


// 28-9

/*
protocol SomeProtocol {
    func someThrowingFunctionFromProtocol(callback: () throws -> Void) throws
    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) rethrows
}

class SomeClass: SomeProtocol {
    func someThrowingFunction(callback: () throws -> Void) throws { }
    func someFunction(callback: () throws -> Void) rethrows { }
    
    // 던지기 메서드는 다시 던지기 메서드를 요구하는 프로토콜을 충족할 수 없음. 오류!
    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) throws { }
    // 다시 던지기 메서드는 던지기 메서드를 요구하는 프로토콜의 요구사항에 부합!
    func someThrowingFunctionFromProtocol(callback: () throws -> Void) rethrows { }
}

class SomeChildClass: SomeClass {
    // 부모클래스의 던지기 메서드는 자식클래스에서 다시 던지기 메서드로 재정의 할 수 있음!
    override func someThrowingFunction(callback: () throws -> Void) rethrows { }
    // 부모클래스의 다시 던지기 메서드는 자식클래스에서 던지기 메서드로 재정의 할 수 없음. 오류!
    override func someFunction(callback: () throws -> Void) throws { }
}
*/


// 28-12

/*
func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
    defer {
        print("First")
    }
    
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        throw SomeError.justSomeError
    }
    defer {
        print("Second")
    }
    defer {
        print("Third")
    }
    return 100
}

try? someThrowingFunction(shouldThrowError: true)
// 오류를 던지기 직전까지 작성된 defer구문까지만 실행됨

try? someThrowingFunction(shouldThrowError: false)
*/


// 28-13

func someFunction() {
    print("1")
    
    defer {
        print("2")
    }
    
    do {
        defer {
            print("3")
        }
        print("4")
    }
    defer {
        print("5")
    }
    print("6")
}

someFunction()
