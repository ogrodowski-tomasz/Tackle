import SwiftUI

struct TaskListRootView: View {
    @Environment(NavigationManager.self) private var navigationManager
    var body: some View {
        @Bindable var navigationManager = navigationManager
        NavigationStack(path: $navigationManager.taskPath) {
            TaskListView()
                .navigationTitle(navigationManager.navigationTitle)
        }
    }
}

#Preview {
    TaskListRootView()
        .environment(NavigationManager())
}
