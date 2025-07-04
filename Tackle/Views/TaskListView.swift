import SwiftData
import SwiftUI

struct TaskListView: View {
    
    @Query var tasks: [TaskModel]
    
    var body: some View {
        List {
            ForEach(tasks) { task in
                VStack(alignment: .leading, spacing: 4) {
                    Text(task.title)
                        .font(.headline)
                    if let details = task.details {
                        Text(details)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                }
                .padding(.vertical, 4)
            }
        }
    }
}

#Preview {
    return TaskListView()
        .modelContainer(.preview)
}
