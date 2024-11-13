let n = Int(readLine()!)!
var input: [[Int64]] = []

for _ in 0..<n {
    input.append(readLine()!.split(separator: " ").map { Int64($0)! })
}

input.sort { $0[0] < $1[0] }
let x = input.map { $0[0] }
let h = input.map { $0[1] }

var left = Array(0..<n)
var right = Array(0..<n)
for i in 0..<n {
    var l = x[i] - h[i]
    var j = i - 1
    while j >= 0, x[j] >= l { 
        l = min(l, x[j] - h[j])
        left[i] = j
        j -= 1
    }

    var r = x[i] + h[i]
    j = i + 1
    while j < n, x[j] <= r {
        r = max(r, x[j] + h[j])
        right[i] = j
        j += 1
    }
}

var d = [Int](repeating: n, count: n)
for i in 0..<n {
    let l = left[i] > 0 ? d[left[i] - 1] : 0
    d[i] = min(d[i], l + 1)
    for j in 0..<i {
        if right[j] >= i {
            let l = j > 0 ? d[j - 1] : 0
            d[i] = min(d[i], l + 1)
        }
    }
}

print(d[n-1])
