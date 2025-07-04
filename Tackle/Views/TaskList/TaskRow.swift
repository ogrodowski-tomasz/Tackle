import SwiftUI

struct TaskRow: View {
    
    let task: TaskModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(task.title)
                    .font(.headline)
                    .foregroundStyle(task.isCompleted ? .gray : .primary)
                    .strikethrough(task.isCompleted)
                Spacer()
                
                Text(task.priority.label)
                    .font(.caption)
                    .padding(.horizontal, 6)
                    .padding(.vertical, 2)
                    .background(task.priority.color)
                    .clipShape(.capsule)
            } // HStack
            if let details = task.details, !details.isEmpty {
                Text(details)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
            HStack(spacing: 12) {
                if let due = task.dueDate {
                    Label {
                        Text("Due: \(due.formatted(date: .abbreviated, time: .shortened))")
                    } icon: {
                        Image(systemName: "calendar")
                    }
                    .font(.caption)
                    .foregroundStyle(.blue)
                }
                
                if let goalWeek = task.goalWeek {
                    Label("Week \(goalWeek)", systemImage: "target")
                        .font(.caption)
                        .foregroundStyle(.purple)
                }
                if task.synced {
                    Image(systemName: "checkmark.icloud")
                        .foregroundStyle(.green)
                        .font(.caption)
                }
            } // HStack
        }
        .padding(.vertical, 6)
        .opacity(task.isCompleted ? 0.5 : 1.0)
        .contentShape(.rect)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TaskRow(task: TaskModel.previewTasks.first!)
}
