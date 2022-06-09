import UIKit

//11-1
/*
class SomeClass {
    init() {
        // 초기화할 떄 필요한 코드
    }
}

struct SomeStruct {
    init() {
        // 초기화할 때 필요한 코드
    }
}

enum SomeEnum {
case someCase
    init() {
        // 열거형은 초기화할 때 반드시 case 중 하나가 되어야 함
        self = .someCase
        // 초기화할 때 필요한 코드
    }
}
*/


//11-2
/*
//이니셜라이저로 저장프로퍼티에 초깃값 설정
struct Area {
    var squareMeter: Double
    
    init() {
        squareMeter = 0.0  // squareMeter의 초깃값 할당
    }
}

let room: Area = Area()
print(room.squareMeter)
*/


//11-3
/*
// 프로퍼티를 정의할 떄 프로퍼티에 기본값을 할당하는 방식
struct Area {
    var squareMeter: Double = 0.0
}

let room: Area = Area()
print(room.squareMeter)
*/


//11-4
/*
struct Area {
    var squareMeter: Double
    
    // 전달인자 레이블 fromPy
    init(fromPy py: Double) {
        squareMeter = py * 3.3058
    }
    
    init(fromSquareMeter squareMeter: Double) {
        self.squareMeter = squareMeter
    }
    
    init(value: Double) {
        squareMeter = value
    }
    
    // 전달인자 레이블이 필요없다면 와일드카드 식별자(_) 사용
    init(_ value: Double) {
        squareMeter = value
    }
    
}

let roomOne: Area = Area(fromPy: 15.0)
print(roomOne.squareMeter)

let roomTwo: Area = Area(fromSquareMeter: 33.06)
print(roomTwo.squareMeter)

let roomThree: Area = Area(value: 30.0)
let roomFour: Area = Area(55.0)

//사용자 정의 이니셜라이저를 만들면 기존의 이니셜라이저(init())는 별도로 구현하지 않는 이상 사용할 수 x

*/


//11-5
/*
class Person {
    var name: String
    var age: Int?   //옵셔널 프로퍼티 타입, 초기화 과정에서 값을 할당해주지 않으면 자동으로 nil 할당
    
    init(name: String) {
        self.name = name
    }
}

let yagom: Person = Person(name: "yagom")
print(yagom.name)
print(yagom.age)

yagom.age = 99
print(yagom.age)

yagom.name = "Eric"
print(yagom.name)
*/


//11-6

/*
class Person {
    let name: String  // 상수 프로퍼티
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let yagom: Person = Person(name: "yagom")
//yagom.name = "Eric"   //상수 프로퍼티는 인스턴스를 초기화하는 과정에서만 할당 가능!!! 할당 이후로는 변경 불가함!!
*/


//11-7
/*
struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

let point: Point = Point(x: 0, y: 0)
print(point)
let size: Size = Size(width: 50.0, height: 50.0)
print(size)

// 구조체의 저장 프로퍼티에 기본값이 있는 경우
// 필요한 매개변수만 사용하여 초기화할 수도 있음
let somePoint: Point = Point()
print(somePoint)
let someSize: Size = Size(width: 50)
print(someSize)
let anotherPoint: Point = Point(y: 100)
print(anotherPoint)
*/


//11-8
/*
enum Student {
    case elementary, middle, high
    case none
    
    // 사용자 정의 이니셜라이저가 있는 경우, init() 메서드를 구현해주어야 기본 이니셜라이저를 사용할 수 있음
    init() {
        self = .none
    }
    
    init(koreanAge: Int) {  // 첫 번째 사용자 정의 이니셜라이저
        switch koreanAge {
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            self = .none
        }
    }
    
    //태어난 해와 현재 연도를 전달받아 나이로 계산한 후 첫 번째 이니셜라이저에 초기화를 위임!!
    init(bornAt: Int, currentYear: Int) {  // 두 번째 사용자 정의 이니셜라이저
        self.init(koreanAge: currentYear - bornAt + 1)   // 초기화 위임
    }
}

var younger: Student = Student(koreanAge: 16)
print(younger)

younger = Student(bornAt: 1998, currentYear: 2016)
print(younger)
*/


