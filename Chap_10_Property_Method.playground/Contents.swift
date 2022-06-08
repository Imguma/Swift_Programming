import UIKit

//10-1
/*
struct CoordinatePoint {
    var x: Int   //저장 프로퍼티
    var y: Int   //저장 프로퍼티
}

//구조체에는 기본적으로 저장 프로퍼티를 매개변수로 갖는 이니셜라이저가 있다.
let yagomPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

class Position {
    var point: CoordinatePoint  //저장 프로퍼티
    
    let name: String
    
    //프로퍼티 기본값을 지정해주지 않는다면 이니셜라이저를 따로 정의해주어야 한다.
    init(name: String, currentPoint: CoordinatePoint) {
        self.name = name
        self.point = currentPoint
    }
}

//사용자 정의 이니셜라이저 호출, 그렇지 않으면 프로퍼티 초깃값을 할당할 수 없기 때문에 인스턴스 생성 불가능
let yagomPosition: Position = Position(name: "yagom", currentPoint: yagomPoint)


//구조체는 프로퍼티에 맞는 이니셜라이저를 자동으로 제공하지만
//클래스는 그렇지 않아서 클래스 인스턴스의 저장 프로퍼티를 사용하는 일은 좀 번거로움
//하지만 클래스의 저장 프로퍼티에 초깃값을 지정해주면 따로 사용자 정의 이니셜라이저를 구현해줄 필요가 없음

*/


//10-2
/*
struct CoordinatePoint {
    var x: Int = 0   //저장 프로퍼티
    var y: Int = 0  //저장 프로퍼티
}

//초깃값을 할당했다면 굳이 전달인자로 초깃값 넘길 필요 없음
let yagomPoint: CoordinatePoint = CoordinatePoint()

//물론 기존에 초깃값을 할당할 수 있는 이니셜라이저도 사용 가능
let wizplanPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)


print("yagom's point: \(yagomPoint.x), \(yagomPoint.y)")
print("wizplan's point: \(wizplanPoint.x), \(wizplanPoint.y)")

class Position {
    var point: CoordinatePoint = CoordinatePoint()   //저장 프로퍼티
    var name: String = "Unknown"  //저장 프로퍼티
}

//초깃값을 지정해줬다면 사용자 정의 이니셜라이저 사용하지 않아도 됨
let yagomPosition: Position = Position()

print("yagomPosition point: \(yagomPosition.point)")
print("yagomPosition name: \(yagomPosition.name)")

yagomPosition.point = wizplanPoint
yagomPosition.name = "yagom"

print("yagomPosition point: \(yagomPosition.point)")
print("yagomPosition name: \(yagomPosition.name)")
*/


//10-3
/*
struct CoordinatePoint {
    //위치는 x,y 값이 모두 있어야 하므로 옵셔널이면 안됨
    var x: Int
    var y: Int
}

class Position {
    //현재 사람의 위치를 모를 수도 있음 - 옵셔널
    var point: CoordinatePoint?
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

//이름은 필수지만 위치는 모를 수 있다.
let yagomPosition: Position = Position(name: "yagom")

//위치를 알게되면 그 때 할당
yagomPosition.point = CoordinatePoint(x: 20, y: 10)
*/


//10-4
/*
struct CoordinatePoint {
    var x: Int = 0
    var y: Int = 0
}

class Position {
    //호출이 있어야 값을 초기화
    lazy var point: CoordinatePoint = CoordinatePoint()
    let name: String
    
    init(name: String){
        self.name = name
    }
}

let yagomPosition: Position = Position(name: "yagom")

 
//이 코드를 통해 point프로퍼티에 처음 접근할 때
//point 프로퍼티의 CoordinatePoint가 생성됨
print(yagomPosition.point)
*/


