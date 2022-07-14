import UIKit

// 17-3

/*
struct Student {
    var name: String
    var number: Int
}

class School {
    var number: Int = 0
    var students: [Student] = [Student]()  // 빈 배열 생성
    
    func addStudent(name: String) {
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...) {
        for name in names {
            self.addStudent(name: name)
        }
    }
    
    // 읽기 전용 서브스크립트
    subscript(index: Int = 0) -> Student? {
        if index < self.number {
            return self.students[index]
        }
        return nil
    }
}

let highSchool: School = School()
highSchool.addStudents(names: "MiJeong", "JuHyun", "JiYoung", "SeongUk", "MoonDuk")

let aStudent: Student? = highSchool[1]
print("\(aStudent?.number), \(aStudent?.name)")
Optional("JuHyun")
print(highSchool[]?.name)  // 매개변수 기본값(index=0) 사용
*/


// 17-4

/*
struct Student {
    var name: String
    var number: Int
}

class School {
    var number: Int = 0
    var students: [Student] = [Student]()  // 빈 배열 생성
    
    func addStudent(name: String) {
        let student: Student = Student(name: name, number: self.number)
        self.students.append(student)
        self.number += 1
    }
    
    func addStudents(names: String...) {
        for name in names {
            self.addStudent(name: name)
        }
    }

    subscript(index: Int) -> Student? {   // 첫 번째 서브스크립트
        get {
            if index < self.number {
                return self.students[index]
            }
            return nil
        }
        set {
            guard var newStudent: Student = newValue else {
                return
            }
            var number: Int = index
            
            if index > self.number {
                number = self.number
                self.number += 1
            }
            newStudent.number = number
            self.students[number] = newStudent
        }
    }
    subscript(name: String) -> Int? {    // 두 번째 서브스크립트
        get {
            return self.students.filter{ $0.name == name }.first?.number
        }
        set {
            guard var number: Int = newValue else {
                return
            }
            
            if number > self.number {
                number = self.number
                self.number += 1
            }
            
            let newStudent: Student = Student(name: name, number: number)
            self.students[number] = newStudent
        }
    }
    subscript(name: String, number: Int) -> Student? {    // 세 번째 서브스크립트 - 읽기 전용
        return self.students.filter{ $0.name == name && $0.number == number }.first
    }
}

let highSchool: School = School()
highSchool.addStudents(names: "MiJeong", "JuHyun", "JiYoung", "SeongUk", "MoonDuk")

let aStudent: Student? = highSchool[1]
print("\(aStudent?.number) \(aStudent?.name)")

print(highSchool["MiJeong"])
print(highSchool["DongJin"])

highSchool[0] = Student(name: "HongEui", number: 0)
highSchool["MangGu"] = 1

print(highSchool["JuHyun"])
print(highSchool["MangGu"])
print(highSchool["SeongUk", 3])
print(highSchool["HeeJin", 3])
*/


// 17-5

// 타입 서브스크립트 : 타입 자체에서 사용할 수 있는 서브스크립트 static 키워드 추가
enum School: Int {
    case elementary = 1, middle, high, university
    
    static subscript(level: Int) -> School? {
        return Self(rawValue: level)
        // return School(rawValue: level) 과 같은 표현
    }
}

let school: School? = School[2]
print(school)
