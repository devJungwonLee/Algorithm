import Foundation

func findAncestor(_ a: Int, _ b: Int) -> Int {
    if a == b { return a }
    else if a > b { return findAncestor(a/2, b) }
    else { return findAncestor(a, b/2) }
}

let T = Int(readLine()!)!
for _ in 0..<T {
    let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let a = s[0]
    let b = s[1]
    print(10 * findAncestor(a, b))
}