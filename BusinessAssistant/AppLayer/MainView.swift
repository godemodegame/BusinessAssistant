import SwiftUI

struct MainView: View {
    let chatHelper = ChatHelper()
    
    var body: some View {
        TabView {
            SearchView()
                .edgesIgnoringSafeArea(.all)
                .tabItem {
                    Image(systemName: "doc.plaintext")
                    Text("Search")
                }
            
            ChatView()
                .environmentObject(chatHelper)
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Chat")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ChatHelper())
    }
}
