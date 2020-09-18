import UIKit

let linkHeader:String = "<https://api.github.com/search/repositories?q=created%3A%3E2017-05-17&sort=stars&order=desc&page=2>; rel=\"next\", <https://api.github.com/search/repositories?q=created%3A%3E2017-05-17&sort=stars&order=desc&page=34>; rel=\"last\""

let links = linkHeader.components(separatedBy: ",")

var dictionary: [String: String] = [:]
links.forEach({
    let components = $0.components(separatedBy:"; ")
    let cleanPath = components[0].trimmingCharacters(in: CharacterSet(charactersIn: "<>"))
    dictionary[components[1]] = cleanPath
})

if let nextPagePath = dictionary["rel=\"next\""] {
    print("nextPagePath: \(nextPagePath)")
}

//Bonus
if let lastPagePath = dictionary["rel=\"last\""] {
    print("lastPagePath: \(lastPagePath)")
}
if let firstPagePath = dictionary["rel=\"first\""] {
    print("firstPagePath: \(firstPagePath)")
}
