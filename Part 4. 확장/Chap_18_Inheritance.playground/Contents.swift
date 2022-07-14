import UIKit

// 18-1, 2, 3

/*
class Person { // 기반 클래스
    var name: String = ""
    var age: Int = 0
    
    var introduction: String {
        return "이름 : \(name). 나이: \(age)"
    }
    
    func speak() {
        print("가나다라마바사")
    }
}

class Student: Person {
    var grade: String = "F"
    
    func study() {
        print("Study hard...")
    }
}

class University: Student {
    var major: String = ""
}

let yagom: Person = Person()
yagom.name = "yagom"
yagom.age = 99
print(yagom.introduction)
yagom.speak()

let jay: Student = Student()
jay.name = "jay"
jay.age = 10
jay.grade = "A"
print(jay.introduction)
jay.speak()
jay.study()

let jenny: University = University()
jenny.major = "Art"
jenny.speak()
jenny.study()
*/


// 18-4
/*
class Person {
    var name: String = ""
    var age: Int = 0
    
    var introduction: String {
        return "이름 : \(name). 나이 : \(age)"
    }
    
    func speak() {
        print("가나다라마바사")
    }
    // 타입메서드 -> 타입 자체에 호출이 가능한 메서드
    // 클래스 타입은 static, class 키워드 사용 가능
    // static은 상속후 재정의 x, class는 상속후 재정의 o
    class func introductionClass() -> String {
        return "인류의 소원은 평화입니다."
    }
}

class Student: Person {
    var grade: String = "F"
    
    func study() {
        print("Study hard...")
    }
    
    override func speak() {  // 재정의
        print("저는 학생입니다.")
    }
}

class UniversityStudent: Student {
    var major: String = ""
    
    class func introductionClass() {
        print(super.introductionClass())
    }
    
    override class func introductionClass() -> String {  // 재정의
        return "대학생의 소원은 A+입니다."
    }
    
    override func speak() {
        super.speak()
        print("대학생이죠.")
    }
}

let yagom: Person = Person()
yagom.speak()

let jay: Student = Student()
jay.speak()

let jenny: UniversityStudent = UniversityStudent()
jenny.speak()

print(Person.introductionClass())
print(Student.introductionClass())
print(UniversityStudent.introductionClass() as String)  // as 타입캐스팅 (19장)
UniversityStudent.introductionClass() as Void
*/


// 18-5

/*
class Person {
    var name: String = ""
    var age: Int = 0
    var koreanAge: Int {   // 읽기 전용 연산 프로퍼티
        return self.age + 1
    }
    
    var introduction: String {  // 연산 프로퍼티
        return "이름 : \(name). 나이 : \(age)"
    }
}

class Student: Person {
    var grade: String = "F"
    
    override var introduction: String {  // 학점 정보 추가하도록 재정의
        return super.introduction + " " + "학점 : \(self.grade)"
    }
    
    override var koreanAge: Int {  //읽기 쓰기 모두 가능하도록 재정의
        get {
            return super.koreanAge
        }
        set {
            self.age = newValue - 1
        }
    }
}

let yagom: Person = Person()
yagom.name = "yagom"
yagom.age = 55
//yagom.koreanAge = 56   // 읽기 전용이므로 오류
print(yagom.introduction)
print(yagom.koreanAge)

let jay: Student = Student()
jay.name = "jay"
jay.age = 14
jay.koreanAge = 15
print(jay.introduction)
print(jay.koreanAge)
*/


// 18-6

/*
class Person {
    var name: String = ""
    var age: Int = 0 {  // age 저장 프로퍼티의 프로퍼티 감시자
        didSet {
            print("(1) Person age : \(self.age)")
        }
    }
    var koreanAge: Int {  // 연산 프로퍼티
        return self.age + 1
    }
    var fullName: String {  // 연산 프로퍼티
        get {
            return self.name
        }
        set {
            self.name = newValue
        }
    }
}

class Student: Person {
    var grade: String = "F"
    
    override var age: Int {  // age 저장 프로퍼티의 프로퍼티 감시자 재정의
        didSet {
            print("(2) Student age : \(self.age)")
        }
    }
    
    override var koreanAge: Int {  // 연산 프로퍼티 재정의
        get {
            return super.koreanAge
        }
        set {
            self.age = newValue - 1  // 15 - 1 = 14
        }
        
        //didSet {}  //프로퍼티 접근자/설정자와 프로퍼티 감시자 동시에 정의 불가능!
    }
    
    override var fullName: String {  // 연산 프로퍼티 재정의
        didSet {
            print("Full Name : \(self.fullName)")
        }
    }
}

let yagom: Person = Person()
yagom.name = "yagom"
yagom.age = 55
yagom.fullName = "Jo yagom"
print(yagom.koreanAge)

let jay: Student = Student()
jay.name = "jay"
// 부모클래스에서 age 저장 프로퍼티에 이미 프로퍼티 감시자를 정의했기때문에
// 값을 할당할 때 Person에 정의한 감시자와 Student에 정의한 감시자 모두 동작
jay.age = 14

jay.koreanAge = 15

jay.fullName = "Kim jay"
print(jay.koreanAge)

print()

// 18-7

class School {
    var students: [Student] = [Student]()
    
    subscript(number: Int) -> Student {
        print("School subscript")
        return students[number]
    }
}

class MiddleSchool: School {
    var middleStudents: [Student] = [Student]()
    
    override subscript(index: Int) -> Student {
        print("MiddleSchool subscript")
        return middleStudents[index]
    }
}

let university: School = School()
university.students.append(Student())
university[0]

let middle: MiddleSchool = MiddleSchool()
middle.middleStudents.append(Student())
middle[0]
*/


