func factorize(_ n: Int) -> [Int: Int] {
    var result = [Int: Int]()
    var n = n
    let primeNumbers = [2, 3, 5, 7]
    for number in primeNumbers {
        var cnt = 0
        while n % number == 0 {
            n /= number
            cnt += 1
        }
        result[number] = cnt
    }
    if n != 1 { return [Int: Int]() }
    else { return result } 
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    if n == 1 {
        print("1")
        continue
    }
    var result = factorize(n)
    if result.isEmpty {
        print("-1")
        continue
    }
    if let x = result[3] {
        result[3] = x % 2
        result[9] = x / 2
    }
    if let x = result[2] {
        result[2] = x % 3
        result[8] = x / 3
    }
    if let x = result[2], let y = result[3] {
        let z = min(x, y)
        result[6] = z
        result[2] = x - z
        result[3] = y - z
    }
    if let x = result[2] {
        result[2] = x % 2
        result[4] = x / 2
    }
    print(result.values.reduce(0, +))
}
