import Foundation

func makeArray(of num: Int) -> [Int] {
    var result = [Int]()
    var num = num
    while true {
        result.append(num)
        if num == 1 { break }
        else if num % 2 == 0 { num /= 2 }
        else { num = num * 3 + 1 }
    }
    return result
}

while true {
    let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let a = s[0]
    let b = s[1]
    if a == 0 && b == 0 { break }
    var arrayA = makeArray(of: a)
    var arrayB = makeArray(of: b)
    let cntA = arrayA.count
    let cntB = arrayB.count
    var c = 0
    var cnt = 0
    while !arrayA.isEmpty && !arrayB.isEmpty {
        let lastA = arrayA.last!
        let lastB = arrayB.last!
        if lastA == lastB {
            c = lastA
            cnt += 1
            arrayA.removeLast()
            arrayB.removeLast()
        } else {
            break
        }
    }
    print("\(a) needs \(cntA - cnt) steps, \(b) needs \(cntB - cnt) steps, they meet at \(c)")
}