//10-5
/*
struct CoordinatePoint {
    var x: Int  //저장 프로퍼티
    var y: Int  //저장 프로퍼티
    
    //대칭점을 구하는 메서드 - 접근자
    func oppositePoint() -> Self {
        return CoordinatePoint(x: -x, y: -y)
    }
    
    //대칭점을 설정하는 메서드 - 설정자
    mutating func setOppositePoint(_ opposite: CoordinatePoint) {
        x = -opposite.x
        y = -opposite.y
    }
}

var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)

//현재 좌표
print(yagomPosition)
//대칭 좌표
print(yagomPosition.oppositePoint())
//대칭 좌표 설정
yagomPosition.setOppositePoint(CoordinatePoint(x: 15, y: 10))
//현재 좌표
print(yagomPosition)
*/


//10-6
/*
struct CoordinatePoint {
    var x: Int  //저장 프로퍼티
    var y: Int  //저장 프로퍼티
    
    //이런식으로 연산 프로퍼티를 사용하면 하나의 프로퍼티에 접근자와 설정자가 모두 있고
    //해당 프로퍼티가 어떤 역할을 하는지 좀 더 명확하게 표현 가능
    //인스턴스를 사용하는 입장에서도 마치 저장 프로퍼티인 것처럼 편하게 사용
    var oppositePoint: CoordinatePoint {  //연산 프로퍼티
        get { //접근자
            return CoordinatePoint(x: -x, y: -y)
        }
        set(opposite) {  //설정자
            x = -opposite.x
            y = -opposite.y
        }
    }
}

var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)

//현재 좌표
print(yagomPosition)
//대칭 좌표
print(yagomPosition.oppositePoint)
//대칭 좌표 설정
yagomPosition.oppositePoint = CoordinatePoint(x: 15, y: 10)
//현재 좌표
print(yagomPosition)
*/


//10-7
/*
struct CoordinatePoint {
    var x: Int  //저장 프로퍼티
    var y: Int  //저장 프로퍼티
    
    //연산 프로퍼티
    var oppositePoint: CoordinatePoint {
        get { //접근자 내부의 코드가 한 줄이고, 그 결괏값의 타입이 프로퍼티의 타입과 같다면 return 키워드 생략 가능
            return CoordinatePoint(x: -x, y: -y)
        }
        set { //매개변수 이름을 대신할 수 있는 newValue
            x = -newValue.x
            y = -newValue.y
        }
    }
}
*/


//10-8
/*
struct CoordinatePoint {
    var x: Int   //저장 프로퍼티
    var y: Int   //저장 프로퍼티
    
    //대칭 좌표
    var oppositePint: CoordinatePoint {  //읽기 전용 연산 프로퍼티
        get {  //접근자
            return CoordinatePoint(x: -x, y: -y)
        }
    }
}

var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 20)

print(yagomPosition)

print(yagomPosition.oppositePint)

//설정자를 구현하지 않았으므로 오류!
//yagomPosition.oppositePint = CoordinatePoint(x: 15, y: 10)
*/


//10-9
/*
class Account {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
}

let myAccount: Account = Account()

myAccount.credit = 1000
*/


//10-10
/*
class Account {
    var credit: Int = 0 {  //저장 프로퍼티
        //프로퍼티 감시자
        willSet {
            print("A 잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        
        didSet {
            print("A 잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
    
    var dollarValue: Double {  //연산 프로퍼티
        get {
            return Double(credit)
        }
        set {
            credit = Int(newValue * 1000)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

//상속 받았다면 기존의 연산 프로퍼티를 재정의하여 프로퍼티 감시자 구현 가능
//연산 프로퍼티를 재정의해도 기존 부모클래스의 연산 프로퍼티 기능(get, set메서드)은 동작
class ForeignAccount: Account {
    override var dollarValue: Double {  //연산 프로퍼티 재정의
        willSet {
            print("F 잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }
        didSet {
            print("F 잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
        }
    }
}

let myAccount: ForeignAccount = ForeignAccount()
// willSet(Account credit) 0 -> 1000 변경 예정
myAccount.credit = 1000
// didSet(Account credit) 0 -> 1000 변경 됨

// (Account dollarValue) 1000 -> 2 변경 예정
//
myAccount.dollarValue = 2

*/


