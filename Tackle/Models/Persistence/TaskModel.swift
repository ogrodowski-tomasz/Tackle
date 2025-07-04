import Foundation
import SwiftData

@Model
class TaskModel {
    /// Identfier. UUID().uuidString as default
    @Attribute(.unique) var id: String
    /// The task's main title or name. A short description of what needs to be done.
    var title: String
    /// Optional extended description, for example task instructions or notes.
    var details: String?
    /// Indicates whether the task has been marked as completed by the user.
    var isCompleted: Bool
    /// The timestamp of when the task was created. Useful for sorting and analytics.
    var createdAt: Date
    /// Optional deadline for the task. Allows scheduling and reminders.
    var dueDate: Date?
    /// Optional ISO week number (1–52) to associate the task with a weekly goal.
    var goalWeek: Int?
    /// Whether the task has been synchronized with Firestore. Helps in offline-first strategies.
    var synced: Bool
    /// The last time the task was modified. Useful for resolving sync conflicts or history.
    var updatedAt: Date
    
    init(
        id: String = UUID().uuidString,
        title: String,
        details: String? = nil,
        isCompleted: Bool = false,
        createdAt: Date = Date(),
        dueDate: Date? = nil,
        goalWeek: Int? = nil,
        synced: Bool = false,
        updatedAt: Date = Date()
    ) {
        self.id = id
        self.title = title
        self.details = details
        self.isCompleted = isCompleted
        self.createdAt = createdAt
        self.dueDate = dueDate
        self.goalWeek = goalWeek
        self.synced = synced
        self.updatedAt = updatedAt
    }
}

extension TaskModel {
    static var examples: [TaskModel] {[
        TaskModel(title: "Write unit tests", details: "Cover TaskService with unit tests written with usage of SwiftTesting framework"),
        TaskModel(title: "Design weekly goals UI", details: "Mockups in Figma", isCompleted: true),
        TaskModel(title: "Fix Firebase sync bug", isCompleted: false, dueDate: Date().addingTimeInterval(86400))
    ]}
}
