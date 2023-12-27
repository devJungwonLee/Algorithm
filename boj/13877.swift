func f(_ x: Int, _ base: Int) -> Int {
    var sum = 0
    var num = x
    var a = 1
    while num > 0 {
        let r = num % 10
        num /= 10
        if base == 8 && r >= 8 { return 0 }
        sum += a * r
        a *= base
    }
    return sum
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let k = input[0]
    let num = input[1]
    print(k, f(num, 8), num, f(num, 16))
}