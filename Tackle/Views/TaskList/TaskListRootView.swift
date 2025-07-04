import SwiftUI

struct TaskListRootView: View {
    @Environment(NavigationManager.self) private var navigationManager
    var body: some View {
        @Bindable var navigationManager = navigationManager
        NavigationStack(path: $navigationManager.taskPath) {
            TaskListView()
                .tackleNavigationDestination()
        }
    }
}

#Preview {
    TaskListRootView()
        .environment(NavigationManager())
}
