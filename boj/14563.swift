func sum(_ n: Int) -> Int {
    var result = 0
    var i = 2
    while i * i <= n {
        if n % i != 0 {
            i += 1
            continue
        }
        result += i
        if i * i != n { result += n / i }
        i += 1
    }
    if n != 1 { result += 1 }
    return result
}

let t = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }
let output = input.map { (num: Int) -> String in
    let result = sum(num)
    if result < num { return "Deficient" }
    else if result == num { return "Perfect" }
    else { return "Abundant" }
}
output.forEach { print($0) }