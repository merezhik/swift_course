import Foundation

//Из недоделанных заданий были только 5 и 6 задание под * ко второму уроку, с ними я разобрался сперва с точки зрения математики
//После этого просмотрел ваше решение и разобрался с принципами решения в функциях подробно, потому более оригинального кода чем похожий на Ваш придумать не смог)
//Так же не добил сабскрипт к 6 уроку в задании 3* и была рекомендация по исключению отдельных переменных для добавления в стэк, тут я в принципе это понимал, потому скорректировал немного код и в этом вопросе)
// Тест планирую закрыть в ближайшие дни, хочу еще раз пробежаться по всему синтаксису курса, тк принципы методов и объектов понимаю, но местами долго синтаксис подгоняю, потому и вопросы скорее уже в индивидуальном порядке)

print("Урок 2, задание 5*")
print("")

func fibonachi(count: Int) -> [Double]{
    var arrFib: [Double] = []
    if count == 1 {
        let f0: Double = 0
        arrFib.append(f0)
    }else if count == 2 {
        let f1: Double = 1
        let f0: Double = 0
        arrFib.append(f0)
        arrFib.append(f1)
    }else {
        let f1: Double = 1
        let f0: Double = 0
        arrFib.append(f0)
        arrFib.append(f1)
        var n = 2
        while n < count + 2 {
            let nf = (arrFib[n-1]) + (arrFib[n-2])
            arrFib.append(nf)
            n+=1
        }
    }
    return arrFib
}
 print(fibonachi(count: 50))

print("")
print("Урок 2, задание 6*")
print("")

var intNums: [Int] = []

while intNums.count != 100{
    intNums.append(intNums.count+2)
}
print(intNums)

var p: Int
var i = 0
while i < intNums.count - 1{
    p = intNums[i]
    for num in intNums{
        if (num != p) && (num % p == 0) {
            intNums.remove(at: intNums.firstIndex(of: num)!)
        }
    }
    i += 1
}
print(intNums)

print("")
print("Урок 6, задание 3*")
print("")

struct Stack <T> {
    
    var items = [T]()
    
    mutating func push (_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    subscript (index: Int) -> T? {
        return (index < items.count ? items[index]: nil)
    }
}

var intStack = Stack<Int>()
var strStack = Stack<String>()

intStack.push(5)
intStack.push(23)
intStack.push(42)
intStack.push(56)
intStack.push(78)
intStack.pop()
intStack.push(67)
print(intStack.items)
print("")
strStack.push("Jack")
strStack.push("Alex")
strStack.push("Bob")
strStack.push("Mike")
strStack.push("Nick")
strStack.pop()
print(strStack.items)
print("")

let even: (Int) -> Bool = {(item: Int) -> Bool in
    return item % 2 == 1
}

func filter (array: [Int], predicate: (Int) -> Bool ) -> [Int] {
    var tmpArray = [Int]()
    for item in array {
        if predicate(item){
            tmpArray.append(item)
        }
    }
    return tmpArray
}

let oddNum = filter(array: intStack.items, predicate: even)
print(oddNum)
print("")
let evenNum = intStack.items.filter {$0 % 2 == 0}
print(oddNum)
print("")

func namesAbc(_ n1: String, _ n2: String) -> Bool {
    return n1 < n2
}
var namesAlfabetic = strStack.items.sorted(by: namesAbc)
print(namesAlfabetic)
print("")

namesAlfabetic = strStack.items.sorted(by: { (n1: String, n2: String) -> Bool in
    return n1 > n2
})

print(namesAlfabetic)
