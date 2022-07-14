import UIKit


// 29-3

/*
var step: Int = 1

func increment(_ number: inout Int) {
    number += step
}

//increment(&step)  // 오류발생!

// 함수 내부에서 같은 메모리 공간에 읽기 접근을 시도하기 때문에 메모리 접근 충돌 발생
*/


// 29-4

/*
var step: Int = 1
var copyOfStep: Int = step

func increment(_ number: inout Int) {
    number += copyOfStep
}

increment(&step)

// 새로운 변수 생성해서 해결
*/


// 29-5


func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

var playerOneScore: Int = 42
var playerTwoScore: Int = 30
balance(&playerOneScore, &playerTwoScore)

//balance(&playerOneScore, &playerOneScore)
// 같은 변수를 동시에 두 개의 입출력 매개변수로 전달하여 메모리 접근 충돌 발생
// playerOneScore 변수의 메모리 위치를 함수가 실행되는 동안 동시에 장기적 접근을 시도하기 때문에



// 29-6, 7, 9

struct GamePlayer {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    
    mutating func restoreHealth() {
        // 실행 중 인스턴스 자신인 self에 장기적 쓰기 접근
        self.health = GamePlayer.maxHealth
    }
    
    mutating func shareHealth(with teammate: inout GamePlayer) {
        balance(&teammate.health, &health)
    }
}

// 다른 코드 어디에서든 쓰일 수 있는 전역 변수
var oscar: GamePlayer = GamePlayer(name: "Oscar", health: 10, energy: 10)
var maria: GamePlayer = GamePlayer(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)
// 서로 다른 메모리 위치에 있기 때문에 메모리 접근 충돌 발생x!

//balance(&oscar.health, &oscar.energy)
//oscar의 프로퍼티인 health, energy 모두 쓰기 접근을 해야하므로 두 접근이 충돌하게 됨


func someFunction() {
    // 함수 안에서만 사용하는 지역변수이기 때문에 다른 위치의 코드에서 접근할 일 없음!
    // 그래서 컴파일러가 오류 취급하지 않음
    var oscar = GamePlayer(name: "Oscar", health: 10, energy: 10)
    balance(&oscar.health, &oscar.energy)
}
