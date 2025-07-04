import SwiftData
import SwiftUI

struct TaskListView: View {
    @Environment(NavigationManager.self) var navigationManager
    @Query var tasks: [TaskModel]
    
    #warning("TODO: Requires testing")
    var sortedTasks: [TaskModel] {
        tasks.sorted {
            if $0.isCompleted != $1.isCompleted {
                return !$0.isCompleted && $1.isCompleted
            }
            let date0 = $0.dueDate ?? Date.distantFuture
            let date1 = $1.dueDate ?? Date.distantFuture
            if date0 != date1 {
                return date0 < date1
            }
            let priority0 = $0.priority.rawValue
            let priority1 = $1.priority.rawValue
            return priority0 < priority1
        }
    }
    
    var body: some View {
        List {
            ForEach(sortedTasks) { task in
                TaskRow(task: task)
                    .onTapGesture {
                        navigationManager.navigate(to: .taskForm(task: task), in: .tasks)
                    }
            }
        }
        .navigationTitle("Tasks")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    navigationManager.navigate(to: .taskForm(task: nil), in: .tasks)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
     RootView()
        .environment(NavigationManager())
        .modelContainer(.preview)
}
