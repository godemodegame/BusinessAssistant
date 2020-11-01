import Combine
import Foundation

final class ChatHelper: ObservableObject {
    let networkService: NetworkService = NetworkServiceImpl()
    var didChange = PassthroughSubject<Void, Never>()
    @Published var realTimeMessages: [Message] = []

    func sendMessage(_ chatMessage: Message) {
        realTimeMessages.append(chatMessage)
        didChange.send(())
        networkService.request(AssistantApi.sendMessage(message: chatMessage.message)) { result in
            switch result {
            case .success(let data):
                do {
                    let messageData = try JSONDecoder().decode(MessageResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.realTimeMessages.append(Message(message: messageData.message))
                        self.didChange.send(())
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct MessageResponse: Decodable {
    let message: String
}