//10-11
/*
var wonInPocket: Int = 2000 {  //저장변수(저장 프로퍼티처럼 값을 저장)
    willSet {
        print("주머니의 돈이 \(wonInPocket)원에서 \(newValue)원으로 변경될 예정입니다.")
    }
    didSet {
        print("주머니의 돈이 \(oldValue)원에서 \(wonInPocket)원으로 변경되었습니다.")
    }
}

var dollarInPocket: Double {  //연산변수
    get {
        return Double(wonInPocket)
    }
    set {
        wonInPocket = Int(newValue * 1000.0)
        print("주머니의 달러를 \(newValue)달러로 변경 중입니다.")
    }
}

dollarInPocket = 3.5
*/


//10-12
/*
class AClass {
    //저장 타입 프로퍼티
    static var typeProperty: Int = 0 //반드시 초깃값 지정
    
    //저장 인스턴스 프로퍼티
    var instanceProperty: Int = 0 {
        didSet {
            //Self.typeProperty = AClass.typeProperty
            Self.typeProperty = instanceProperty + 100
        }
    }
    
    //연산 타입 프로퍼티
    static var typeComputedProperty: Int {  //변수로만 선언
        get {
            return typeProperty
        }
        set {
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123
print(AClass.typeProperty)

let classInstance: AClass = AClass()
classInstance.instanceProperty = 100

print(AClass.typeProperty)
print(AClass.typeComputedProperty)
*/

//10-13
/*
//타입 프로퍼티를 타입 상수로 사용할 수 있음
class Account {
    static let dollarExchangeRate: Double = 1000.0   //타입 상수
    
    var credit: Int = 0
    
    var dollarValue: Double {
        get {
            return Double(credit)
        }
        
        set {
            credit = Int(newValue * Account.dollarExchangeRate)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}
*/

//10-14
/*
class Person {  //클래스는 참조 타입
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Stuff {  //구조체는 값 타입
    var name: String
    var owner: Person
}

print(type(of: \Person.name))
print(type(of: \Stuff.name))
*/


//10-16
/*
class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
}
struct Stuff {
    var name: String
    var owner: Person
}
    
let yagom = Person(name: "yagom")
let hana = Person(name: "hana")
let macbook = Stuff(name: "MacBook Pro", owner: yagom)
var iMac = Stuff(name: "iMac", owner: yagom)
let iPhone = Stuff(name: "iPhone", owner: hana)
    
let stuffNameKeyPath = \Stuff.name
let ownerkeyPath = \Stuff.owner
    
let ownerNameKeyPath = ownerkeyPath.appending(path: \.name)

//키 경로와 서브스크립트를 이용해 프로퍼티에 접근하여 값을 가져옴
print(macbook[keyPath: stuffNameKeyPath])
print(iMac[keyPath: stuffNameKeyPath])
print(iPhone[keyPath: stuffNameKeyPath])

print(macbook[keyPath: ownerNameKeyPath])
print(iMac[keyPath: ownerNameKeyPath])
print(iPhone[keyPath: ownerNameKeyPath])

//키 경로와 서브스크립트를 이용해 프로퍼티에 접근하여 값을 변경
iMac[keyPath: stuffNameKeyPath] = "iMac Pro"
iMac[keyPath: ownerkeyPath] = hana

print(iMac[keyPath: stuffNameKeyPath])
print(iMac[keyPath: ownerNameKeyPath])
*/



//10-18
/*
class LevelClass {
    //현재 레벨을 저장하는 저장 프로퍼티
    var level: Int = 0 {
        //프로퍼티 값이 변경되면 호출하는 프로퍼티 감시자
        didSet {
            print("Level \(level)")
        }
    }
    //클래스의 인스턴스 메서드
    func levelUp() {
        print("Level Up!")
        level += 1
    }

    func levelDown() {
        print("Level Down")
        level -= 1
        if level < 0 {
            reset()
        }
    }

    func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }

    func reset() {
        print("Reset!")
        level = 0
    }
}

var levelClassInstance: LevelClass = LevelClass()
levelClassInstance.levelUp()

levelClassInstance.levelDown()

levelClassInstance.levelDown()

levelClassInstance.jumpLevel(to: 3)
*/


