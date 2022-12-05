//: [Previous](@previous)

import Foundation
extension String {
    var priority: Int {
        guard let theFirst = first else { return -1 }
        let char = String(theFirst)
        guard Character(char).isASCII else { return -2 }
        guard let ascii = Character(char).asciiValue else { return -3 }

        return Int(ascii) - (Character(char).isUppercase ? 38 : 96)
    }
}



guard let dataUrl = Bundle.main.path(forResource: "data", ofType: "txt") else {
    fatalError("File not found")
}

do {
    let dataString = try String(contentsOfFile: dataUrl, encoding: .utf8)
    var rucksacks = dataString.components(separatedBy: .newlines)

    var totalPriority = 0
    for rucksack in rucksacks {
        var size = rucksack.count
        guard size > 0 else { continue }

        let itemsInCompartments = size/2
        let compartmentIndex = rucksack.index(rucksack.startIndex, offsetBy:itemsInCompartments)

        let firstCompartment = rucksack[..<compartmentIndex]
        let secondCompartment = rucksack[compartmentIndex...]
        for element in firstCompartment {
            let char = String(element)
            if secondCompartment.contains(char) {
                totalPriority += char.priority
                break
            }
        }
    }
    print("The Total priority = \(totalPriority)")
    var groupPriority = 0

    for index in stride(from: 0, to: rucksacks.count - 1, by: 3) {
        let rucksack1 = rucksacks[index]
        let rucksack2 = rucksacks[index + 1]
        let rucksack3 = rucksacks[index + 2]
        var candidates: String = ""

        for element in rucksack1 {
            let char = String(element)
            if rucksack2.contains(char) {
                candidates.append(char)
            }
        }
        print("candidates: \(candidates)")

        for element in candidates {
            let char = String(element)
            if rucksack3.contains(char) {
                print("we have a winner: \(char)")
                groupPriority += char.priority
                break
            }
        }
    }
    print("total groupPriority \(groupPriority)")

} catch {
    print("Get a grip")
}




//: [Next](@next)
