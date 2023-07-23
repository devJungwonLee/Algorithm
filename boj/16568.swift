let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let a = input[1]
let b = input[2]
var d = [Int: Int]()
func f(_ x: Int) -> Int {
    if x == 0 { return 0 }
    if let result = d[x] { return result }
    var result = 10000000
    if x >= a + 1 { result = min(result, 1 + f(x-a-1)) }
    if x >= b + 1 { result = min(result, 1 + f(x-b-1)) }
    result = min(result, 1 + f(x-1))
    d[x] = result
    return result
}
print(f(n))