//10-19
/*
//구조체나 열거형 등은 값 타입이므로 메서드 앞에 mutating키워드를 붙여서
//해당 메서드가 인스턴스 내부의 값을 변경한다는 것을 명시해야함

struct LevelStruct {
    var level: Int = 0 {
        didSet {
            print("Level \(level)")
        }
    }
    
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    mutating func levelDown() {
        print("Level Down")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    
    mutating func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    
    mutating func reset() {
        print("Reset!")
        level = 0
    }
}

var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()

levelStructInstance.levelDown()

levelStructInstance.levelDown()

levelStructInstance.jumpLevel(to: 3)

*/


//10-21
/*
class LevelClass {
    var level: Int = 0
    
    func reset() {
        //오류! self 프로퍼티는 참조 변경이 불가!
        //self = LevelClass()
    }
    
}

struct LevelStruct {
    var level: Int = 0
    
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    mutating func reset() {
        print("Reset!")
        self = LevelStruct()
    }
}

var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()
print(levelStructInstance.level)

levelStructInstance.reset()
print(levelStructInstance.level)

enum OnOffSwitch {
    case on, off
    mutating func nextState() {
        self = self == .on ? .off : .on
    }
}

var toggle: OnOffSwitch = OnOffSwitch.off
toggle.nextState()
print(toggle)
*/


//10-22
/*
struct Puppy {
    var name: String = "멍멍이"
    
    func callAsFunction() {
        print("멍멍")
    }
    func callAsFunction(destination: String) {
        print("\(destination)(으)로 달려갑니다")
    }
    func callAsFunction(something: String, times: Int) {
        print("\(something)(을)를 \(times)번 반복합니다")
    }
    func callAsFunction(color: String) -> String {
        return "\(color) 옷"
    }
    mutating func callAsFunction(name: String) {
        self.name = name
    }
}

var doggy: Puppy = Puppy()
doggy.callAsFunction()
//doggy() = doggy.callAsFunction(destination: "집")
doggy()
doggy.callAsFunction(destination: "집")
doggy(destination: "뒷동산")
doggy(something: "재주넘기", times: 3)
print(doggy(color: "무지개색"))
doggy(name: "댕댕이")
print(doggy.name)
*/


//10-23
/*
class AClass {
    static func staticTypeMethod() {
        print("AClass staticTypeMethod")
    }
    
    class func classTypeMethod() {
        print("AClass classTypeMethod")
    }
}

class BClass: AClass {
    /*   //오류 발생! static은 상속후 메서드 재정의 불가능
    override static func staticTypeMethod() {
        
    }
    */
    override class func classTypeMethod() {
        print("BClass classTypeMethod")
    }
}

AClass.staticTypeMethod()
AClass.classTypeMethod()
BClass.classTypeMethod()
*/


//10-24

//시스템 음량은 한 기기에서 유일한 값이어야 함
struct SystemVolume {
    //타입 프로퍼티를 사용하면 언제나 유일한 값이 됨
    static var volume: Int = 5
    
    //타입 프로퍼티를 제어하기 위해 타입 메서드 사용
    static func mute() {
        self.volume = 0   //SystemVolume.volume = 0과 같은 표현
    }
}

//내비게이션 역할은 여러 인ㄴ스턴스가 수행할 수 있음
class Navigation {
    //내비게이션 인스턴스마다 음량을 따로 설정 가능
    var volume: Int = 5
    
    //길 안내 음성 재생
    func guideWay() {
        SystemVolume.mute()
    }
    
    //길 안내 음성 종료
    func finishGuideWay() {
        //기존 재생원 음량 복구
        SystemVolume.volume = self.volume
    }
}

SystemVolume.volume = 10
let myNavi: Navigation = Navigation()

myNavi.guideWay()
print(SystemVolume.volume)  //0

myNavi.finishGuideWay()
print(SystemVolume.volume)  //5