// 18-9

/*
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Student: Person {
    var major: String
    
    init(name: String, age: Int, major: String) {  // 지정 이니셜라이저
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 7, major: "")
    }
}

// 1. Student클래스의 지정이니셜라이저는 부모클래스의 지정 이니셜라이저를 호출하기 전에
// 자신의 self 프로퍼티를 이용해 major 프로퍼티의 값을 할당 (안전확인 1번)

// 2. super.init을 통해 부모클래스의 이니셜라이저를 호출했으며 그 외에 상속받은 프로퍼티가
// 없으므로 부모의 이니셜라이저 호출 이후에 값을 할당해줄 프로퍼티가 없음 (안전확인 2번)

// 3. 편의 이니셜라이저는 따로 차후에 값을 할당할 프로퍼티가 없고 다른 이니셜라이저를 호출함 (안전확인 3번)

// 4. 이니셜라이저 어디에서도 인스턴스 메서드를 호출하거나 인스턴스 프로퍼티의 값을 읽어오지 않았음 (안전확인 4번)

// -> 안전확인 후 1단계, 2단계 초기화 과정을 마치게 됨.
*/


// 18-10

/*
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 0)
    }
}

class Student: Person {
    var major: String
    
    override init(name: String, age: Int) { // 지정 이니셜라이저는 재정의를 위해 override 사용
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    
    convenience init(name: String) {  // 부모클래스의 편의 이니셜라이저와 동일한 편의 이니셜라이저 정의 -> override 사용 x
        self.init(name: name, age: 7)
    }
}
*/


// 18-11

/*
class Person {  // 하나의 지정 이니셜라이저, 두 개의 실패 가능한 지정 이니셜라이저
    var name: String
    var age: Int
    
    init() {
        self.name = "Unknown"
        self.age = 0
    }
    
    init?(name: String, age: Int) {
        if name.isEmpty {
            return nil
        }
        self.name = name
        self.age = age
    }
    
    init?(age: Int) {
        if age < 0 {
            return nil
        }
        self.name = "Unknown"
        self.age = age
    }
}

class Student: Person {
    var major: String
    
    override init?(name: String, age: Int) {  // 실패 가능한 지정 이니셜라이저
        self.major = "Swift"
        super.init(name: name, age: age)
    }
    
    override init(age: Int) {  // 필요에 따라 실패하지 않는 이니셜라이저로 재정의해도 됨
        self.major = "Swift"
        super.init()
    }
}
*/


// 18-12

/*
class Person {
    var name: String
    
    init(name: String) {  // 지정 이니셜라이저
        self.name = name
    }
    
    convenience init() {  // 편의 이니셜라이저
        self.init(name: "Unknown")
    }
}

class Student: Person {
    var major: String = "Swift"  // 프로퍼티에 기본값이 있음, 따로 지정 이니셜라이저를 구현하지 않았음
                                 // -> 부모클래스의 지정 이니셜라이저가 자동 상속 됨
                                 // -> 부모클래스의 지정 이니셜라이저를 모두 자동상속 받았으므로 편의 이니셜라이저도 자동 상속됨
}

let yagom: Person = Person(name: "yagom")
let hana: Student = Student(name: "hana")
print(yagom.name)
print(hana.name)

let wizplan: Person = Person()
let jinSung: Student = Student()
print(wizplan.name)
print(jinSung.name)
*/


// 18-13

/*
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "Unknown")
    }
}

class Student: Person {
    var major: String   // 프로퍼티에 기본값 없는 상태
    
    override init(name: String) {
        self.major = "Unknown"  // 하지만 여기서 기본값 초기화, 부모클래스의 모든 지정 이니셜라이저를 초기화 했으므로 규칙 1 부합
        super.init(name: name)  // 따라서 부모클래스의 편의 이니셜라이저가 자동으로 상속 됨
    }
    
    init(name: String, major: String) {
        self.major = major
        super.init(name: name)
    }
}

let wizplan: Person =  Person()
let jinSung: Student = Student()
print(wizplan.name)
print(jinSung.name)
*/



