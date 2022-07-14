import UIKit
import Foundation


//13-2
/*
let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

//Bool -> 첫 번째 전달인자 값이 새로 생성되는 배열에서 두번째 전달인자 값보다 먼저 배치되어야 하는지에 대한 결괏값!
//함수는 클로저의 한 형태!
func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) 비교중")
    return first > second  //내림차순 정리 >
}

//reversed 배열로 반환받음
let reversed: [String] = names.sorted(by: backwards) //sorted(by)는 기본적으로 오름차순 정리
print(reversed)
*/


//13-4
/*
let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

//클로저 표현
let reversed: [String] = names.sorted(by: { (first: String, second: String) -> Bool in
    return first > second})

print(reversed)
*/


//13-5

/*
let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

//후행 클로저의 사용
let reversed: [String] = names.sorted() { (first: String, second: String) -> Bool in
    return first > second
}

/*
//메서드의 소괄호까지 생략 가능
let reversed: [String] = names.sorted { (first: String, second: String) -> Bool in
    return first > second
}
*/

func doSomething(do: (String) -> Void,
                 onSuccess: (Any) -> Void,
                 onFailure: (Error) -> Void) {
    //do something...
}

//다중 후행 클로저의 사용
doSomething { (someString: String) in
    //do closure
} onSuccess: { (result: Any) in
    //success closure
} onFailure: { (error: Error) in
    //failure closure
}
*/


//13-6, 7, 8, 10
/*
let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

//후행 클로저의 사용
/*
let reversed: [String] = names.sorted { (first: String, second: String) -> Bool in
    return first > second
}
*/

//클로저의 타입 유추
//클로저의 매개변수 타입과 반환 타입을 생략하여 표현 가능
/*
let reversed: [String] = names.sorted { (first, second) in
    return first > second
}
*/

//단축 인자 이름을 사용한 표현
/*
let reversed: [String] = names.sorted {
    return $0 > $1
}
*/

//암시적 반환 표현의 사용
//let reversed: [String] = names.sorted { $0 > $1 }

//연산자 함수를 콜러저의 역할로 사용
let reversed: [String] = names.sorted(by: >)
*/


//13-11, 13, 14, 15
/*
//makeIncrementer 함수의 반환 타입은 () -> 로서 이는 함수객체를 반환한다는 의미!
func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    //중첩 함수 incrementer는 자신 주변에 있는 runningTotal, mount 두 값을 획득,
    func incrementer() -> Int {  //incrementer함수는 두 변수(runningTotal, mount)의 참조를 획득할 수 있음!
                                 //참조를 획득하면 makeIncrementer함수의 실행이 끝나도 사라지지 않고 incrementer가 호출될때마다 사용 가능
        runningTotal += amount
        return runningTotal
    }
    //incrementer함수가 호출될 때마다 amount값만큼 runningTotal 값이 증가함
    return incrementer  //획득 후에 incrementer는 클로저로서 makeIncrementer 함수에 의해 반환 됨
}

//각각 자신만의 runningTotal 의 참조 획득!
let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
let incrementByTwo2: (() -> Int) = makeIncrementer(forIncrement: 2)
let incrementByTen: (() -> Int) = makeIncrementer(forIncrement: 10)

let first: Int = incrementByTwo()
let second: Int = incrementByTwo()
let third: Int = incrementByTwo()

let first2: Int = incrementByTwo2()
let second2: Int = incrementByTwo2()
let third2: Int = incrementByTwo2()

let ten: Int = incrementByTen()
let twenty: Int = incrementByTen()
let thirty: Int = incrementByTen()

//같은 클로저를 참조하기 때문에 동일한 클로저가 동작함
let incrementByTwo3: (() -> Int) = makeIncrementer(forIncrement: 2)
let sameWithIncrementByTwo: (() -> Int) = incrementByTwo3

let first3: Int = incrementByTwo3()
let second3: Int = sameWithIncrementByTwo()
*/


//13-17

/*
//타입별칭
typealias VoidVoidClosure = () -> Void
let firstClosure: VoidVoidClosure = {
    print("Closure A")
}
let secondClosure: VoidVoidClosure = {
    print("Closure B")
}

//first와 second 매개변수 클로저는 함수의 반환 값으로 사용될 수 있으므로 탈출 클로저이다!
func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure,
                      shouldReturnFirstClosure: Bool) -> VoidVoidClosure {
    //전달인자로 전달받은 클로저를 함수 외부로 다시 반환하기 때문에 함수를 탈출하는 클로저이다.
    return shouldReturnFirstClosure ? first : second  //함수가 종료된 후에 사용됨(리턴값) -> 탈출!
}

//함수에서 반환한 클로저가 함수 외부의 상수에 저장됨
let returnedClosure: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)

returnedClosure()

var closures: [VoidVoidClosure] = []

//closure 매개변수 클로저는 함수 외부의 변수에 저장될 수 있으므로 탈출 클로저임
func appendClosure(closure: @escaping VoidVoidClosure) {
    //전달인자로 전달받은 클로저가 함수 외부의 변수 내부에 저장되므로 함수를 탈출
    closures.append(closure)
}
*/


