import UIKit


// 30-1, 2, 3, 4

// 포장된 상품 표현
protocol WrappedPrize {
    // 연관 타입은 프로토콜에서 사용할 수 있는 플레이스홀더 이름
    associatedtype Prize
    
    var wrapColor: String! { get }
    var prize: Prize! { get }
}

// 포장된 상품 프로토콜 정의
protocol Gundam { }
protocol Pokemon { }

struct WrappedGundam: WrappedPrize {
    var wrapColor: String!
    var prize: Gundam!
}

struct WrappedPokemon: WrappedPrize {
    var wrapColor: String!
    var prize: Pokemon!
}

// 뽑기 기계 구조체 정의

// WrappedPrize는 '제네릭 타입 제약'이 있어야 사용할 수 있는 타입, 반환X
// 왜냐하면 WrappedPrize 안에 있는 Prize를 추론할 힌트가 없기 때문
struct PrizeMachine {
    func dispenseRandomPrize() -> some WrappedPrize {
        return WrappedGundam()
    }
}

let machine: PrizeMachine = PrizeMachine()
let wrappedPrize = machine.dispenseRandomPrize()
