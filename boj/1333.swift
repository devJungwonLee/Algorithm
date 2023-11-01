let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, l, d) = (input[0], input[1], input[2])
var music = Set<Int>()
var start = 0
for _ in 0..<n {
    music.insert(start)
    start += l + 5
}
var answer = 0
while true {
    var success = true
    for start in music {
        if start..<(start + l) ~= answer {
            success = false
            break
        }
    }
    if success { break }
    answer += d
}
print(answer)