import Foundation

func fbp(_ word: String, _ page: String) -> Int {
    var tmp = ""
    var cnt = 0
    let page = Array(page)
    let word = word.lowercased()
    for (i, c) in page.enumerated() {
        if c.isLetter, page[i-1] != "\\" { tmp += String(c) }
        else {
            if tmp.lowercased() == word { cnt += 1 }
            tmp = ""
        }
    }
    if tmp.lowercased() == word { cnt += 1 }
    return cnt
}

func fn(_ page: String) -> String {
    return page.components(separatedBy: "<meta property=\"og:url\" content=\"https://")[1].components(separatedBy: "\"")[0]
}

func fl(_ page: String) -> [String] {
    var s = page.components(separatedBy: "<a href=\"https://")
    s.removeFirst()
    return s.map { $0.components(separatedBy: "\"")[0] }
}

func solution(_ word:String, _ pages:[String]) -> Int {
    let basePoints = pages.map { fbp(word, $0) }
    var indices = [String: Int]()
    var names = [String]()
    var linkCounts = [Int]()
    var matchingPoints = [Double]()
    for (i, page) in pages.enumerated() {
        let name = fn(page)
        names.append(name)
        indices[name] = i
    }
    var sources = [String: [String]]()
    for (i, page) in pages.enumerated() {
        let links = fl(page)
        let name = names[i]
        linkCounts.append(links.count)
        for link in links {
            if sources[link] == nil { sources[link] = [name] }
            else { sources[link]?.append(name) } 
        }
    }
    for i in 0..<pages.count {
        let name = names[i]
        let basePoint = basePoints[i]
        var linkPoint: Double = 0.0
        if let links = sources[name] {
            for link in links {
                let idx = indices[link]!
                linkPoint += Double(basePoints[idx]) / Double(linkCounts[idx])
            }
        }
        matchingPoints.append(Double(basePoint) + linkPoint)
    }
    var answer = 0
    for i in 0..<matchingPoints.count {
        if matchingPoints[i] > matchingPoints[answer] { answer = i }
    }
    return answer
}