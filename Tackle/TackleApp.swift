import SwiftData
import SwiftUI

@main
struct TackleApp: App {
    
    @State private var navigationManager: NavigationManager = .init()
    
    var sharedModelContainer: ModelContainer = {
        do {
            let schema = Schema([TaskModel.self])
            let config = ModelConfiguration("TaskDatabase", schema: schema)
            let container = try ModelContainer(for: schema, configurations: [config])
//            TaskModel.mockTasks.forEach {
//                container.mainContext.insert($0)
//            }
            return container
        } catch {
            fatalError("Failed to initialize SwiftData container: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
        .modelContainer(sharedModelContainer)
        .environment(navigationManager)
    }
}
