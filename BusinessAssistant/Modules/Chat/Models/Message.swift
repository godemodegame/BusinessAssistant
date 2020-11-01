struct Message: Hashable, Decodable {
    let message: String
    var isCurrentUser: Bool = false
}

enum DataSource {
    static let firstUser = User(name: "Maria Shadapova", avatar: "lady")
    static var secondUser = User(name: "Duy Bui", avatar: "myAvatar", isCurrentUser: true)
    static let messages = [
        Message(message: "Hi, I really love your templates and I would like to buy the chat template"),
        Message(message: "Thanks, nice to hear that, can I have your email please?", isCurrentUser: true),
        Message(message: "😇"),
        Message(message: "Oh actually, I have just purchased the chat template, so please check your email, you might see my order"),
        Message(message: "Great, wait me a sec, let me check", isCurrentUser: true),
        Message(message: "Sure")
    ]
}
