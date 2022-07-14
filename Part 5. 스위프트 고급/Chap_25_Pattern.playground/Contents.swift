import UIKit

// 25-1

/*
let string: String = "ABC"

switch string {
// 어떤 값이 와도 상관없기 때문에 항상 실행!
case _: print(string)
}

let optionalString: String? = "ABC"

switch optionalString {
// optionalString이 Optional("ABC") 일 때만 실행!
case "ABC"?: print(optionalString)

// optionalString이 Optional("ABC") 외의 값일 때만 실행!
case _?: print("Has value, but not ABC")

// 값이 없을 때 실행!
case nil: print("nil")
}

let yagom = ("yagom", 99, "Male")

switch yagom {
// 첫 번째 요소가 "yagom"일 때만 실행!
case ("yagom", _, _): print("Hello yagom!!")

// 그 외에 언제든지 실행!
case (_, _, _): print("Who cares~")
}

for _ in 0..<2 {
    print("Hello")
}
*/


// 25-3

/*
let yagom = ("yagom", 99, "Male")

switch yagom {
// name, age, gender를 yagom의 각각의 요소와 바인딩
case let (name, age, gender) : print ("Name: \(name), Age: \(age), Gender: \(gender)")
}

switch yagom {
case (let name, let age, let gender) : print ("Name: \(name), Age: \(age), Gender: \(gender)")
}

switch yagom {
// 값 바인딩 패턴은 와일드카드 패턴과 결합하여 유용하게 사용될 수도 있다.
case (let name, _, let gender): print ("Name: \(name), Gender: \(gender)")
}
*/


// 25-4

/*
let (a): Int = 2
print(a)

let (x, y): (Int, Int) = (1, 2)
print(x)
print(y)

let name: String = "Jung"
let age: Int = 99
let gender: String? = "Male"

switch (name, age, gender) {
case ("Jung", _, _): print("Hello Jung!!")
case (_, _, "Male"?): print("Who are you man?")
default: print("I don't know who you are")
}

let points: [(Int, Int)] = [(0, 0), (1, 0), (1, 1), (2, 0), (2, 1)]

for (x, _) in points {
    print(x)
}
*/


// 25-5

/*
let someValue: Int = 30

if case 0...100 = someValue {
    print("0 <= \(someValue) <= 100")
}

let anotherValue: String = "ABC"

if case "ABC" = anotherValue {
    print(anotherValue)
}

enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dishes: [MainDish] = []

var dinner: MainDish = .pasta(taste: "크림")
dishes.append(dinner)

if case .pasta(let taste) = dinner {
    print("\(taste) 파스타")
}

dinner = .pizza(dough: "치즈크러스트", topping: "불고기")
dishes.append(dinner)

func whatIsThis(dish: MainDish) {
    guard case .pizza(let dough, let topping) = dinner else {
        print("It's not a Pizza")
        return
    }
    print("\(dough) \(topping) 피자")
}
whatIsThis(dish: dinner)

dinner = .chicken(withSauce: true)
dishes.append(dinner)

while case .chicken(let sauced) = dinner {
    print("\(sauced ? "양념" : "후라이드") 통닭")
    break
}

dinner = .rice
dishes.append(dinner)

if case .rice = dinner {
    print("오늘 저녁은 밥입니다.")
}

for dish in dishes {
    switch dish {
    case let .pasta(taste): print(taste)
    case let .pizza(dough, topping): print(dough, topping)
    case let .chicken(sauced): print(sauced ? "양념" : "후라이드")
    case .rice: print("Just 쌀")
    }
}
*/


// 25-6

/*
var optionalValue: Int? = 100

if case .some(let value) = optionalValue {
    print(value)
}

if case let value? = optionalValue {
    print(value)
}

func isItHasValue(_ optionalValue: Int?) {
    guard case .some(let value) = optionalValue else {
        print("none")
        return
    }
    print(value)
}

isItHasValue(optionalValue)

while case .some(let value) = optionalValue {
    print(value)
    optionalValue = nil
}

print(optionalValue)

let arrayOfOptionalInts: [Int?] = [nil, 2, 3, nil, 5]

for case let number? in arrayOfOptionalInts {
    print("Found a \(number)")
}
*/


// 25-7

/*
let someValue: Any = 100

switch someValue {
// 타입이 String인지 확인하지만 캐스팅된 값을 사용할 수 없음
case is String: print("It's String!")

// 타입 확인과 동시에 캐스팅까지 완료되어 value에 저장
// 값 바인딩 패턴과 결합된 모습
case let value as Int: print(value + 1)
default: print("Int도 String도 아닙니다.")
}
*/


// 25-9

// 제네릭을 사용하기 위해 프로토콜 정의
protocol Personalize {
    var name: String { get }
    var age: Int { get }
}

struct Person: Personalize {
    var name: String
    var age: Int
}

let star: Person = Person(name: "Star", age: 99)

// 제네릭을 사용하여 패턴 연산자 정의
func ~= <T: Personalize>(pattern: String, value: T) -> Bool {
    return pattern == value.name
}

func ~= <T: Personalize>(pattern: T, value: T) -> Bool {
    return pattern.name == value.name && pattern.age == value.age
}

// 기존 패턴 연산자가 없더라도 제네릭 패턴 연산자로 똑같이 사용 가능
switch star {
case Person(name: "Star", age: 99): print("Same Person!!")
case "Star": print("Hello Star!!")
default: print("I don't know who you are")
}

// 제네릭을 사용하여 패턴 연산자 정의
// 패턴 자체가 함수임
func ~= <T: Personalize>(pattern: (T) -> Bool, value: T) -> Bool {
    return pattern(value)
}

// 패턴에 사용할 제네릭 함수
func young<T: Personalize>(value: T) -> Bool {
    return value.age < 50
}

switch star {
// 패턴결합을 하면 young(star)와 같은 효과를 봄
case young: print("\(star.name) is young")
default: print("\(star.name) is old")
}

// 패턴에 사용할 제네릭 함수
func isNamed<T: Personalize>(_ pattern: String) -> ((T) -> Bool) {
    return { (value: T) -> Bool in value.name == pattern }
}

switch star {
// 패턴결합을 하면 isNamed("Jung")(star)와 같은 효과
case isNamed("Jung"): print("He is Jung")
default: print("Another person")
}

prefix operator ==?

prefix func ==? <T: Personalize>(pattern: String) -> ((T) -> Bool) {
    return isNamed(pattern)
}

switch star {
// 패턴결합을 하면 isNamed("Jung")(star)와 같은 효과
case ==?"Jung": print("He is Jung")
default: print("Another person")
}
