import Foundation

let input = readLine()!.components(separatedBy: " ")
let digits = input[0].map { Int(String($0))! }
let k = Int(input[1])!
var c = Set<Int>()
var primes = [Int]()
var r = 0
for i in 2..<k {
    if c.contains(i) { continue }
    primes.append(i)
    var j = 2 * i
    while j < k {
        c.insert(j)
        j += i
    }
}

func isDivisor(_ num: Int) -> Bool {
    var i = 0
    var a = 0
    while i < digits.count {
        while a < num, i < digits.count {
            a = a * 10 + digits[i]
            i += 1
        }
        a = a % num
    }
    return a == 0
}

for p in primes {
    if isDivisor(p) { 
        r = p
        break
    }
}
if r == 0 {
    print("GOOD")
} else {
    print("BAD", r)
}