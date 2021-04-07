import Foundation


enum Body: String {
    case hatchback = "Хэтчбэк"
    case sedan = "Седан"
    case offroad = "Внедорожник"
    case coupe = "Купе"
    case trunk = "Грузовик"
}

enum Engine: String {
    case start = "Двигатель работает"
    case stop = "Двигатель остановлен"
}

enum DoorState: String {
    case open = "Двери открыты"
    case close = "Двери закрыты"
}

enum LuggageState: String {
    case empty = "Кузов пуст"
    case full = "Кузов полностью загружен"
    case partFull = "Кузов заполнен неполностью"
    case notLoad = "Недопустимый объем груза"
}

enum WindState: String {
    case open = "Окна открыты"
    case close = "Окна закрыты"
}

protocol Car {
    
    var brand: String { get set }
    var model: String { get set }
    var countKm: Double { get set }
    var year: Int { get set }
    var luggage: Double { get set }
    var body: String { get set }
    var engine: String{ get set }
    var doorState: String { get set }
    var luggageChange: Double { get set }
    
    init(brand: String, model: String, countKm: Double, luggage: Double, year: Int, Body: String, Engine: String, DoorState: String)
    
    func increaseKm()
    func DoorAct()
    func ActEngine()
    func lugChange ()
}

extension Car {

    mutating func increaseKm(countKm: Double) -> Double {
        self.countKm += countKm
        return countKm
    }
    
    mutating func DoorAct(doorAct: DoorState){
        switch doorAct{
        case .open:
            print(doorAct.rawValue)
            self.doorState = DoorState.open.rawValue
        case .close:
            print(doorAct.rawValue)
            self.doorState = DoorState.close.rawValue
        }
    }
    
    mutating func ActEngine(actEng: Engine) {
        switch actEng{
        case .start:
            print(actEng.rawValue)
            self.engine = Engine.start.rawValue
        case .stop:
            print(actEng.rawValue)
            self.engine = Engine.stop.rawValue
        }
    }
    
    mutating func lugChange (luggageChange: Double) {
        if luggageChange == 0 {
            print(LuggageState.empty.rawValue)
        }else if luggageChange == luggage {
            print(LuggageState.full.rawValue)
        }else if luggageChange  > 0 && luggageChange < luggage {
            print(LuggageState.partFull.rawValue)
        }else if luggageChange  < 0 || luggageChange > luggage {
            print(LuggageState.notLoad.rawValue)
        }
    }
}

class SportCar: Car, CustomStringConvertible {
    
    var brand: String = ""
    var model: String = ""
    var countKm: Double = 0.0
    var year: Int = 0
    var luggage: Double = 0.0
    var body: String = ""
    var engine: String = ""
    var doorState: String = ""
    var luggageChange: Double = 0.0
    
    var sportW: String = " "

    required init(brand: String, model: String, countKm: Double, luggage: Double, year: Int, Body: String, Engine: String, DoorState: String) {
        self.brand = brand
        self.model = model
        self.countKm = countKm
        self.luggage = luggage
        self.year = year
        self.body = Body
        self.engine = Engine
        self.doorState = DoorState
    }
    
    init (sportW: String, luggageChange: Double){
        self.sportW = sportW
        self.luggageChange = luggageChange
    }
    
    func ActEngine() {
    }
    
    func DoorAct() {
    }
    
    func increaseKm() {
    }
    
    func lugChange () {
    }
    
    
    func WindApp(sportW: WindState){
        switch sportW {
        case .open:
            print(sportW.rawValue)
            self.sportW = WindState.open.rawValue
        case .close:
            print(sportW.rawValue)
            self.sportW = WindState.close.rawValue
        }
    }
    
}

extension SportCar {
    
    var description: String {
        return "Автомобиль \(brand) \(model) \(year) года выпуска\nПробег: \(countKm) км.\nКузов \(body)\nОбъем багажника \(luggage) л."
    }
    
}

class TrunkCar: Car{
    
    var brand: String = ""
    var model: String = ""
    var countKm: Double = 0.0
    var year: Int = 0
    var luggage: Double = 0.0
    var body: String = ""
    var engine: String = ""
    var doorState: String = ""
    var luggageChange: Double = 0.0

    var trunkB: String = " "
    
    required init(brand: String, model: String, countKm: Double, luggage: Double, year: Int, Body: String, Engine: String, DoorState: String) {
        self.brand = brand
        self.model = model
        self.countKm = countKm
        self.luggage = luggage
        self.year = year
        self.body = Body
        self.engine = Engine
        self.doorState = DoorState
    }
    init (trunkB: String, luggageChange: Double){
        self.trunkB = trunkB
        self.luggageChange = luggageChange
    }
    
    func ActEngine() {
    }
    
    func DoorAct() {
    }
    
    func increaseKm() {
    }
    
    func lugChange () {
     
    }
    
    enum BodyWorkState: String {
        case up = "Кузов поднят"
        case down = "Кузов опущен"
    }

    func bodyWorkApp(trunkB: BodyWorkState){
        switch trunkB {
        case .up:
            print(trunkB.rawValue)
            self.trunkB = BodyWorkState.up.rawValue
        case .down:
            print(trunkB.rawValue)
            self.trunkB = BodyWorkState.down.rawValue
        }
    }
}

extension TrunkCar: CustomStringConvertible {
    
    var description: String {
    return "Автомобиль \(brand) \(model) \(year) года выпуска\nПробег: \(countKm) км.\nКузов \(body)\nОбъем багажника \(luggage) л."
    }
}

var honda = SportCar(brand: "Honda", model: "CRV", countKm: 15000, luggage: 50, year: 2019, Body: Body.sedan.rawValue,Engine: Engine.stop.rawValue, DoorState: DoorState.open.rawValue)
var mers = SportCar(brand: "Mersedes", model: "AMG", countKm: 25000, luggage: 23, year: 2021, Body: Body.sedan.rawValue,Engine: Engine.stop.rawValue, DoorState: DoorState.open.rawValue)

var maz = TrunkCar(brand: "МАЗ", model: "OMG_2305", countKm: 150243.5, luggage: 2000, year: 2018, Body: Body.trunk.rawValue, Engine: Engine.start.rawValue, DoorState: DoorState.close.rawValue)


honda.description
print(honda)
print("")
honda.increaseKm(countKm: 10000)
print(honda)
print("")
print(honda)
honda.ActEngine(actEng: .start)
honda.DoorAct(doorAct: .close)
honda.WindApp(sportW: .open)
honda.lugChange(luggageChange: 15)
print("")
mers.description
print(mers)
print("")
mers.increaseKm(countKm: 5000)
print(mers)
print("")
print(mers)
mers.ActEngine(actEng: .start)
mers.DoorAct(doorAct: .close)
mers.WindApp(sportW: .open)
mers.lugChange(luggageChange: 24)
print("")
maz.description
print(maz)
print("")
maz.increaseKm(countKm: 10000)
print(maz)
print("")
print(maz)
maz.ActEngine(actEng: .stop)
maz.DoorAct(doorAct: .open)
maz.bodyWorkApp(trunkB: .up)
maz.lugChange(luggageChange: 0)


