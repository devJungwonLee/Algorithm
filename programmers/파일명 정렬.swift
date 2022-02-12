struct File {
    let head: String
    let number: Int
    var index: Int = 0
}

func stringToFile(_ str: String) -> File {
    let arr = str.map { String($0) }
    var head = ""
    var number = ""
    var tail = ""
    var numberIndex = 0
    for i in 0..<arr.count {
        if numberIndex == 0 { 
            head += arr[i].lowercased()
            if Character(arr[i + 1]).isNumber { 
                numberIndex = i + 1
            }
        } else if Character(arr[i]).isNumber, i - numberIndex < 5 {
            number += arr[i] 
        } else { break }
    }
    return File(head: head, number: Int(number)!)
}

func solution(_ files:[String]) -> [String] {
    var dic = [String: File]()
    for (index, str) in files.enumerated() {
        let file = stringToFile(str)
        dic[str] = file
        dic[str]?.index = index
    }
    let answer = files.sorted { (lhs: String, rhs: String) -> Bool in
        if dic[lhs]!.head == dic[rhs]!.head {
            if dic[lhs]!.number == dic[rhs]!.number {
                return dic[lhs]!.index < dic[rhs]!.index
            }
            return dic[lhs]!.number < dic[rhs]!.number
        }
        return dic[lhs]!.head < dic[rhs]!.head
    }
    return answer
}