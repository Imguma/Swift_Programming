import UIKit

//7-1
/*
func hello(name: String) -> String {
    return "Hello \(name)!"
}

let helloJenny: String = hello(name: "Jenny")
print(helloJenny)

func introduce(name: String) -> String {
    "제 이름은" + name + "입니다"
}

let introduceJenny: String = introduce(name: "Jenny")
print(introduceJenny)
*/

//7-2
/*
//매개변수가 없는 함수
func helloWorld() -> String {
    return "Hello, world!"
}

print(helloWorld())
*/


//7-3
/*
//매개변수가 여러 개인 함수
func sayHello(myName: String, yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)"
}

print(sayHello(myName: "yagom", yourName: "Jenny"))
*/

//7-4
/*
//전달인자 레이블: 함수 외부에서 매개변수의 역할을 좀 더 명확히 할 수 있음
//함수 내부에서 아요할 수 없고, 함수를 호출할 때는 매개변수 이름을 사용할 수 없음
func sayHello(from myName:String, to name:String) -> String {
    return "Hello \(name)! I'm \(myName)"
}

print(sayHello(from: "yagom", to: "Jenny"))
*/

//7-5
/*
//전달인자 레이블을 사용하기 싫다면 와일드카드 식별자 사용하기
func sayHello(_ name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    return result
}

print(sayHello("Chope", 2))
*/

//7-6
/*
func sayHello(to name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    return result
}

//함수 중복(오버로드)
func sayHello(to name: String, repeatCount times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    return result
}

print(sayHello(to: "Chope", 2))
print(sayHello(to: "Chope", repeatCount: 2))

*/


//7-7
/*
func sayHello(_ name: String, times: Int = 3) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)!" + " "
    }
    return result
}

print(sayHello("Hana"))
print(sayHello("Joe", times: 2))
*/


//7-8
/*
//가변 매개변수는 0개 이상 받아올 수 있음
//가변 매개변수로 들어온 인자 값은 배열처럼 사용가능
//함수마다 가변 매개변수는 하나만 가질 수 있음
func sayHelloToFriends(me: String, friends names: String...) -> String {
    var result: String = ""
    
    for friend in names {
        result += "Hello \(friend)!" + " "
    }
    result += "I'm " + me + "!"
    return result
}

print(sayHelloToFriends(me: "yagom", friends: "Johansson", "Jay", "Wizplan"))

print(sayHelloToFriends(me: "yagom"))
*/


//7-9
/*
var numbers: [Int] = [1,2,3]

func nonReferenceParameter(_ arr: [Int]) {
    var copiedArr: [Int] = arr
    copiedArr[1] = 1   //copiedArr = [1, 1, 3]
}

//입출력 매개변수는 매개변수 기본값을 가질 수 없고 가변 매개변수로 사용될 수 없다.
//입출력 매개변수는 잘 사용하면 문제 없지만 잘못 사용하면 메모리 안전을 위협하기도 하여 몇가지 제약이 있다
func referenceParameter(_ arr: inout [Int]) {
    arr[1] = 1  //2. 해당 전달인자의 값을 변경하면 1에서 복사한 것을 함수 내부에서 변경
} //3. 함수를 반환하는 시점에 2에서 변경된 값을 원래의 매개변수에 할당

nonReferenceParameter(numbers)
print(numbers[1])    //numbers = [1, 2, 3]

referenceParameter(&numbers)  //1. 함수를 호출할 때 전달인자의 값을 복사
print(numbers[1])
*/


//7-10
/*
//반한값이 없는 함수
//반환 타입이 Void이거나 생략하기
func sayHelloWorld() {
    print("Hello, world!")
}
sayHelloWorld()

func sayHello(from myName: String, to name: String) {
    print("Hello \(name)! I'm \(myName)")
}
sayHello(from: "yagom", to: "Mijeong")

func sayGoodbye() -> Void {
    print("Good bye")
}
sayGoodbye()
*/


//7-11
/*
//함수를 하나의 데이터 타입으로 사용할 수 있다.
//즉 함수를 전달인자로 받을 수도, 반환 값으로 돌려줄 수도 있다는 의미

//두 Int 값을 입력받아 계산 후 Int 값을 돌려주는 형태의 함수를 CalculateTwoInts라는 별칭으로 지음
typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: CalculateTwoInts = addTwoInts  //함수를 변수처럼 사용

print(mathFunction(2,5))

mathFunction = multiplyTwoInts
print(mathFunction(2,5))


//7-12
func printMahResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

//전달인자로 함수 넘겨주기
printMahResult(addTwoInts, 3, 5)


//7-13
func chooseMathFunction(_ toAdd: Bool) -> CalculateTwoInts {
    return toAdd ? addTwoInts : multiplyTwoInts
}

//반환 값으로 함수 반환
printMahResult(chooseMathFunction(true), 3, 5)
*/


//7-14
/*
typealias MoveFunc = (Int) -> Int

func goRight(_ currentPosition: Int) -> Int {
    return currentPosition + 1
}

func goLeft(_ currentPosition: Int) -> Int {
    return currentPosition - 1
}

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = 3

let moveToZero: MoveFunc = functionForMove(position > 0)
print("원점으로 갑시다.")

while position != 0 {
    print("\(position)... ")
    position = moveToZero(position)
}

print("원점 도착!")
*/

//7-15

//중첩 함수
/*
typealias MoveFunc = (Int) -> Int

func functionForMove(_ shouldGoLeft: Bool) -> MoveFunc {
    func goRight(_ currentPosition: Int) -> Int {
        return currentPosition + 1
    }

    func goLeft(_ currentPosition: Int) -> Int {
        return currentPosition - 1
    }
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = -4

let moveToZero: MoveFunc = functionForMove(position > 0)

while position != 0 {
    print("\(position)... ")
    position = moveToZero(position)
}

print("원점 도착!")
*/


//7-16
/*
//종료되지 않는 삼수(반환 타입 Never)
//종료되지 않는다 = 정상적으로 끝나지 않는 함수 => 비반환 함수, 비반환 메서드
//비반환 함수안에서는 오류를 던진다든가, 중대한 시스템 오류를 보고하는 등의 일을 하고 프로세스를 종료한다.
//어디서든 호출이 가능하고 재정의 할 수 있지만 비반환 타입이라는 것은 변경할 수 없다

func crashAndBurn() -> Never {
    fatalError("Something very, very bad happened")
}

crashAndBurn()

func someFunction(isAllIsWell: Bool) {
    guard isAllIsWell else {
        print("마을에 도둑이 들었습니당")
        crashAndBurn()
    }
    print("All is well")
}

someFunction(isAllIsWell: true)
someFunction(isAllIsWell: false)
*/

//7-17

//반환 값을 무시할 수 있는 함수
//프로그래머가 의도적으로 함수의 반환 값을 사용하지 않을 경우
//컴파일러가 함수의 결과 값을 사용하지 않았다는 경고를 보낼 때도 있다.
//이런 경우 함수의 반환 값을 무시해도 된다는 @discardableResult 선언 속성 사용

func say(_ something: String) -> String {
    print(something)
    return something
}

@discardableResult func discardableResultSay(_ something: String) -> String {
    print(something)
    return something
}

say("hello")

discardableResultSay("hello")
