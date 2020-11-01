import SwiftUI

struct ChatView: View {
    @State var typingMessage: String = ""
    @EnvironmentObject var chatHelper: ChatHelper
    @ObservedObject private var keyboard = KeyboardResponder()
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(chatHelper.realTimeMessages, id: \.self) { msg in
                        MessageView(currentMessage: msg)
                    }
                    .listRowBackground(Color(UIColor.systemGroupedBackground))
                }
                HStack {
                    TextField("Message...", text: $typingMessage)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(minHeight: CGFloat(30))
                    Button(action: sendMessage) {
                        Text("Send")
                    }
                }.frame(minHeight: CGFloat(30)).padding()
            }.navigationBarTitle(Text("Chat"), displayMode: .inline)
            .padding(.bottom, keyboard.currentHeight)
            .edgesIgnoringSafeArea(keyboard.currentHeight == 0.0 ? .leading: .bottom)
        }.onTapGesture {
            self.endEditing(true)
        }
    }
    
    func sendMessage() {
        chatHelper.sendMessage(
            Message(
                message: typingMessage,
                isCurrentUser: true
            )
        )
        typingMessage = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
            .environmentObject(ChatHelper())
    }
}