// 18-14

/*
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "Unknown")
    }
}

class Student: Person {
    var major: String
    
    convenience init(major: String) {  // 자신만의 편의 이니셜라이저 (편의 이니셜라이저 자동 상속에는 아무런 영향x)
        self.init()
        self.major = major
    }
    
    override convenience init(name: String) {  // 부모클래스의 지정 이니셜라이저를 자식클래스의 편의 이니셜라이저로 구현하더라도 규칙2 충족
        self.init(name: name, major: "Unknown")
    }
    
    init(name: String, major: String) {
        self.major = major
        super.init(name: name)
    }
}

let wizplan: Person = Person()
let jinSung: Student = Student(major: "Swift")
print(wizplan.name)
print(jinSung.name)
print(jinSung.major)
print()

// 18-15

class UniversityStudent: Student {
    var grade: String = "A+"  // 프로퍼티에 기본값 있음, 지정이니셜라이저 구현 x -> 규칙 1 부합 -> 부모클래스로부터 모두 자동 상속 받음
    var description: String {
        return "\(self.name) \(self.major) \(self.grade)"
    }
    
    convenience init(name: String, major: String, grade: String) {  // 자신만의 편의 이니셜라이저 -> 자동 상속에 영향 x
        self.init(name: name, major: major)
        self.grade = grade
    }
}

let nova: UniversityStudent = UniversityStudent()
print(nova.description)

let raon: UniversityStudent = UniversityStudent(name: "raon")
print(raon.description)

let joker: UniversityStudent = UniversityStudent(name: "joker", major: "Programming")
print(joker.description)

let chope: UniversityStudent = UniversityStudent(name: "chope", major: "Computer", grade: "C")
print(chope.description)
*/


// 18-16

/*
class Person {
    var name: String
    required init() {  // 요구 이니셜라이저 정의
        self.name = "Unknown"
    }
}

// 요구 이니셜라이저 정의하지 않았음
// -> major에 기본값이 있고 별다른 지정이니셜라이저가 없기 때문에 자동 상속 된 것
class Student: Person {
    var major: String = "Unknown"
}

let miJeong: Student = Student()
*/


// 18-17

/*
class Person {
    var name: String
    
    required init() {  // 요구 이니셜라이저
        self.name = "Unknown"
    }
}

class Student: Person {
    var major: String = "Unknown"
    
    init(major: String) {  // 자신만의 지정 이니셜라이저 -> 부모 클래스의 이니셜라이저 자동상속 못 받음 (자동상속 규칙1)
        self.major = major
        super.init()
    }
    
    required init() {  // 반드시 요구 이니셜라이저 재정의
        self.major = "Unknown"
        super.init()
    }
}

class UniversityStudent: Student {
    var grade: String
    
    init(grade: String) {  // 자신만의 지정 이니셜라이저
        self.grade = grade
        super.init()
    }
    
    required init() {  // 반드시 요구 이니셜라이저 재정의
        self.grade = "F"
        super.init()
    }
}

let jiSoo: Student = Student()
print(jiSoo.major)

let yagom: Student = Student(major: "Swift")
print(yagom.major)

let juHyun: UniversityStudent = UniversityStudent(grade: "A+")
print(juHyun.grade)
*/


// 18-18

class Person {
    var name: String
    
    init() {  // 일반 이니셜라이저
        self.name = "Unknown"
    }
}

class Student: Person {
    var major: String = "Unknown"
    
    init(major: String) {
        self.major = major
        super.init()
    }
    
    // 재정의 동시에 요구 이니셜라이저로 변경!
    required override init() {  // 부모클래스의 일반 이니셜라이저를 요구 이니셜라이저로 변경 가능
        self.major = "Unknown"
        super.init()
    }
    
    required convenience init(name: String) {  // 편의 이니셜라이저도 요구 이니셜라이저로 변경 가능
        self.init()
        self.name = name
        
    }
    
}
    
class UniversityStudent: Student {
    var grade: String
    
    init(grade: String) {
        self.grade = grade
        super.init()
    }
    
    required init() {  // Student 클래스에서 요구했으므로 구현해주어야 함
        self.grade = "F"
        super.init()
    }
    
    required convenience init(name: String) {  // Student 클래스에서 요구했으므로 구현해주어야 함
        self.init()
        self.name = name
    }
}

let yagom: UniversityStudent =  UniversityStudent()
print(yagom.grade)

let juHyun: UniversityStudent = UniversityStudent(name: "JuHyun")
print(juHyun.name)
