while let input = readLine()?.split(separator: " ").map({ Int($0)! }) {
    let (m, p, l, e, r, s, n) = (input[0], input[1], input[2], input[3], input[4], input[5], input[6])
    var a = l
    var b = p
    var c = m
    for _ in 1...n {
        let newa = c * e
        let newb = a / r
        let newc = b / s
        a = newa
        b = newb
        c = newc
    }
    print(c)
}