import SwiftUI

struct StatisticsRootView: View {
    @Environment(NavigationManager.self) private var navigationManager
    var body: some View {
        @Bindable var navigationManager = navigationManager
        NavigationStack(path: $navigationManager.statisticsPath) {
            StatisticsView()
                .navigationTitle(navigationManager.navigationTitle)
        }
    }
}

#Preview {
    StatisticsRootView()
        .environment(NavigationManager())
}
