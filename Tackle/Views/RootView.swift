import SwiftUI

struct RootView: View {
    
    @Environment(NavigationManager.self) private var navigation
    
    var body: some View {
        @Bindable var navigation = navigation
        TabView(selection: $navigation.selectedtab) {
            ForEach(TabType.allCases) { tab in
                tab.destination
                    .tag(tab)
                    .tabItem {
                        Label(tab.title, systemImage: tab.imageName)
                    }
            }
        }
    }
}

#Preview {
    RootView()
        .environment(NavigationManager())
}
