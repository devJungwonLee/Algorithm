import Foundation

var discounts = [[Int]]()

func recursive(_ discount: [Int], _ m: Int) {
    if discount.count == m {
        discounts.append(discount)
        return
    }
    let percentages = [10, 20, 30, 40]
    for p in percentages {
        recursive(discount + [p], m)
    }
}

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    recursive([], emoticons.count)
    var answer = [0, 0]
    for discount in discounts {
        var subscribers = 0
        var salesAmount = 0
        for user in users {
            let percentage = user[0]
            let maximum = user[1]
            var total = 0
            for i in 0..<emoticons.count {
                if percentage > discount[i] { continue }
                let price = emoticons[i] - emoticons[i] / 100 * discount[i]
                total += price
            }
            if total >= maximum {
                subscribers += 1 
            } else {
                salesAmount += total 
            }
        }
        if subscribers > answer[0] || (subscribers == answer[0] && salesAmount > answer[1]) {
            answer[0] = subscribers
            answer[1] = salesAmount
        }
    }
    return answer
}