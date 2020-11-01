import SwiftUI

struct MessageView: View {
    let currentMessage: Message

    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
            if currentMessage.isCurrentUser {
                Spacer()
            }
            ContentMessageView(
                contentMessage: currentMessage.message,
                isCurrentMessage: currentMessage.isCurrentUser
            )
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(
            currentMessage: Message(
                message: "There are a lot of premium iOS templates on iosapptemplates.com",
                isCurrentUser: false
            )
        )
    }
}