//13-18
/*
typealias VoidVoidClosure = () -> Void

func functionWithNoescapeClosure(closure: VoidVoidClosure) {
    closure()
}

//탈출 클로저
func functionWithEscapingClosure(completionHandler: @escaping VoidVoidClosure) -> VoidVoidClosure {
    return completionHandler
}

class SomeClass {
    var x = 10
    
    func runNoescapeClosure() {
        //비탈출 클로저에서 self 키워드 사용은 선택 사항이다.
        functionWithNoescapeClosure { x = 200 }
    }
    
    func runEscapingClosure() -> VoidVoidClosure {
        //탈출 클로저에서는 값 획득을 하기 위해 명시적으로 self를 사용해야 한다.
        return functionWithEscapingClosure { self.x = 100 }
    }
}

let instance: SomeClass = SomeClass()
instance.runNoescapeClosure()
print(instance.x)

let returnedClosure: VoidVoidClosure = instance.runEscapingClosure()
returnedClosure()
print(instance.x)
*/


//13-20
/*
let numbers: [Int] = [ 2, 4, 6, 8 ]

let evenNumberPredicate = { (number: Int) -> Bool in
    return number % 2 == 0
}

let oddNumberPredicate = { (number: Int) -> Bool in
    return number % 2 == 1
}

//비탈출 클로저 predicate!
func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
    //withoutActuallyEscaping의 첫번째 전달인자로 탈출 클로저인척해야하는 클로저가 전달 됨
    //do 전달 인자는 이 비탈출 클로저를 또 매개변수로 전달받아 실제로 작업을 실행할 탈출 클로저를 전달!
    return withoutActuallyEscaping(predicate, do: { escapablePredicate in
        return (array.lazy.filter { escapablePredicate($0) }.isEmpty == false)
    })
}

let hasEvenNumber = hasElements(in: numbers, match: evenNumberPredicate)
let hasOddNumber = hasElements(in: numbers, match: oddNumberPredicate)

print(hasEvenNumber)
print(hasOddNumber)

*/


//13-21

/*
var customersInLine: [String] = ["YoangWha", "SangYong", "SungHun", "HaMi"]
print(customersInLine.count)   // 4

// 클로저를 만들어두면 클로저 내부의 코드를 미리 실행(연산)하지 않고 가지고만 있다!
let customerProvider: () -> String = {
    return customersInLine.removeFirst()
}

print(customersInLine.count)  // 4

print("Now serving \(customerProvider())")   //호출되었을때 결괏값 반환!!!!! ( 4 - 1 = 3 )
print(customersInLine.count)  // 3
*/


//13-22
/*
var customersInLine: [String] = ["YoangWha", "SangYong", "SungHun", "HaMi"]

// 함수의 전달인자로 직접 클로저를 작성하여 전달
func serveCustomer(_ customerProvider: () -> String) {  // 매개변수 클로저 전달
    print("Now serving \(customerProvider())!")  // 암시적 반환 때문에 return 생략된거임!!
}

// removeFirst() 메서드는 자신의 첫 번째 요소를 제거하면서 그 요소를 반환해줌!!
serveCustomer( { customersInLine.removeFirst() } ) // 전달인자로 직접 클로저를 작성해서 전달해줌
*/


//13-23

/*
var customersInLine: [String] = ["YoangWha", "SangYong", "SungHun", "HaMi"]

// 자동 클로저 기능 사용!!
func serveCustomer(_ customerProvider: @autoclosure () -> String) {  // 자동 클로저는 전달인자 갖지 않음!
                                                   // 전달인자가 없지만 자동클로저의 반환 타입이 String이기 때문에
                                                   // String값을 반환하는 클로저로 변환 해줌
    print("Now serving \(customerProvider())")
}

serveCustomer(customersInLine.removeFirst())  // 클로저 대신에 String타입의 문자열 전달
*/


//13-24

var customersInLine: [String] = ["minjae", "innoceive", "sopress"]

// 자동 클로저의 탈출
// 탈출 가능한 자동 클로저를 매개변수로 받아서 반환 값으로 반환하는 returnProvider
func returnProvider(_ customerProvider: @autoclosure @escaping () -> String) -> (() -> String) {
    return customerProvider
}

let customerProvider: () -> String = returnProvider(customersInLine.removeFirst())
print("Now serving \(customerProvider())!")
