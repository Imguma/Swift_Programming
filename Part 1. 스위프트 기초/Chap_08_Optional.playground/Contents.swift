import UIKit
import Darwin

//8-2
/*
var myName: String? = "yagom"
print(myName)

//nil은 옵셔널로 선언된 곳에서만 사용될 수 있음
myName = nil

print(myName)
*/


//8-3

//옵셔널은 값을 가지는 케이스와 그렇지 못한 케이스 두 가지로 정의되어 있음
//즉, nil 일 때는 none케이스가 되고 값이 있는 경우는 some케이스가 되는데 연관 값으로 Wrapped가 있음
//따라서 옵셔널에 값이 있으면 some의 연관 값인 Wrapped에 값이 할당된다
//즉, 값이 옵셔널이라는 열거형의 방패막에 보호되어 래핑되어 있는 모습!

/*
public enum Optional<Wrapped> : ExpressibleByNilLiteral {
    case none
    case some(Wrapped)
    public init(_ some: Wrapped)
    // ...
}
*/

//8-4

/*
//옵셔널 자체가 열거형이기 때문에 옵셔널 변수는 switch문을 통해 값이 있고 없음을 확인 할 수 있음
func checkOptionalValue(value optionalValue: Any?) {
    switch optionalValue {
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
    }
}

var myName: String? = "yagom"
checkOptionalValue(value: myName)

myName = nil
checkOptionalValue(value: myName)
*/


//8-5
/*
let numbers: [Int?] = [2, nil, -4, nil, 100]

for number in numbers {
    switch number {
    case .some(let value) where value < 0:
        print("Negative value!! \(value)")
    case .some(let value) where value > 10:
        print("Large value!! \(value)")
        
    case .some(let value):
        print("Value \(value)")
        
    case .none:
        print("nil")
    }
}
*/

//옵셔널 추출

//8-6
/*
//옵셔널강제 추출
//옵셔널의 값을 추출하는 가장 간단하지만 가장 위험한 방법, 런타임 오류 발생 가능성이 높음
//옵셔널 값의 뒤에 !붙이면 강제추출 반환, 만약 강제 추출시 옵셔널에 값이 없다면(nil) 런타임 오류

var myName: String? = "yagom"

var yagom: String = myName!

//myName = nil
//yagom = myName!   //강제추출, 런타임 오류 발생

//if구문을 통해 좀 더 안전하게 처리 가능
if myName != nil {
    print("My name is \(myName!)")
}
else {
    print("myName == nil")
}

//런타임 오류의 가능성을 항상 내포하기 때문에 옵셔널 강제 추출 방식은 지양

*/

//8-7
/*
//옵셔널 바인딩 : 옵셔널에 값이 있는지 확인할 때 사용
//옵셔널에 값이 있다면 옵셔널에서 추출한 값을 일정 블록 안에서 사용할 수 있는 상수나 변수로 할당해서
//옵셔널이 아닌 형태로 사용할 수 있도록 해줌

var myName: String? = "yagom"

//옵셔널 바인딩을 통한 임시 상수 할당
if let name = myName {   //1. 임시 상수 name은 if구문을 실행하는 블록 안쪽에서만 사용 가능. if밖과 else문에서 사용x
    print("My name is \(name)")
}
else {
    print("myName == nil")
}

//옵셔널 바인딩을 통한 임시 변수 할당
if var name = myName {    //2. 그렇기 때문에 같은 name을 사용했지만 충돌이 일어나지 않음
    name = "wizplan"  //변수이므로 내부에서 변경 가능!
    print("My name is \(name)")
}
else {
    print("myName == nil")
}
*/

//8-8
/*
//옵셔널 바인딩을 사용한 여러 개의 옵셔널 값의 추출
//단, 바인딩하려는 옵셔널 중 하나라도 값이 없다면 해당 블록 내부의 명령문은 실행되지x

var myName: String? = "yagom"
var yourName: String? = nil

//friend에 값이 업기 때문에 실행되지x
if let name = myName, let friend = yourName {
    print("We are friend! \(name) & \(friend)")
}

yourName = "eric"

if let name = myName, let friend = yourName {
    print("We are friend~ \(name) & \(friend)")
}
*/


//8-9

//암시적 추출 옵셔널의 사용

//때때로 nil을 할당하고 싶지만 옵셔널 바인딩으로 매번 값을 추출하기 귀찮거나 로직상 런타임오류가 발생할것 같지 않을때
//nil을 할당해줄수 있는, 옵셔널이 아닌 변수나 상수가 있으면 좋을것 같을때 -> 암시적 추출 옵셔널

//암시적 추출 옵셔널로 지정된 타입은 일반 값처럼 사용할 수 있으나, 여전히 옵셔널이기 때문에 nil도 할당 가능
//그러나 nil이 할당되어 있을 때 접근하면 런타임 오류 발생

var myName: String! = "yagom"
print(myName)
myName = nil

//암시적 추출 옵셔널도 옵셔널이므로 당연히 바인딩 사용 가능
if let name = myName {
    print("My name is \(name)")
} else {
    print("myName == nil")
}

//nil이 할당되어 있을 때 접근하면 런타임 오류 발생
//myName.isEmpty
