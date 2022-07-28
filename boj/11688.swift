import Foundation

var isPrime = [Bool](repeating: true, count: 1000001)
for i in (2...1000000) {
    if isPrime[i] {
        var j = 2 * i
        while j <= 1000000 {
            isPrime[j] = false
            j += i
        }
    }
}
let primes = (2...1000000).filter { isPrime[$0] }

func split(_ num: Int) -> [Int: Int] {
    var num = num
    var result = [Int: Int]()
    for base in primes {
        var exponent = 0
        while num % base == 0 {
            exponent += 1
            num /= base
        }
        if exponent > 0 { result[base] = exponent }
        if num == 1 { break }
    }
    return result
}

func findC(_ a: Int, _ b: Int, _ L: Int) -> Int {
    if L % a != 0 || L % b != 0 { return -1 }
    var result = 1
    let sa = split(a)
    let sb = split(b)
    let sL = split(L)
    for (base, exponent) in sL {
        let maxValue = max(sa[base] ?? 0, sb[base] ?? 0)
        if exponent > maxValue {
            for _ in 1...exponent { result *= base }
        }
    }
    return result
}

let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
let a = s[0]
let b = s[1]
let L = s[2]
print(findC(a, b, L))