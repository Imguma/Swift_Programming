import UIKit
import Foundation
import Darwin

//4-2
/*
typealias MyInt = Int
typealias YourInt = Int
typealias MyDouble = Double

let age: MyInt = 1000
var year: YourInt = 2080

year = age
let month: Int = 7
let percentage: MyDouble = 99.9
*/

//4-3
/*
var person: (String, Int, Double) = ("imguma", 24, 157.7)
print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")

person.1 = 20
person.2 = 167.3

print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")
*/

/*
//4-4 (튜플 요소 이름 지정)
var person: (name: String, age: Int, height: Double) = ("imguma", 24, 157.7)
print("이름: \(person.name), 나이: \(person.1), 신장: \(person.2)")

//4-5 (별칭 지정)
typealias PersonTuple = (name: String, age: Int, height: Double)

let guma: PersonTuple = ("guma", 24, 157.7)

print("이름: \(guma.name), 나이: \(guma.age), 신장: \(guma.2)")
*/

//4-6
/*
var names1: Array<String> = ["공부", "하기","싫다","인정?","인정"]
var names2: [String] = ["공부", "하기","싫다","인정?","인정"]
//[String]은 Array<String>의 축약 표현

var emptyArray1: [Any] = [Any]()
var emptyArray2: [Any] = Array<Any>()

var emptyArray3: [Any] = []
print(emptyArray1.isEmpty)
print(names1.count)
*/

//4-7
/*
var people: Array<String> = ["yagom", "chulsoo", "younghee", "yagom"]
print(people[2])
people[2] = "jenny" //추가가 아니라 변경됨
print(people[2])
//print(people[4])  //인덱스 에러

//people[4] = "elsa"  //인덱스 에러
people.append("elsa")
people.append(contentsOf: ["john", "max"]) //맨 마지막에 추가
people.insert("happy", at: 2)
people.insert(contentsOf: ["jinhee", "minsoo"], at: 5)

print(people[4])
print(people.firstIndex(of: "yagom"))
print(people.firstIndex(of: "christal"))
print(people.first)
print(people.last)

let firstItem: String = people.removeFirst()
let lastItem: String = people.removeLast()
let indexZeroItem: String = people.remove(at: 0)

print(firstItem)
print(lastItem)
print(indexZeroItem)
print(people[1 ... 3])
*/

//4-8
/*
typealias StringIntDictionary = [String: Int]  //별칭

//키는 String, 값은 Int
//var numberForName: Dictionary<String, Int> = Dictionary<String, Int>()
//[String: Int]는 Dictionaty<String, Int>의 축약 표현
var numberForName1: [String: Int] = [String: Int]()
//위와 같은 표현
var numberForName2: StringIntDictionary = StringIntDictionary()

//딕셔너리의 키와 값 타입을 정확히 명시해줬다면 [:]만으로도 빈 딕셔너리 생성 가능
var numberForName3: [String: Int] = [:]

var numberForName: [String: Int] = ["yagom": 100, "chulsoo": 200, "jenny":300]

print(numberForName.isEmpty)
print(numberForName.count)

print(numberForName["chulsoo"])
print(numberForName["minji"])

numberForName["chulsoo"] = 150
print(numberForName["chulsoo"])

numberForName["max"] = 999
print(numberForName["max"])

print(numberForName.removeValue(forKey: "yagom"))

print(numberForName.removeValue(forKey: "yagom"))

//키(yagom)에 해당하는 값이 없으면 기본값(0)을 돌려주도록 함
print(numberForName["yagom", default: 0])
*/

//4-10
/*
//var names: Set<String> = Set<String>()
//var names: Set<String> = []

var names: Set<String> = ["yagom", "chulsoo", "younghee", "yagom"]

var numbers = [100, 200, 300]
print(type(of: numbers))

print(names.isEmpty)
print(names.count)

names.insert("jenny")
print(names.count)

print(names.remove("chulsoo"))
print(names.remove("john"))
*/

//4-12
/*
let englishClassStudents: Set<String> = ["john", "chulsoo", "yagom"]
let koreanClassStudents: Set<String> = ["jenny", "yagom", "chulsoo", "hana", "minsoo"]

//교집합
let intersectSet: Set<String> = englishClassStudents.intersection(koreanClassStudents)

//여집합의 합(배타적 논리합)
let symmetricDiffSet: Set<String> = englishClassStudents.symmetricDifference(koreanClassStudents)

//합집합
let unionSet: Set<String> = englishClassStudents.union(koreanClassStudents)

//차집합
let subtractSet: Set<String> = englishClassStudents.subtracting(koreanClassStudents)

print(unionSet.sorted())
*/

//4-13
/*
let 새: Set<String> = ["비둘기", "닭", "기러기"]
let 포유류: Set<String> = ["사자", "호랑이", "곰"]
let 동물: Set<String> = 새.union(포유류)

print(새.isDisjoint(with: 포유류))    //서로 배타적인지
print(새.isSubset(of: 동물))         //새가 동물의 부분집합인지
print(동물.isSuperset(of: 포유류))    //동물은 포유류의 전체집합인지
print(동물.isSuperset(of: 새))       //동물은 새의 전체집합인지
*/

//4-14,15,16
/*
enum School {
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
}

var highestEducationalLevel: School = School.university
//var highestEducationalLevel: School = .university
highestEducationalLevel = .graduate   //값 변경
*/

//4-17
/*
//원시값을 사용하고 싶을 때 rawValue 사용
enum School: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let highestEducationalLevel: School = School.university
print("저의 최종학력은 \(highestEducationalLevel.rawValue) 졸업입니다.")

enum WeekDays: Character {
    case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금", sat = "토", sun = "일"
}

let today: WeekDays = WeekDays.fri
print("오늘은 \(today.rawValue)요일입니다.")
*/


//4-18
/*
enum School: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college
    case university
    case graduate
}

let highestEducationalLevel: School = School.university
print("저의 최종학력은 \(highestEducationalLevel.rawValue) 졸업입니다.")

enum Numbers: Int {
    case zero
    case one
    case two
    case ten = 10
}

print("\(Numbers.zero.rawValue), \(Numbers.one.rawValue), \(Numbers.two.rawValue), \(Numbers.ten.rawValue)")

//원시값을 통한 열거형 초기화
//올바르지 않은 원시 값을 통해 생성하려고 한다면 nil반환
let primary = School(rawValue: "유치원")
let graduate = School(rawValue: "석박사")

let one = Numbers(rawValue: 1)
let three = Numbers(rawValue: 3)
*/

//4-20
/*
//연관값 : 각 항목 옆에 소괄호로 묶어 표현
enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish = MainDish.pasta(taste: "크림")
dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
dinner = .chicken(withSauce: true)
dinner = .rice
*/

//4-22
/*
//항목순회
//열거형에 포함된 모든 케이스를 알아야 할 때 CaseIterable 프로토콜 사용
enum School: CaseIterable {
    case primary
    case elementary
    case middle
    case high
    case college
    case university
    case graduate
}

let allCases: [School] = School.allCases
print(allCases)
*/


