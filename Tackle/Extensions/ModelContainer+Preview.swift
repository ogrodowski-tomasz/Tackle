import SwiftData


extension ModelContainer {
    
    @MainActor
    static var preview: ModelContainer {
        do {
            let schema = Schema([TaskModel.self])
            let config = ModelConfiguration("PreviewContainer", schema: schema, isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: schema, configurations: [config])
            
            TaskModel.mockTasks.forEach {
                container.mainContext.insert($0)
            }
            return container
        } catch {
            fatalError("⚠️ Failed to create preview container: \(error)")
        }
    }
}
