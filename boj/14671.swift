let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
let k = input[2]
var s = Set<[Int]>()
for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    s.insert([input[0] % 2, input[1] % 2 ])
}
if s.count == 4 { print("YES") }
else { print("NO") }