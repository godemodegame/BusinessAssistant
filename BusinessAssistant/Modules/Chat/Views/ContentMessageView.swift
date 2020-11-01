import SwiftUI

struct ContentMessageView: View {
    let contentMessage: String
    let isCurrentMessage: Bool

    var body: some View {
        Text(contentMessage)
            .padding(10)
            .foregroundColor(isCurrentMessage ? Color.white : .black)
            .background(isCurrentMessage ? Color.blue : .green)
            .cornerRadius(10)
    }
}

struct ContentMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ContentMessageView(contentMessage: "Hello, world", isCurrentMessage: false)
    }
}
