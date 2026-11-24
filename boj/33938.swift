import Foundation

let s = readLine()!.split(separator: " ").map { Int($0)! }
let n = s[0]
let m = s[1]
var p = [Int]()
if n > 0 { p = readLine()!.split(separator: " ").map { Int($0)! } }
var v = [Int: Int]()
var queue = [Int]()
var head = -1
var ans = -1

if m == 0 { ans = 0 }
else {
    p.forEach {
        v[$0] = 1
        queue.append($0)
    }

    while true {
        head += 1
        if head == queue.count { break }
        let x = queue[head]
        let c = v[x]!

        if x == m {
            ans = c
            break
        }

        p.forEach {
            let y = x + $0
            guard -1000...1000 ~= y else { return }
            if v[y] == nil {
                v[y] = c + 1
                queue.append(y)
            }
        }
    }
}

print(ans)