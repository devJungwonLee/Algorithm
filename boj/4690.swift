func calculate(_ b: Int, _ c: Int, _ d: Int) -> Int {
    return b * b * b + c * c * c + d * d * d
}

for a in 2...100 {
    for b in 2...100 {
        if calculate(b, 2, 2) > a * a * a { break }
        for c in b...100 {
            if calculate(b, c, 2) > a * a * a { break }
            for d in c...100 {
                let result = calculate(b, c, d)
                if result > a * a * a { break }
                if result == a * a * a {
                    print("Cube = \(a), Triple = (\(b),\(c),\(d))")
                }
            }
        }
    }
}