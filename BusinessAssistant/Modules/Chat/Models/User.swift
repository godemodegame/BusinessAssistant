struct User: Hashable {
    let name: String
    let avatar: String
    var isCurrentUser: Bool = false
}
