var t = 1
while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let o = input[0]
    var w = input[1]
    if o + w == 0 { break }
    while true {
        let input = readLine()!.split(separator: " ")
        if input[0] == "#" { break }
        if w <= 0 { continue }
        if input[0] == "E" {
            w -= Int(input[1])!
        } else {
            w += Int(input[1])!
        }
    }
    if w <= 0 {
        print(t, "RIP")
    } else if Double(w) > Double(o) * 0.5 && w < 2 * o {
        print(t, ":-)")
    } else {
        print(t, ":-(")
    }
    t += 1
}