let input = readLine()!.split(separator: " ").map { Int($0)! }
var w = [0, input[0]]
var h = [0, input[1]]
let k = Int(readLine()!)!
for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if input[0] == 0 { h.append(input[1]) }
    else { w.append(input[1]) }
}
w.sort()
h.sort()
let maxWidth = (1..<w.count).map { w[$0] - w[$0-1] }.max()!
let maxHeight = (1..<h.count).map { h[$0] - h[$0-1] }.max()!
print(maxWidth * maxHeight)