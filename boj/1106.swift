let s = readLine()!.split(separator: " ").map { Int($0)! }
let c = s[0]
let n = s[1]
var cities = [[Int]]()
var d = [Int](repeating: 0, count: c+1)
for _ in 0..<n {
    let s = readLine()!.split(separator: " ").map { Int($0)! }
    cities.append(s)
}
func find(_ c: Int) -> Int {
    if d[c] > 0 { return d[c] }
    var minValue = Int.max
    for i in cities.indices {
        if cities[i][1] >= c {
            minValue = min(minValue, cities[i][0])
        } else {
            minValue = min(minValue, cities[i][0] + find(c-cities[i][1]))
        }
    }
    d[c] = minValue
    return d[c]
}
print(find(c))
