import UIKit

// 27-1
/*
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "yagom")  // 인스턴스 참조횟수 : 1

reference2 = reference1  // 인스턴스 참조횟수 : 2
reference3 = reference1  // 인스턴스 참조횟수 : 3
  
reference3 = nil  // 인스턴스 참조횟수 : 2
reference2 = nil  // 인스턴스 참조횟수 : 1
reference1 = nil  // 인스턴스 참조횟수 : 0

// 참조 횟수가 0이 되는 순간 인스턴스는 ARC 규칙에 의해
// 메모리에서 해제되며 메모리에서 해제되기 직전에 디이니셜라이저 호출!!
*/


// 27-2

/*
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

func foo() {
    let yagom: Person = Person(name: "yagom")  // 이니셜라이저 호출
    // 인스턴스 참조횟수 : 1
    
    // 함수 종료 시점
    // 인스턴스 참조횟수 : 0
    // 디이니셜라이저 호출
}
foo()
*/


// 27-3

/*
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var globalReference: Person?

func foo() {
    let yagom: Person = Person(name: "yagom")  // 이니셜라이저 호출
    // 인스턴스 참조횟수 : 1
    
    globalReference = yagom
    // 인스턴스 참조횟수 : 2
    
    // 함수 종료 시점
    // 인스턴스 참조횟수 : 1
}
foo()
*/


// 27-4

/*
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var room: Room?
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Room {
    let number: String
    
    init(number: String) {
        self.number = number
    }
    
    var host: Person?
    
    deinit {
        print("Room \(number) is being deinitialized")
    }
}
*/

/*
var yagom: Person? = Person(name: "yagom")  // Person 인스턴스 참조횟수 : 1
var room: Room? = Room(number: "505")       // Room 인스턴스 참조횟수 : 1

// 서로 강한 참조를 하는 상태
room?.host = yagom   // Person 인스턴스 참조횟수 : 2
yagom?.room = room   // Room 인스턴스 참조횟수 : 2

yagom = nil    // Person 인스턴스 참조횟수 : 1
// yagom이 참조하던 인스턴스를 참조할 방법은 변수 room이 참조하는 인스턴스의
// host 프로퍼티로 접근하는 방법이 남아있는 상태, room변수가 아직 강한참조로 붙들고 있음!
room = nil     // Room 인스턴스 참조횟수 : 1
// room 변수가 참조하던 인스턴스는 참조 횟수가 감소하고
// Person 인스턴스를 참조할 방법 상실 - 메모리에 잔존
// Room 인스턴스를 참조할 방법 상실 - 메모리에 잔존

// 참조횟수 1을 남겨둔채 메모리에 좀비처럼 남아있음 -> 메모리 누수 발생(디이셜라이저가 호출되지 않았음)
*/


// 27-5

/*
// 강한참조 순환 문제를 수동으로 해결
var yagom: Person? = Person(name: "yagom")  // Person 인스턴스 참조횟수 : 1
var room: Room? = Room(number: "505")  // Room 인스턴스 참조횟수 : 1

room?.host = yagom  // Person 인스턴스 참조횟수 : 2
yagom?.room = room  // Room 인스턴스 참조횟수 : 2

yagom?.room = nil   // Room 인스턴스 참조횟수 : 1
yagom = nil         // Person 인스턴스 참조횟수 : 1

room?.host = nil    // Person 인스턴스 참조횟수 : 0
// 디이니셜라이저 실행
room = nil          // Room 인스턴스 참조횟수 : 0
// 디이니셜라이저 실행
*/


// 27-6

