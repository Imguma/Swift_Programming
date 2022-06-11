import UIKit


//14-1
/*
class Room {
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
}

class Building {
    var name: String
    var room: Room?
    
    init(name: String) {
        self.name = name
    }
}

struct Address {
    var province: String
    var city: String
    var street: String
    var building: Building?
    var detailAddress: String?
}

class Person {
    var name: String
    var address: Address?
    
    init(name: String) {
        self.name = name
    }
}

//yagom에는 아직 주소, 건물, 호실 정보가 없는 상태
let yagom: Person = Person(name: "yagom")  // 인스턴스 생성

// 상수에 호실 번호를 할당하려고 옵셔널 체이닝을 사용하면
// yagom의 address 프로퍼티가 nil이므로 체이닝 도중 nil 반환!
let yagomRoomViaOptionalChaining: Int? = yagom.address?.building?.room?.number

// 상수에 호실 번호를 할당할 때는 강제 추출을 시도했기 때문에
// nil인 address 프로퍼티에 접근하려할 때 오류 발생
//let yagomRoomViaOptionalUnwraping: Int = yagom.address!.building!.room!.number

// ! (강제추출) -> 값을 강제 추출하기 때문에 옵셔널에 값이 없다면 런타임 오류 발생


// 14-4

let yagom2: Person = Person(name: "yagom")

var roomNumber: Int? = nil

if let yagomAddress: Address = yagom2.address {
    if let yagomBuilding: Building = yagomAddress.building {
        if let yagomRoom: Room = yagomBuilding.room {
            roomNumber = yagomRoom.number
        }
    }
}

// 옵셔널 바인딩 사용
// 옵셔널에 값이 있는지 확인할 때 사용
// 옵셔널에 값이 있다면 옵셔널에서 추출한 값을 일정 블록 안에서
// 사용할 수 있는 상수나 변수로 할당해서 옵셔널이 아닌 형태로 사용할 수 있도록 해줌
if let number: Int = roomNumber {  // 옵셔널 바인딩을 통한 임시 상수 할당
    print(number)
} else {
    print("Can not find room number")
}


//14-5

let yagom3: Person = Person(name: "yagom")

// 14-4를 옵셔널 체이닝으로 표현하면 훨씬 간단해짐!
// 옵셔널 바인딩 + 옵셔널 체이닝
// -> yagom.address?.building?.room?.number의 결괏값이 nil이 아님을 확인하는 동시에
//    roomNumber라는 상수로 받아올 수 있음!
if let roomNumber: Int = yagom3.address?.building?.room?.number {
    print(roomNumber)
} else {
    print("Can not find room number")
}
// yagom의 address가 nil이기 때문에 더이상 다음 체인의 building을 체크하지 않고 nil반환!


//14-6

// 아직 yagom3의 address 프로퍼티가 없고 그 하위의 building 프로퍼티도 room 프로퍼티가 없기 때문에
// 옵셔널 체이닝은 도중에 중지 될 것, number 프로퍼티는 존재조차 하지 않으므로 505가 할당되지 않음
yagom3.address?.building?.room?.number = 505
print(yagom3.address?.building?.room?.number)


//14-7

// 옵셔널 체이닝을 통한 값 할당
yagom3.address = Address(province: "충청북도", city: "청주시 청원구", street: "충청대로", building: nil, detailAddress: nil)
yagom3.address?.building = Building(name: "곰굴")
yagom3.address?.building?.room = Room(number: 0)
yagom3.address?.building?.room?.number = 505

print(yagom3.address?.building?.room?.number)
*/


//14-8
/*
class Room {
    var number: Int
    
    init(number: Int) {
        self.number = number
    }
}

class Building {
    var name: String
    var room: Room?
    
    init(name: String) {
        self.name = name
    }
}

class Person {
    var name: String
    var address: Address?
    
    init(name: String) {
        self.name = name
    }
}

struct Address {
    var province: String
    var city: String
    var street: String
    var building: Building?
    var detailAddress: String?
    
    init(province: String, city: String, street: String) {
        self.province = province
        self.city = city
        self.street = street
    }
    
    func fullAddress() -> String? {
        var restAddress: String? = nil
        
        if let buildingInfo: Building = self.building {
            restAddress = buildingInfo.name
        } else if let detail = self.detailAddress {
            restAddress = detail
        }
        
        if let rest: String = restAddress {
            var fullAddress: String = self.province
            
            fullAddress += " " + self.city
            fullAddress += " " + self.street
            fullAddress += " " + rest
            
            return fullAddress
        } else {
            return nil
        }
    }
    
    func printAddress() {
        if let address: String = self.fullAddress() {
            print(address)
        }
    }
}
let yagom3: Person = Person(name: "yagom")
yagom3.address = Address(province: "충청북도", city: "청주시 청원구", street: "충청대로")
yagom3.address?.building = Building(name: "곰굴")
yagom3.address?.building?.room = Room(number: 0)
yagom3.address?.building?.room?.number = 505

print(yagom3.address?.building?.room?.number)

// 옵셔널 체이닝을 통한 메서드 호출
// 메서드의 반환 타입이 옵셔널이라면 옵셔널 체인에서 사용 가능
yagom3.address?.fullAddress()?.isEmpty
yagom3.address?.printAddress()
*/

//14-9
/*
// 옵셔널 체이닝을 통해 서브스크립트 호출도 가능
// 서브스크립트는 인덱스를 통해 값을 넣고 빼올 수 있는 기능
// 서브스크립트는 Array, Dictionary에 많이 사용

let optionalArray: [Int]? = [1,2,3]
optionalArray?[1]  // 2

var optionalDictionary: [String: [Int]]? = [String: [Int]]()
optionalDictionary?["numberArray"] = optionalArray
optionalDictionary?["numberArray"]?[2]  // 3
*/


//14-11
/*
func greet(_ person: [String: String]) {
    // let name: String = person["name"] true면 아래 print문 실행
    // let name: String = person["name"] false면 return
    guard let name: String = person["name"] else {
        return
    }
    print("Hello \(name)")  // -- 1, 3
    
    // let location: String = person["location"] true 아래 print문 실행
    // let location: String = person["location"] false면 return
    guard let location: String = person["location"] else {
        print("I hope the weather is nice near you")  // -- 2
        return
    }
    print("I hope the weather is nice in \(location)")  // -- 4
}

var personInfo: [String: String] = [String: String]()
personInfo["name"] = "Jenny"
greet(personInfo)

personInfo["location"] = "Koera"
greet(personInfo)
*/


//14-13
/*
func enterClub(name: String?, age: Int) {
    // 구체적인 조건을 추가하고 싶다면 쉼표(,)로 추가조건 나열해주면 됨
    // 추가된 조건은 Bool 타입 값이어야 함
    // 쉼표로 추가된 조건은 AND 연산과 같은 결과를 줌, && 치환해도 같음
    guard let name: String = name, let age: Int = age, age > 19, name.isEmpty == false else {
        print("You are too young to enter the club")
        return
    }
    print("Welcome \(name)!")
}
*/


//14-14

/*
// guard 문은 함수나 메서드, 반복문 등 특정 블록 내부에 위치하지 않는다면 사용이 제한됨

let first: Int = 3
let second: Int = 5

guard first > second else {
    // 들어올 제어문 전환 명령이 없음.. 오류!
}
*/

