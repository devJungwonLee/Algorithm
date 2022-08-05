import Foundation

class Queue<T> {
    private var q = [T]()
    private var head = 0

    var isEmpty: Bool {
        return head == q.count
    }

    var front: T? {
        if isEmpty { return nil }
        else { return q[head] }
    }

    func push(_ data: T) {
        q.append(data)
    }

    func pop() {
        if isEmpty { return }
        head += 1
    }
}

let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = s[0]
let k = s[1]
var v = [Int](repeating: -1, count: 100001)
let q = Queue<Int>()
v[k] = 0
q.push(k)
while !q.isEmpty {
    let num = q.front!
    if num == n {
        print(v[num])
        break
    }
    q.pop()
    if num - 1 >= 0, v[num-1] == -1 {
        v[num-1] = v[num] + 1
        q.push(num-1)
    }
    if num + 1 <= 100000, v[num+1] == -1 {
        v[num+1] = v[num] + 1
        q.push(num+1)
    }
    if num % 2 == 0, v[num/2] == -1 {
        v[num/2] = v[num] + 1
        q.push(num/2)
    }
}
var num = n
while true {
    print(num, terminator: " ")
    if num == k { break }
    if num - 1 >= 0 , v[num-1] == v[num] - 1 {
        num -= 1
        continue
    }
    if num + 1 <= 100000, v[num+1] == v[num] - 1 {
        num += 1
        continue
    }
    if 2 * num <= 100000, v[2*num] == v[num] - 1 {
        num *= 2
        continue
    }
}
print("")