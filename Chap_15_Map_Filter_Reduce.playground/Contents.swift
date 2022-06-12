import UIKit

//15-1

/*
let numbers: [Int] = [0,1,2,3,4]

var doubleNumbers: [Int] = [Int]()
var strings: [String] = [String]()

for number in numbers {
    doubleNumbers.append(number * 2)
    strings.append("\(number)")
}

print(doubleNumbers)
print(strings)

// for-in 구문보다 간결하고 편리하게 각 요소의 연산을 실행
// map 메서드를 사용하면 빈 배열을 만들어줄 필요도 없음
// append 연산 실행을 위한 시간도 필요 없음
doubleNumbers = numbers.map({ (number: Int) -> Int in
    return number * 2
})

strings = numbers.map({ (number: Int) -> String in
    return "\(number)"
})

print(doubleNumbers)
print(strings)
*/


//15-2

/*
let numbers: [Int] = [0,1,2,3,4]

// 기본 클로저 표현식
var doubledNumbers = numbers.map({ (number: Int) -> Int in
    return number * 1
})

// 매개변수 및 반환 타입 생략
doubledNumbers = numbers.map( { return $0 * 2 } )
print(doubledNumbers)

// 반환 키워드 생략
doubledNumbers = numbers.map( { $0 * 2 } )
print(doubledNumbers)

// 후행 클로저 사용
doubledNumbers = numbers.map { $0 * 2 }
print(doubledNumbers)
*/


//15-3

/*
//클로저의 반복 사용
let evenNumbers: [Int] = [0,2,4,6,8]
let oddNumbers: [Int] = [0,1,3,5,7]
let multiplyTwo: (Int) -> Int = { $0 * 2 }

let doubledEvenNumbers = evenNumbers.map(multiplyTwo)
print(doubledEvenNumbers)

let doubledOddNumbers = oddNumbers.map(multiplyTwo)
print(doubledOddNumbers)
*/


//15-4

/*
//다양한 컨테이너 타입에서의 맵의 활용

let alphabetDictionary: [String: String] = ["a":"A", "b":"B"]

var keys: [String] = alphabetDictionary.map { (tuple: (String, String)) -> String in
    return tuple.0
}

keys = alphabetDictionary.map{ $0.0 }

let values: [String] = alphabetDictionary.map{ $0.1 }
print(keys)
print(values)

var numberSet: Set<Int> = [1,2,3,4,5]
let resultSet = numberSet.map{ $0 * 2 }
print(resultSet)

let optionalInt: Int? = 3
let resultInt: Int? = optionalInt.map{ $0 * 2 }
print(resultInt)

let range: CountableClosedRange = (0...3)
let resultRange: [Int] = range.map{ $0 * 2 }
print(resultRange)
*/


//15-5

/*
let numbers: [Int] = [0,1,2,3,4,5]

let evenNumbers: [Int] = numbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers)

let oddNumbers: [Int] = numbers.filter{ $0 % 2 == 1}
print(oddNumbers)
*/


//15-6

/*
//콘텐츠 변형 후 필터링~
let numbers: [Int] = [0,1,2,3,4,5]
let mappedNumbers: [Int] = numbers.map{ $0 + 3 }  // [3,4,5,6,7,8]

let evenNumbers: [Int] = mappedNumbers.filter { (number: Int) -> Bool in
    return number % 2 == 0
}
print(evenNumbers)

let oddNumbers: [Int] = numbers.map{ $0 + 3 }.filter{ $0 % 2 == 1 }
print(oddNumbers)
*/


