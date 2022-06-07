import UIKit
import Darwin

//6-2
/*
let first: Int = 5
let second: Int = 7
var biggerValue: Int = 0

//소괄호는 생략 가능하지만 중괄호는 생략x
if first > second {
    biggerValue = first
}
else if first == second {
    biggerValue = second
}
else if first == 5 {
    biggerValue = 100
}

print(biggerValue)
*/

//6-3
/*
let integerValue: Int = 5

switch integerValue {
case 0:
    print("Value == zero")
case 1...10:
    print("Value == 1~10")
    fallthrough   //case 연속 실행
case Int.min..<0, 101..<Int.max:
    print("Value < 0 or Value > 100")
    break
default:
    print("10 < Value <= 100")
}
*/

//6-4
/*
let doubleValue: Double = 3.0

switch doubleValue {
case 0:
    print("Value == zero")
case 1.5...10.5:
    print("1.5 <= Value <= 10.5")
    fallthrough
case 15: //무조건 실행
    print("Value == 15")
    fallthrough
default: //무조건 실행
    print("Value == \(doubleValue)")
}
*/

//6-5
/*
let stringValue: String = "Jenny"

switch stringValue {
case "yagom":
    print("He is yagom")
case "Jay":
    print("He is Jay")
case "Jenny", "Joker", "Nova":
    print("He or She is \(stringValue)")
default:
    print("\(stringValue) said 'I don't know who you are'")
}
*/

//6-7
/*
let stringValue: String = "Joker"

switch stringValue {
case "yagom":
    print("He is yagom")
case "Jay":
    print("He is Jay")
case "Jenny":
    fallthrough
case "Joker":
    fallthrough //탈출하는 것이 아니라 case진행
case "Nova":
    print("He or She is \(stringValue)")
default:
    print("\(stringValue) said 'I don't know who you are.")
}
*/


//6-8
/*
//typealias -> 별칭
typealias NameAge = (name: String, age: Int)

//var NameAge: (name: String, age: Int) = ("yagom", 99)
let tupleValue: NameAge = ("yagom", 99)

switch tupleValue{
case ("yagom", 99):
    print("정확히 맞춤")
default:
    print("누굴 찾나용")
}
*/

//6-9
/*
typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("yagom", 99)

switch tupleValue{
case ("yagom", 50):
    print("정확히 맞춤")
case ("yagom", _):  //(_) 와일드카드 식별자
    print("이름만 맞춤. 나이는 \(tupleValue.age)입니다.")  //값을 직접 가져와야 하는 불편함
case (_, 99):
    print("나이만 맞춤. 이름은 \(tupleValue.name)입니다.")
default:
    print("누굴 찾나용?")
}
*/


//6-10
/*
//6-9에서 와일드카드 식별자를 사용하면 무시된 값을 직접 가져와야 하는 불편함이 생김
//미리 지정된 조건 값을 제외한 다른 값은 실행문 안으로 가져올 수 있도록 let을 붙인 값 바인딩 사용

typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("yagom", 99)

switch tupleValue{
case ("yagom", 50):
    print("정확히 맞춤")
case ("yagom", let age):  //값 바인딩 사용
    print("이름만 맞춤. 나이는 \(age)입니다.")
case (let name, 99):      //값 바인딩 사용
    print("나이만 맞춤. 이름은 \(name)입니다.")
default:
    print("누굴 찾나용?")
}
*/


//6-11
/*
let 직급: String = "사원"
let 연차: Int = 1
let 인턴인가: Bool = false

switch 직급 {
case "사원" where 인턴인가 == true:
    print("인턴입니당")
case "사원" where 연차 < 2 && 인턴인가 == false:
    print("신입사원입니당")
case "사원" where 연차 > 5:
    print("연식이 좀 된 사원입니당")
case "사원":
    print("사원입니당")
case "대리":
    print("대리입니당")
default:
    print("사장입니깡?")
}
*/


//6-12
/*
enum School {
    case primary, elementary, middle, high, college, university, graduate
}

let 최종학력: School = School.university

switch 최종학력 {
case .primary:
    print("최종학력은 유치원")
case .elementary:
    print("최종학력은 초등학교")
case .middle:
    print("최종학력은 중학교")
case .high:
    print("최종학력은 고등학교")
case .college, .university:
    print("최종학력은 대학(교)")
case .graduate:
    print("최종학력은 대학원")
}
*/

//6-14
/*
enum Menu {
    case chicken
    case pizza
    case hamburger  //열거형에 새로운 케이스 추가
}

let lunchMenu: Menu = .chicken

switch lunchMenu {
case .chicken:
    print("반반 무많이")
case .pizza:
    print("핫소스 많이 주세용")
//깜박하고 새로운 케이스에 대한 구문을 추가하지 않았는데 _때문에 경고조차 사라짐
//문법적으로는 오류가 없지만 논리적 오류가 발생할 수 있는 여지가 생기기 때문에
//unknwon 속성 사용
@unknown case _:
    print("오늘 메뉴가 뭐죠?")
}
//논리적 오류에 대해 도움을 받을 수 있는 unknown 속성을 부여할 수 있는 case는
//case _ or default case 뿐이다.
//그리고 unknwon 속성을 부여한 case는 switch문 가장 마지막에 작성해야 함

*/



//6-15
/*
for i in 0...2 {
    print(i)
}

for i in 0...5 {
    if i.isMultiple(of: 2) { //2의 배수인가
        print(i)
        continue  //다음 시퀀스로 건너뜀
    }
    print("\(i) == 홀수")
}

let helloSwift: String = "Hello Swift!"

for char in helloSwift {
    print(char)
}

var result: Int = 1

//시퀀스에 해당하는 값이 필요 없다면 와일드카드 식별자를 사용
for _ in 1...3 {
    result *= 10
}

print("10의 3제곱은 \(result)입니다.")
*/


//6-16
/*
//Dictionary
let friends: [String: Int] = ["Jay": 35, "joe": 29, "Jenny": 31]

for tuple in friends {
    print(tuple)
}

let 주소: [String: String] = ["도": "충청북도", "시군구": "청주시 청원구", "동읍면": "율량동"]

for (키, 값) in 주소 {
    print("\(키) : \(값)")
}

//Set
let 지역번호: Set<String> = ["02", "031", "032", "033", "041", "042", "043", "051", "052", "053", "054", "055", "061", "062", "063", "064"]

for 번호 in 지역번호 {
    print(번호)
}
*/

//6-17
/*
//Array<String> = [String]
var names: [String] = ["Joker", "Jenny", "Nova", "yagom"]

while names.isEmpty == false {
    print("Good bye \(names.removeFirst())") //removeFirst -> 요소를 삭제함과 동시에 삭제한 요소 반환
}
*/


//6-18
/*
var names: [String] = ["Joker", "Jenny", "Nova", "yagom"]

repeat {
    print("Good bye \(names.removeFirst())")  //removeFirst -> 요소를 삭제함과 동시에 삭제한 요소 반환
} while names.isEmpty == false
*/


//6-19

var numbers: [Int] = [3, 2342, 6, 3252]

//구문 이름표 numbersLoop
numbersLoop: for num in numbers {
    if num > 5 || num < 1 {
        continue numbersLoop //다음 시퀀스로 건너뜀
    }
    
    var count: Int = 0
    
    printLoop: while true{
        print(num)  //3 3 3
        count += 1  //1 2 3
    
        if count == num {
            break printLoop
        }
    }
    
    removeLoop: while true {
        if numbers.first != num {
            break numbersLoop
        }
        numbers.removeFirst()
    }
}
