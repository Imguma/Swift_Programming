import UIKit


//12-4
/*
private class AClass {
    
    //공개 접근수준을 부여해도 AClass의 접근수준이 비공개 접근수준이므로
    //이 메서드의 접근수준도 비공개 접근수준으로 취급됨
    public func someMethod() {
        // ...
    }
}

//AClass의 접근수준이 비공개 접근수준이므로
//공개 접근수준 함수의 매개변수나 반환 값 타입으로 사용할 수 없음
public func someFunction(a: AClass) -> AClass {  //오류 발생!
    return a
}
*/


//12-5

/*
internal class InternalClass {}
private struct PrivateStruct {}

//요소로 사용되는 InternalClass와 PrivateStruct의 접근수준이
//publicTuple보다 낮기 때문에 사용할 수 없음
public var publicTuple: (first: InternalClass, second: PrivateStruct) = (InternalClass(), PrivateStruct())

//요소로 사용되는 InternalClass와 PrivateStruct의 접근수준이
//publicTuple보다 같거나 높기 때문에 사용할 수 있음
private var privateTuple: (first: InternalClass, second: PrivateStruct) = (InternalClass(), Private())
*/


//12-8

/*
//fileprivate 접근수준으로 지정한 요소는 같은 파일 어떤 코드에서도 접근할 수 있음
//private 접근수준으로 지정한 요소는 같은 파일 내부에 다른 타입의 코드가 있더라도 접근 불가능
//그러나 자신을 확장하는 익스텐션 코드가 같은 파일에 존재하는 경우에는 접근 가능!
public struct SomeType {
    private var privateVariable = 0
    fileprivate var fileprivateVariable = 0
}

//같은 타입의 익스텐션에서는 private 요소에 접근 가능
extension SomeType {
    public func publicMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
    
    private func privateMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
    
    fileprivate func fileprivateMethod() {
        print("\(self.privateVariable), \(self.fileprivateVariable)")
    }
}

struct AnotherType {
    var someInstance: SomeType = SomeType()
    
    //스위프트에서 클래스는 래퍼런스타입, 구조체와 열거형은 값 타입
    //-> 값 타입의 속성은 기본적으로 인스턴스 메서드 내에서 수정할 수 없음
    //-> 값 타입의 속성을 수정하려면 인스턴스 메서드에서 mutating 키워드 사용해야함
    //-> mutating을 붙이면 self프로퍼티에 새로운 인스턴스 할당 가능
    mutating func someMethod() {
        self.someInstance.publicMethod()
        
        //fileprivate -> 같은 파일 어떤 코드에서도 접근 가능
        self.someInstance.fileprivateVariable = 100
        self.someInstance.fileprivateMethod()
        
        //private -> 같은 파일 내부에 다른 타입의 코드가 있더라도 접근 불가능
        //self.someInstance.privateVariable = 100   //오류
        //self.someInstance.privateMethod()         //오류
    }
}

var anotherInstance = AnotherType()
anotherInstance.someMethod()
*/


//12-9
public struct SomeType {
    private var count: Int = 0
    
    public var publicStoredProperty: Int = 0
    
    //공개 접근수준 저장 프로퍼티 publicGetOnlyStoredProperty
    //설정자(set)는 비공개 접근수준 - 읽기 전용
    public private(set) var publicGetOnlyStoredProperty: Int = 0
    
    internal var internalComputedProperty: Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
    
    //내부 접근수준 저장 프로퍼티 internalGetOnlyComputedProperty
    //설정자(set)는 비공개 접근수준 - 읽기 전용
    internal private(set) var internalGetOnlyComputedProperty: Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
    
    public subscript() -> Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
    
    //공개 접근수준 서브스크립트
    ////설정자(set)는 내부 접근수준
    public internal(set) subscript(some: Int) -> Int {
        get {
            return count
        }
        set {
            count += 1
        }
    }
}

var someInstance: SomeType = SomeType()

//외부에서 접근자, 설정자 모두 사용 가능
print(someInstance.publicStoredProperty)   //get 0
someInstance.publicStoredProperty = 100    //set count = 0

//외부에서 접근자만 사용 가능 - 읽기 전용
print(someInstance.publicGetOnlyStoredProperty)   //get 0
//someInstance.publicGetOnlyStoredProperty = 100  //set count = 0

//외부에서 접근자, 설정자 모두 사용 가능
print(someInstance.internalComputedProperty)      //get count = 0
someInstance.internalComputedProperty = 100       //set count = 1

//외부에서 접근자만 사용 가능 - 읽기 전용
print(someInstance.internalGetOnlyComputedProperty)   //get count = 1
//someInstance.internalGetOnlyComputedProperty = 100  //set count = 1

//외부에서 접근자, 설정자 모두 사용 가능
print(someInstance[])   //get count = 1
someInstance[] = 100    //set count = 2

//외부에서 접근자만, 같은 모듈 내에서는 설정자도 가능(internal 이니까!)
print(someInstance[0])  //get count = 2
someInstance[0] = 100   //set count = 3


//접근수준의 규칙 -> 함수의 매개변수(요소)로 사용되는 것은 함수 접근수준보다  같거나 높아야 함
//함수 뿐만아니라 튜플의 내부 요소 타입 또한 튜플의 접근수준보다 같거나 높아야 함

//읽기전용 -> 요소의 접근수준 키워드 뒤에 설정자의 접근수준을 같거나 더 낮게 설정