//11-9
/*
class Person {
    let name: String
    var age: Int?
    
    //실패 가능한 이니셜라이저
    init?(name: String) {
        if name.isEmpty {  //실패했을 때 nil 반환
            return nil
        }
        self.name = name
    }
    
    //실패 가능한 이니셜라이저
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0 {  //실패했을 때 nil 반환
            return nil
        }
        self.name = name
        self.age = age
    }
}

let yagom: Person? = Person(name: "yagom", age: 99)

if let person: Person = yagom {
    print(person.name)
} else {
    print("Person wasn't initialized")
}

let chope: Person? = Person(name: "chope", age: -10)

if let person: Person = chope {
    print(person.name)
} else {
    print("Person wasn't initialized")
}

let eric: Person? = Person(name: "", age: 30)

if let person: Person = eric {
    print(person.name)
} else {
    print("Person wasn't initialized")
}
*/


//11-10
/*
enum Student: String {
    case elementary = "초등학생", middle = "중학생", high = "고등학생"
    
    init?(koreanAge: Int) {
        switch koreanAge {
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            return nil
        }
    }
    
    init?(bornAt: Int, currentYear: Int) {
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var younger: Student? = Student(koreanAge: 20)
print(younger)

younger = Student(bornAt: 2020, currentYear: 2016)
print(younger)

//원시값 사용하고 싶을 때 rawValue 사용
//올바르지 않은 원시값을 통해 생성할때 nil 반환
younger = Student(rawValue: "대학생")
print(younger)

younger = Student(rawValue: "고등학생")
print(younger)
*/


//11-11
/*
class SomeClass {
    let someProperty: SomeType = {
        // 새로운 인스턴스를 생성하고 사용자 정의 연산을 통한 후 반환해줌
        // 반환되는 값의 타입은 SomeType과 같은 타입이어야함
        return someValue
    } ()
    // 클로저 뒤에 소괄호가 붙는 이유: 클로저를 실행하기 위해서
    // 클로저가 실행한 결괏값은 프로퍼티의 기본값이 됨. 소괄호가 없다면 프로퍼티의 기본값은 클로저 그 자체가 됨
}
*/


//11-12
/*
struct Student {
    var name: String?
    var number: Int?
}

class SchoolClass {
    var students: [Student] = {   // 배열
        // 새로운 인스턴스를 생성하고 사용자 정의 연산을 통한 후 반환해줌
        // 반환되는 값의 타입은 [Student] 타입이어야 함
        var arr: [Student] = [Student]()
        
        for num in 1...15 {
            var student: Student = Student(name: nil, number: num)
            arr.append(student)
        }
        return arr
    }()    //클로저가 호출되면서 연산 결괏값을 프로퍼티 기본값으로 제공
}

//SchoolClass 클래스의 인스턴스를 초기화하면 students 프로퍼티의 기본값을 제공하기 위해
//클로저가 동작하고 1번부터 15번까지의 학생을 생성하여 배열에 할당
//즉 myClass 인스턴스는 생성되자마자 students 프로퍼티에 15명의 학생이 있는 상태가 되는 것
let myClass: SchoolClass = SchoolClass()
print(myClass.students.count)
*/


//11-14

class FileManager {
    var fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    func openFile() {
        print("Open File: \(self.fileName)")
    }
    func modifyFile() {
        print("Modify File: \(self.fileName)")
    }
    func writeFile() {
        print("Write File: \(self.fileName)")
    }
    func closeFile() {
        print("Close File: \(self.fileName)")
    }
    deinit {
        print("Deinit instance")
        self.writeFile()
        self.closeFile()
    }
}

var fileManager: FileManager? = FileManager(fileName: "abc.txt")

if let manager: FileManager = fileManager {
    manager.openFile()
    manager.modifyFile()
}

fileManager = nil
//디이니셜라이저 실행!


