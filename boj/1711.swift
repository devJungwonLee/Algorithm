var points = [[Int]]()
var answer = 0

func check(_ a: [Int], _ b: [Int], _ c: [Int]) -> Bool {
    let v1 = [a[0]-b[0], a[1]-b[1]]
    let v2 = [b[0]-c[0], b[1]-c[1]]
    let v3 = [c[0]-a[0], c[1]-a[1]]
    if v1[0] * v2[0] + v1[1] * v2[1] == 0 { return true }
    if v2[0] * v3[0] + v2[1] * v3[1] == 0 { return true }
    if v3[0] * v1[0] + v3[1] * v1[1] == 0 { return true }
    return false
}

let n = Int(readLine()!)!
for _ in 0..<n {
    let point = readLine()!.split(separator: " ").map { Int($0)! }
    points.append(point)
}
var i = 0
while i < n {
    var j = i + 1
    while j < n {
        var k = j + 1
        while k < n {
            if check(points[i], points[j], points[k]) { answer += 1 }
            k += 1
        }
        j += 1
    }
    i += 1
}
print(answer)