/*
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var room: Room?
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Room {
    let number: String
    
    init(number: String) {
        self.number = number
    }
    
    weak var host: Person?  // 약한참조 -> 참조횟수 증가시키지 않음!
    
    deinit {
        print("Room \(number) is being deinitialized")
    }
}

var yagom: Person? = Person(name: "yagom")  // Person 인스턴스 참조횟수 : 1
var room: Room? = Room(number: "505")       // Room 인스턴스 참조횟수 : 1
  
room?.host = yagom    // Person 인스턴스 참조횟수 : 1 (약한참조 -> 참조횟수 증가시키지 않음!)
yagom?.room = room    // Room 인스턴스 참조횟수 : 2

yagom = nil           // Person 인스턴스 참조횟수 : 0, Room 인스턴스 참조횟수 : 1
// 인스턴스가 메모리에서 해제될 때, 자신의 프로퍼티가 강한 참조하던(199줄) 인스턴스의 참조 횟수를 1 감소 시킴!!!
print(room?.host) // host 프로퍼티는 약한참조하기 때문에 자신이 참조하는 인스턴스가 메모리에서 해제되면 자동으로 nil 할당

room = nil            // Room 인스턴스 참조횟수 : 0
*/


// 27-7
/*
class Person {
    let name: String
    
    // 카드를 소지할 수도, 소지하지 않을 수도 있기 때문에 옵셔널!
    // 또, 카드를 한 번 가진 후 잃어버리면 안 되기 때문에 강한참조해야함!
    var card: CreditCard?  // 강한참조하는 card 프로퍼티
    
    init(name: String) {
        self.name = name
    }
    
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt
    unowned let owner: Person   // 미소유참조 owner 프로퍼티, 카드는 소유자가 분명히 존재해야 함
    
    init(number: UInt, owner: Person) {
        self.number = number
        self.owner = owner
    }
    
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var jisoo: Person? = Person(name: "jisoo")  // Person 인스턴스의 참조 횟수 : 1

if let person: Person = jisoo {
    // CreditCard 인스턴스의 참조 횟수 : 1
    person.card = CreditCard(number: 1004, owner: person)  // owner는 미소유참조하기 때문에 Person 증가x
    // Person 인스턴스의 참조 횟수 : 1
}

jisoo = nil  // Person 인스턴스의 참조 횟수 : 0
// jisoo 변수가 강한참조하던 인스턴스가 메모리에서 해제되므로 그 인스턴스의
// card 프로퍼티가 강한참조하던 CreditCard 클래스의 인스턴스(244줄)도 참조 횟수가 1 감소되어 메모리에서 해제됨
// CreditCard 인스턴스의 참조 횟수 : 0

*/


// 27-8

/*
class Department {
    var name: String
    var subjects: [Subject] = [] // 강한참조

    init(name: String) {
        self.name = name
    }
}

class Subject {
    var name: String
    unowned var department: Department  // 학과 - 미소유참조
    unowned var nextSubject: Subject?   // 수강해야하는 다음 과목 - 미소유 옵셔널 참조
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextSubject = nil  // 유효한 객체를 가리키지 않기 때문에 nil
    }
}

let department = Department(name: "Computer Science")

let intro = Subject(name: "Computer Architecture", in: department)
let intermediate = Subject(name: "Swift Language", in: department)
let advanced = Subject(name: "iOS App Programming", in: department)

// 다음 수강 과목을 미소유 옵셔널 참조로 nextSubject 프로퍼티에 저장
intro.nextSubject = intermediate
intermediate.nextSubject = advanced
department.subjects = [intro, intermediate, advanced]
*/


// 27-9

/*
class Company {
    let name: String
    // 암시적 추출 옵셔널을 사용한 이유는 Company 타입의 인스턴스를 초기화 할 때,
    // CEO 타입의 인스턴스를 생성하는 과정에서 자기 자신을 참조하도록 보내줘야 하기 때문
    var ceo: CEO!  // 최고 경영자는 꼭 있어야함
    
    init(name: String, ceoName: String) {
        self.name = name
        self.ceo = CEO(name: ceoName, company: self)
    }
    
    func introduce() {
        print("\(name)의 CEO는 \(ceo.name)입니다.")
    }
}

class CEO {
    let name: String
    unowned let company: Company  // 회사가 사라지면 최고 경영자가 있을 의미가 없기 때문에 강한참조 사용하지 않음
                                  // 최고경영자는 회사를 꼭 운영하고 있어야 하므로 옵셔널이 될 수 없음(약한참조 불가)
                                  // => 미소유 참조 사용
    init(name: String, company: Company) {
        self.name = name
        self.company = company
    }
    func introduce() {
        print("\(name)는 \(company.name)의 CEO입니다.")
    }
}

let company: Company = Company(name: "무한상사", ceoName: "김태호")
company.introduce()
company.ceo.introduce()
*/


