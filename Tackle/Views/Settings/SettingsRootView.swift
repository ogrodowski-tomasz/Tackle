import SwiftUI

struct SettingsRootView: View {
    @Environment(NavigationManager.self) private var navigationManager
    var body: some View {
        @Bindable var navigationManager = navigationManager
        NavigationStack(path: $navigationManager.settingsPath) {
            SettingsView()
        }
    }
}

#Preview {
    SettingsRootView()
        .environment(NavigationManager())
}
