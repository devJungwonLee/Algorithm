let t = Int(readLine()!)!
for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0]
    let b = input[1]
    let c = input[2]
    var count = 0
    for x in 1...a {
        for y in 1...b {
            for z in 1...c {
                if x % y == y % z, y % z == z % x {
                    count += 1
                }
            }
        }
    }
    print(count)
}