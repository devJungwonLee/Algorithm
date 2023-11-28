while let s = readLine() {
    let result = s.map {
        let a = String($0)
        switch a {
        case "e": return "i"
        case "i": return "e"
        case "I": return "E"
        case "E": return "I"
        default: return a
        }
    }.joined()
    print(result)
}