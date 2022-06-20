import UIKit

// 24-1

/*
class Person {
    enum Job {  // 중첩 데이터 타입 Job 열거형
        case jobless, programmer, student
    }
    var job: Job = .jobless
}

class Student: Person {
    enum School { // 중첩 데이터 타입 School 열거형
        case elementary, middle, high
    }
    var school: School
    
    init(school: School) {
        self.school = school
        super.init()
        self.job = .student
    }
}

// 중첩 데이터 타입을 사용할 때는 자신을 둘러싼 타입(자신이 속해 있는 타입)의 이름을 자신보다 앞에 적어줘야 함
// Job 열거형은 Person내부에 정의되어 있지만 Person을 상속받은 Student 클래스의 중첩 데이터 타입으로도 취급 가능
// Person.Job == Student.Job 동일한 표현!
let personJob: Person.Job = .jobless
let studentJob: Student.Job = .student

let student: Student = Student(school: .middle)
print(student.job)
print(student.school)
*/

// 24-2

struct Sports {
    enum GameType {
        case football, basketball
    }
    
    var gameType: GameType

    struct GameInfo {
        var time: Int
        var player: Int
    }
    
    var gameInfo: GameInfo {
        switch self.gameType {
        case .basketball:
            return GameInfo(time: 40, player: 5)
        case .football:
            return GameInfo(time: 90, player: 11)
        }
    }
}

struct ESports {
    enum GameType {
        case online, offline
    }
    
    var gameType: GameType
    
    struct GameInfo {
        var location: String
        var pakage: String
    }
    
    var gameInfo: GameInfo {
        switch self.gameType {
        case .online:
            return GameInfo(location: "www.liveonline.co.kr", pakage: "LoL")
        case .offline:
            return GameInfo(location: "제주", pakage: "SA")
        }
    }
}

var basketball: Sports = Sports(gameType: .basketball)
print(basketball.gameInfo)

var sudden: ESports = ESports(gameType: .offline)
print(sudden.gameInfo)

let someGameType: Sports.GameType = .football
let anotherGameType: ESports.GameType = .online
//let errorIfYouWantIt: Sports.GameType = .online  // 오류!

// GameType, GameInfo와 같이 이름이 같더라도 역할이 달라야 할 때,
// 목적에 따라 타입을 중첩하면 타입의 목적성을 명확히 하는데 큰 도움이 된다.
