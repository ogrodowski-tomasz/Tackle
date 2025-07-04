import SwiftData
import SwiftUI

@main
struct TackleApp: App {
    
    @State private var navigationManager: NavigationManager = .init()
    
    var sharedModelContainer: ModelContainer = {
        do {
            let schema = Schema([TaskModel.self])
            let config = ModelConfiguration("TaskDatabase", schema: schema)
            return try ModelContainer(for: schema, configurations: [config])
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
