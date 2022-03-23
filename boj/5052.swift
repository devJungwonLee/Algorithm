import Foundation

class Node {
    var children = [Int: Node]()
}

func check(_ phoneNumber: String) -> Bool {
    let numbers = phoneNumber.map { Int(String($0))! }
    var p: Node? = root
    var i = 0
    while i < numbers.count {
        if p!.children[numbers[i]] == nil { break }
        p = p!.children[numbers[i]]
        i += 1
    }
    if p !== root, p!.children.isEmpty { return false }
    if i == numbers.count { return false }
    while i < numbers.count {
        p!.children[numbers[i]] = Node()
        p = p!.children[numbers[i]]
        i += 1
    }
    return true
}

var root = Node()
let t = Int(readLine()!)!
for _ in 0..<t {
    root.children.removeAll()
    let n = Int(readLine()!)!
    var result = true
    for _ in 0..<n {
        let phoneNumber = readLine()!
        if !result { continue }
        let tmp = check(phoneNumber)
        if !tmp { result = false }
    }
    if result { print("YES") }
    else { print("NO") }
}