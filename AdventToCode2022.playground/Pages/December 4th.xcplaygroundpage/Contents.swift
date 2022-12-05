//: [Previous](@previous)

import Foundation




guard let filePath = Bundle.main.path(forResource: "data", ofType: "txt") else {
    fatalError("the file is not there")
}


do {
    let data = try String(contentsOfFile: filePath, encoding: .utf8)
    let lines = data.components(separatedBy: .newlines)
    var overlaps = 0

    for line in lines {
        guard !line.isEmpty else { continue }
        let elements = line.components(separatedBy: .punctuationCharacters).compactMap({Int($0)})
        let first = elements[0]...elements[1]
        let second = elements[2]...elements[3]
        print("first: \(first), second: \(second)")

        for x in first {
            if second.contains(x) {
                overlaps += 1
                break
            }
        }
    }

    print("overlaps = \(overlaps)")

} catch {
    fatalError(error.localizedDescription)
}


//: [Next](@next)
