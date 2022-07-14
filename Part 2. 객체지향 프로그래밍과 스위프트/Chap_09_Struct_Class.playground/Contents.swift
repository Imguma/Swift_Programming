import UIKit

//9-2
/*
//구조체 정의
struct BasicInformation {
    var name: String
    var age: Int
}

//프로퍼티 이름(name, age)으로 자동 생성된 이니셜라이저를 사용하여 구조체 생성
var yagomInfo: BasicInformation = BasicInformation(name: "yagom",age: 99)
//프로퍼티 값에 접근시 . 사용
yagomInfo.age = 100
yagomInfo.name = "Seba"

//상수로 선언해서 내부의 프로퍼티 값을 변경할 수 없음
let sebaInfo: BasicInformation = BasicInformation(name: "Seba", age: 99)
//sebaInfo.age = 100   //변경불가 오류!
//jennyInfo.age = 100  //변경불가 오류!
*/


//9-4
/*
class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var yagom: Person = Person()
yagom.height = 123.4
yagom.weight = 123.4

//구조체와 다르게 클래스의 인스턴스는 참조 타입이므로
//클래스의 인스턴스를 상수 let으로 선언해도 내부 프로퍼티 값을 변경할 수 있음
let jenny: Person = Person()
jenny.height = 123.4
jenny.height = 123.4
*/

//9-5
/*
class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
    
    deinit { //디이니셜라이저 : 더이상 참조할 필요가 없을 때 메모리에서 해제될때(소멸) 소멸 직전 호출되는 메서드
        print("Person 클래스의 인스턴스가 소멸됩니다.")
    }
}

var yagom: Person? = Person()
yagom = nil  //Person 클래스의 인스턴스가 소멸됨

//보통 deinit메서드에는 인스턴스가 메모리에서 해제되기 직전에 처리할 코드를 넣어줌
//예를 들어 인스턴스 소멸 전에 데이터를 저장한다거나 다른 객체에 인스턴스 소멸을 알려야 할 때
*/



//9-6
/*
struct BasicInformation {
    let name: String
    var age: Int
}

var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)
yagomInfo.age = 100

//yagomInfo의 값을 복사해서 할당
var friendInfo: BasicInformation = yagomInfo

print("yagom's age: \(yagomInfo.age)")   //100
print("friend's age: \(friendInfo.age)") //100

friendInfo.age = 999

print("yagom's age: \(yagomInfo.age)")   //100
print("friend's age: \(friendInfo.age)") //999 - yagomInfo의 값을 복사해왔기 떄문에 별개의 값을 가짐


class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var yagom: Person = Person()
var friend: Person = yagom  //yagom의 참조를 할당!

print("yagom's height: \(yagom.height)")    //0.0
print("friend's height: \(friend.height)")  //0.0

friend.height = 185.5
print("yagom's height: \(yagom.height)")    //185.5 - friend는 yagom을 참조하기 때문에 값이 변동됨
print("friend's height: \(friend.height)")  //185.5 - 참조하는 곳이 같은 곳임을 알 수 있음

func changeBasicInfo(_ info: BasicInformation) {  //yagomInfo의 값을 전달 받음
    var copiedInfo: BasicInformation = info
    copiedInfo.age = 1
    print("copiedInfo's name : \(copiedInfo.name)  copiedInfo's age: \(copiedInfo.age)")
}

func changePersonInfo(_ info: Person) {
    info.height = 155.3
}

changeBasicInfo(yagomInfo)
print("yagom's age: \(yagomInfo.age)")   //100 - 값이 복사되어 전달되기 때문에 값만 전달되는 것

changePersonInfo(yagom)
print("yagom's height: \(yagom.height)") //155.3 - 참조가 전달되었기 때문에 값이 변함


//값 타입의 데이터를 함수의 전달인자로 전달하면 메모리에 전달인자를 위한 인스턴스가 새로 생성됨
//생성된 새 인스턴스에는 전달하려는 값이 복사되어 들어감

//참조 타입의 데이터는 전달인자로 전달하 때 기존 인스턴스의 참조를 전달하므로
//새로운 인스턴스가 아닌 기존의 인스턴스 참조 전달
*/


//9-7

//클래스의 인스턴스끼리 참조가 같은지 확인할 때 식별 연산자사용
class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

var yagom: Person = Person()
let friend: Person = yagom
let anotherFriend: Person = Person()

print(yagom === friend)
print(yagom === anotherFriend)
print(friend !== anotherFriend)


