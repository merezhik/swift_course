import Foundation


enum StudsError: Error {
    case noGroup
    case badAssestment(pointsNeed: Double)
    case wrongCount
    
}

struct Pupils {
    var count: Int
    var pass: Double
}

class Studs {
    
    var course = [
        "IT": Pupils(count:20, pass:52),
        "Математика": Pupils(count:24, pass:64),
        "Маркетинг": Pupils(count:30, pass:89),
        "История": Pupils(count:32, pass:79),
        "Философия": Pupils(count:26, pass:86)
    ]
    var points: Double = 0

    func stats(pupilName name: String) throws {
        
    guard let pupil = course[name] else {
        throw StudsError.noGroup
    }
        guard pupil.count > 0 else {
        throw StudsError.wrongCount
    }
        guard pupil.pass <= points else {
            throw StudsError.badAssestment(pointsNeed: pupil.pass - points)
    }
        points -= pupil.pass
        
        print("Группа \(pupil)\nПроходной балл: \(pupil.pass)\nКоличество студентов: \(pupil.count)")
        
    }
     
}
let studGroup = [
    "Елена": "Философия",
    "Игорь": "Математика",
    "Макс": "IT"
]

func takeStud(student: String, pupil: Studs) throws {
    let studName = studGroup[student] ?? "IT"
    try pupil.stats(pupilName: studName)
}

var student = Studs()
student.points = 45

do{
    try takeStud(student: "Василий", pupil: student )
} catch StudsError.noGroup {
    print("На курсе нет такой группы")
} catch StudsError.badAssestment(let pointsNeed){
    print("Низкий проходной бал, нужно еще \(pointsNeed) баллов.")
} catch StudsError.wrongCount {
    print("Другое колличество студентов в группе: ")
}