//15-7
/*
let numbers: [Int] = [1,2,3]

// 첫 번째 형태인 reduce(_:_:) 메서드 활용
// 첫 번째 매개변수(a) -> 전달되는 값을 통해 초깃값 지정
// 두 번째 매개변수(b) -> 클로저를 전달 받음
// 전달받은 클로저의 첫 번째 매개변수(b-1) -> 리듀스의 a 매개변수를 통해 전달받은 초깃값 또는 이전 클로저의 결괏값!
                                //-> 모든 순회가 끝나면 리듀스의 최종값이 됨
// 전달받은 클로저의 두 번째 매개변수(b-2) -> 리듀스 메서드가 순환하는 컨테이너의 요소

// 초깃값이 0이고 정수 배열의 모든 값을 더한다.
var sum: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
    print("\(result) + \(next)")
    // 0 + 1
    // 1 + 2
    // 3 + 3
    return result + next
})
print(sum)

// 초깃값이 0이고 정수 배열의 모든 값을 뺀다.
let subtract: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
    print("\(result) - \(next)")
    //  0 - 1
    // -1 - 2
    // -3 - 3
    return result - next
})
print(subtract)

// 초깃값이 3이고 정수 배열의 모든 값을 더한다.
let sumFromThree: Int = numbers.reduce(3) {
    print("\($0) + \($1)")
    // 3 + 1
    // 4 + 2
    // 6 + 3
    return $0 + $1
}
print(sumFromThree)

// 초깃값이 3이고 정수 배열의 모든 값을 뺀다.
var subtractFromThree: Int = numbers.reduce(3) {
    print("\($0) - \($1)")
    // 3 - 1
    // 2 - 2
    // 0 - 3
    return $0 - $1
}
print(subtractFromThree)


let names: [String] = ["Chope", "Jay", "Joker", "Nova"]

let reduceNames: String = names.reduce("yagom's friend : ") {
    return $0 + ", " + $1
}

print(reduceNames)


// 두 번째 형태인 reduce(into:_:) 메서드 활용

// 첫 번째 매개변수(a) -> 전달되는 값을 통해 초깃값 지정
// 두 번째 매개변수(b) -> 클로저를 전달 받음
// 전달받은 클로저의 첫 번째 매개변수(b-1) -> [inout] 리듀스의 a 매개변수를 이용해 전달받은 초깃값 또는 이전에 실행된 클로저 결괏값
                                //-> 모든 순회가 끝나면 리듀스의 최종값이 됨
// 전달받은 클로저의 두 번째 매개변수(b-2) -> 리듀스 메서드가 순환하는 컨테이너의 요소

// 초깃값이 0이고 정수 배열의 모든 값을 더한다.
// 첫 번째 리듀스 형태와 달리 클로저의 값을 반환하지 않고 내부에서
// 직접 이전 값을 변경한다는 점이 다름!!!
sum = numbers.reduce(into: 0, { (result: inout Int, next: Int) in
    print("\(result) + \(next)")
    // 0 + 1
    // 1 + 2
    // 3 + 3
    result += next
})
print(sum)

subtractFromThree = numbers.reduce(into: 3, {
    print("\($0) - \($1)")
    // 3 - 1
    // 2 - 2
    // 0 - 3
    $0 -= $1
})
print(subtractFromThree)

// 첫 번째 리듀스 형태와 다르기 때문에 다른 컨테이너에 값을 변경하여 넣어줄 수 있음
// 이렇게 하면 맵이나 필터와 유사한 형태로 사용 가능
// 홀수는 걸러내고 짝수만 두 배로 변경하여 초깃값인 [1,2,3] 배열에 직접 연산
var doubledNumbers: [Int] = numbers.reduce(into: [1,2]) { (result: inout [Int], next: Int) in
    print("result: \(result) next : \(next)")
    // result: [1,2] next : 1
    // result: [1,2] next : 2
    // result: [1,2,4] next : 3
    guard next.isMultiple(of: 2) else {
        return
    }
    
    print("\(result) append \(next)")
    // [1,2] append 2
    
    result.append(next * 2)
}
print(doubledNumbers)

// 필터와 맵을 사용한 모습
doubledNumbers = [1,2] + numbers.filter { $0.isMultiple(of: 2) }.map { $0 * 2 }
print(doubledNumbers)

// 이름을 모두 대문자로 변환하여 초깃값인 빈 배열에 직접 연산
var upperCasedNames: [String]
upperCasedNames = names.reduce(into: [], {
    $0.append($1.uppercased())
})

print(upperCasedNames)

// 맵을 사용한 모습
upperCasedNames = names.map { $0.uppercased() }
print(upperCasedNames)
*/

//15-8
/*
let numbers: [Int] = [1,2,3,4,5,6,7]

// filter => 걸러내기 (기존 컨테니어 값에서 추출)
// map => 변형 (기존 컨테이너 값 변형)
// reduce => 합치기 (기존 컨테이너 값 합치기)

// 짝수를 걸러내어 각 값에 3을 곱해준 후 모든 값을 더함
var result: Int = numbers.filter{ $0.isMultiple(of: 2) }.map{ $0 * 3 }.reduce(0){ $0 + $1 }
print(result)

// for-in 구문 사용 시
result = 0

for number in numbers {
    guard number.isMultiple(of: 2) else {
        continue
    }
    result += number * 3
}

print(result)
*/


//15-9

enum Gender {
    case male, female, unknown
}

struct Friend {
    let name: String
    let gender: Gender
    let location: String
    var age: UInt
}

// 배열 생성
var friends: [Friend] = [Friend]()

friends.append(Friend(name: "Yoobato", gender: .male, location: "발리", age: 26))
friends.append(Friend(name: "JiSoo", gender: .male, location: "시드니", age: 24))
friends.append(Friend(name: "JuHyun", gender: .male, location: "경기", age: 30))
friends.append(Friend(name: "JiYoung", gender: .female, location: "서울", age: 22))
friends.append(Friend(name: "SungHo", gender: .male, location: "충북", age: 20))
friends.append(Friend(name: "JungKi", gender: .unknown, location: "대전", age: 29))
friends.append(Friend(name: "YoungMin", gender: .male, location: "경기", age: 24))

// filter => 걸러내기 (기존 컨테니어 값에서 추출)
// map => 변형 (기존 컨테이너 값 변형)
// reduce => 합치기 (기존 컨테이너 값 합치기)

// 맵으로 한 살씩 더해 새 Friend 배열을 생성
// 필터로 서울에 사는 친구들과 25세 미만인 친구들 걸러냄
// 리듀스로 변형된 자료를 원하는 모양으로 합쳐서 출력!
var result: [Friend] = friends.map{ Friend(name: $0.name, gender: $0.gender, location: $0.location, age: $0.age + 1) }

result = result.filter{ $0.location != "서울" && $0.age >= 25 }

let string: String = result.reduce("서울 외의 지역에 거주하며 25세 이상인 친구") { $0 + "\n" + "\($1.name) \($1.gender) \($1.location) \($1.age)세"}

print(string)

