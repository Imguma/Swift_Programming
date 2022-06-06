import UIKit

//2-6
let name: String = "imguma" //상수, 변경 불가능
var age: Int = 50
var job = "iOS Programmer" //타입 추론
var height = 190

print("\(type(of: height))")

age = 24
height = 157

print("저의 이름은 \(name)이고, 나이는 \(age)세이며, 직업은 \(job)입니다. 비밀이지만, 키는 \(height)센티미터입니댜.")
