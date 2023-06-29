let mod = 1234567
let near = [[7], [2, 4], [1, 3, 5], [2, 6], [1, 5, 7], [2, 4, 6, 8], [3, 5, 9], [4, 8, 0], [5, 7, 9], [6, 8]]
let t = Int(readLine()!)!
var nums = [Int]()
for _ in 0..<t {
    nums.append(Int(readLine()!)!)
}
let maxValue = nums.max()!
var d = [[Int]](repeating: [Int](repeating: 0, count: 10), count: maxValue + 1)
for i in 1...maxValue {
    for j in 0...9 {
        if i == 1 { d[i][j] = 1 }
        else {
            for k in near[j] {
                d[i][j] = (d[i][j] + d[i-1][k]) % mod
            }
        }
    }
}
nums.forEach { num in
    var sum = (0...9).map { d[num][$0] }.reduce(0, +)
    sum = sum % mod
    print(sum)
}