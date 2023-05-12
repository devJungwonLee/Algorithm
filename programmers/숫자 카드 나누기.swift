import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    var x = max(a, b)
    var y = min(a, b)
    while true {
        let r = x % y
        if r == 0 { break }
        x = y
        y = r
    }
    return y
}

func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    let gcdA = arrayA.reduce(arrayA[0]) { gcd($0, $1) }
    let gcdB = arrayB.reduce(arrayB[0]) { gcd($0, $1) }
    let flagA = !arrayA.filter { $0 % gcdB == 0 }.isEmpty
    let flagB = !arrayB.filter { $0 % gcdA == 0 }.isEmpty
    if flagA && flagB { return 0 }
    else if flagA { return gcdA }
    else if flagB { return gcdB }
    else { return max(gcdA, gcdB) }
}