import UIKit

//16-1,2,3,4

/*
func addThree(_ num: Int) -> Int {
    return num + 3
}

addThree(2)

//addThree 함수의 매개변수 타입은 Int고 아래는 Int?이기 때문에 오류!
//addThree(Optional(2))

//맵 메서드를 사용하면 연산가능!
//-> 요소 하나하나를 보면서 값이 있나 확인하면서 있으면 해당 요소 꺼냄

//값이 있을지도 없을지도 모르는 컨텍스트에 무조건 값(콘텐츠)를 담을 수 없기 때문에
//map메서드를 이용해 값을 꺼내줌 -> 전달받은 함수 적용 -> 결괏값을 다시 컨텍스트에 담아 반환!
Optional(2).map(addThree)
*/


//16-5

/*
var value: Int? = 2
value.map{ $0 + 3 }
value = nil
value.map{ $0 + 3 }
*/


//16-7
/*
func doubledEven(_ num: Int) -> Int? {
    if num.isMultiple(of: 2) {
        return num * 2
    }
    return nil
}

Optional(3).flatMap(doubledEven)
*/


/*
// 맵과 플랫맵의 차이
// 플랫맵은 내부의 값을 알아서 더 추출해줌

let optionalArr: [Int?] = [1,2,nil,5]

let mappedArr: [Int?] = optionalArr.map { $0 }
let flatmappedArr: [Int] = optionalArr.flatMap { $0 }

print(mappedArr)
print(flatmappedArr)

// 맵 메서드를 사용한 결과는 내부의 값의 타입이나 형태가 어찌 되었든, Array 내부에 값이 있으면 그 값을 그저 클로저의 코드를 실행하고 결과를 다시 Array 컨테이너에 담기만 함
// 플랫맵 메서드를 사용한 결과는 클로저를 실행하면 알아서 내부 컨테이너까지 값을 추출함

// 그래서 mappedArr은 다시 [Int?] 타입이 되고, flatmappedArr는 [Int] 타입이 된다
*/


//16-8

/*
let optionals: [Int?] = [1,2,nil,5]

let mapped: [Int?] = optionals.map{ $0 }
let compactMapped: [Int] = optionals.compactMap{ $0 }

print(mapped)
print(compactMapped)

// compactMapped는 flatMap과 동일한 기능을 함
// Optional 타입의 요소를 포장한 경우에 compactMap이라는 이름 사용
// 이 경우를 제외한 다른 경우에는 그대로 flatMap이라는 이름 사용
*/


//16-9

/*
// 삼중 컨테이너에 중첩된 맵과 플랫맵 사용
let multipleContainer = [[1,2,Optional.none], [3,Optional.none], [4,5,Optional.none]]
let mappedMultipleContainer = multipleContainer.map{ $0.map{ $0 }}
let flatmappedMultipleContainer = multipleContainer.flatMap{ $0.flatMap{ $0 }}
print(mappedMultipleContainer)
print(flatmappedMultipleContainer)
*/



//16-10

// String -> Int 변환
func stringToInteger(_ string: String) -> Int? {
    return Int(string)
}

// Int -> String 변환
func integerToString(_ integer: Int) -> String? {
    return "\(integer)"
}

var optionalString: String? = "2"

// 바인딩을 통한 체인 형식
let flattenResult = optionalString.flatMap(stringToInteger).flatMap(integerToString).flatMap(stringToInteger)

print(flattenResult)   // 결과는 옵셔널 타입

let mappedResult = optionalString.map(stringToInteger)
print(mappedResult)    // 결과는 옵셔널의 옵셔널 형태
 


//16-12

// 옵셔널 바인딩을 통한 연산
var result: Int?

// 플랫맵을 사용하지 않으면서도 플랫맵과 같은 효과를 얻으려면 바인딩을 직접 해주어야 함
if let string: String = optionalString {
    if let number: Int = stringToInteger(string) {
        if let finalString: String = integerToString(number) {
            if let finalNumber: Int = stringToInteger(finalString) {
                result = Optional(finalNumber)
            }
        }
    }
}

print(result)

if let string: String = optionalString,
   let number: Int = stringToInteger(string),
   let finalString: String = integerToString(number),
   let finalNumber: Int = stringToInteger(finalString) {
    result = Optional(finalNumber)
}

print(result)


//16-13

func integerToNil(param: Int) -> String? {
    return nil
}

optionalString = "2"

// 플랫맵은 체이닝 중간에 연산에 실패하는 경우나 값이 없어지는 경우에
// 별도의 예외 처리없이 빈 컨테이너를 반환
result = optionalString.flatMap(stringToInteger).flatMap(integerToNil).flatMap(stringToInteger)

print(result)
