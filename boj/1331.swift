var index = ["A": 0, "B": 1, "C": 2, "D": 3, "E": 4, "F": 5]
var points = [[String]]()
var v = Set<[Int]>()
func isValid(_ a: [[Int]]) -> Bool {
    var p = a[0]
    v.insert(p)
    for i in 1..<a.count {
        let newp = a[i]
        if v.contains(newp) { return false }
        let b = [abs(p[0]-newp[0]), abs(p[1]-newp[1])].sorted()
        if b != [1, 2] { return false }
        v.insert(newp)
        p = newp
    }
    let newp = a[0]
    let b = [abs(p[0]-newp[0]), abs(p[1]-newp[1])].sorted()
    if b != [1, 2] { return false }
    return true
}

for _ in 0..<36 {
    points.append(readLine()!.map { String($0) })
}

let a = points.map { s in 
    return [index[s[0]]!, Int(s[1])! - 1]
}
isValid(a) ? print("Valid") : print("Invalid")
