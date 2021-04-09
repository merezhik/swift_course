import Foundation

struct Stack <T> {
    
    var items = [T]()
    
    mutating func push (_ item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var intStack = Stack<Int>()
var strStack = Stack<String>()
var item1 = 5
var item2 = 23
var item3 = 42
var item4 = 56
var item5 = 78
var name1 = "Jack"
var name2 = "Alex"
var name3 = "Bob"
var name4 = "Mike"
var name5 = "Nick"

intStack.push(item1)
intStack.push(item2)
intStack.push(item3)
intStack.push(item4)
intStack.push(item5)
intStack.pop()
intStack.push(67)
print(intStack.items)
print("")
strStack.push(name1)
strStack.push(name2)
strStack.push(name3)
strStack.push(name4)
strStack.push(name5)
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
