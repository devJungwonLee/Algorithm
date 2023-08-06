var dict = [[String]: Int]()

func isGreaterThanOrEqual(_ lhs: String, _ rhs: String) -> Bool {
    if lhs.count >  rhs.count { return true }
    else if lhs.count < rhs.count { return false }
    else { return lhs >= rhs }
}

func count(_ number: [String], _ radix: String) -> Int {
    if radix.first == "0" { return 0 }
    if let result = dict[number] { return result }
    if number.isEmpty { return 1 }
    var remain = number
    var left = ""
    var result = 0
    while !remain.isEmpty {
        left += remain.removeFirst()
        if left.first! == "0", left.count > 1 { continue }
        if isGreaterThanOrEqual(left, radix) { break }
        result += count(remain, radix)
    }
    dict[number] = result
    return result
}

var s = readLine()!.map { String($0) }
var radix = ""
var answer = 0

while true {
    dict.removeAll()
    radix = s.removeLast() + radix
    if s.isEmpty { break }
    if s.first! == "0", s.count > 1 { continue }
    answer += count(s, radix)
}
print(answer)