// 27-10

/*
// 클로저의 강한참조 순환 문제
class Person {
    let name: String
    let hobby: String?
    
    // 지연 저장 프로퍼티
    // 클로저 내부에서 self 프로퍼티 사용할 수 있었던 건 지연저장프로퍼티 덕분
    lazy var introduce: () -> String = {
        var introduction: String = "My name is \(self.name)."
        
        guard let hobby = self.hobby else {
            return introduction
        }
        
        introduction += " "
        introduction += "My hobby is \(hobby)"
        
        return introduction
    }
    
    init(name: String, hobby: String? = nil) {
        self.name = name
        self.hobby = hobby
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var yagom: Person? = Person(name: "yagom", hobby: "eating")
print(yagom?.introduce())
// introduce()프로퍼티를 통해 클로저를 호출하면, 클로저는 자신의 내부에 있는 참조 타입 변수 등을 획득
// 클로저는 자신이 호출되면 언제든지 자신 내부의 참조들을 사용할 수 있도록 참조 횟수를 증가시켜 메모리에서 해제되는 것 방지하는데
// 이때 자신을 프로퍼티로 갖는 인스턴스의 참조 횟수도 증가시킴

yagom = nil   // nil을 할당했지만 디이니셜라이저가 호출되지 않음 -> 메모리 누수 발생
*/


// 27-11

/*
// 값 타입에서의 획득목록
var a = 0
var b = 0
let closure = { [a] in
    print(a, b)
    b = 20
}

a = 10
b = 10
closure()
// a 변수는 클로저가 생성됨과 동시에 획득목록 내에서 다시 a라는 이름의 상수로 초기화된 것
// 때문에 외부에서 a값을 변경하더라도 클로저의 획득목록을 통한 a와는 별개가 되는 것

print(b)
*/


// 27-12

/*
// 참조타입에서의 획득목록
class SimpleClass {
    var value: Int = 0
}

var x = SimpleClass()
var y = SimpleClass()

let closure = { [x] in
    print(x.value, y.value)
}

x.value = 10
y.value = 10

closure()
// 변수 x는 획득목록을 통해 값을 획득했지만 y는 획득목록에 명시되지 않았음 하지만 동작은 같음
// 두 변수 모두 참조 타입의 인스턴스가 있기 때문임
// 그렇지만 참조 타입은 획득목록에서 어떤 방식으로 참조할 것인지 정할 수 있음!
*/


// 27-13

/*
class SimpleClass {
    var value: Int = 0
}

var x: SimpleClass? = SimpleClass()
var y = SimpleClass()

// x -> 약한참조, y -> 미소유참조

// x는 클로저내부에서 사용하더라도 x가 참조하는 인스턴스의 참조 횟수 증가x
// 그렇게 되면 x가 참조하는 인스턴스가 메모리에서 해제되어 클로저 내부에서도 더이상 참조 불가능

// y는 미소유참조했기 때문에 클로저가 참조횟수를 증가시키진 않지만
// 만약 메모리에서 해제된 상태에서 사용하려한다면 실행중에 오류로 강제 종료 가능성 있음

let closure = { [weak x, unowned y] in
    print(x?.value, y.value)
}

x = nil
y.value = 10

closure()
*/


// 27-14


class Person {
    let name: String
    let hobby: String?
    
    lazy var introduce: () -> String = { [unowned self] in
        var introduction: String = "My name is \(self.name)."
        
        guard let hobby = self.hobby else {
            return introduction
        }
        
        introduction += " "
        introduction += "My hobby is \(hobby)."
        return introduction
    }
    
    init(name: String, hobby: String? = nil) {
        self.name = name
        self.hobby = hobby
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var yagom: Person? = Person(name: "yagom", hobby: "eating")
print(yagom?.introduce())
yagom = nil



