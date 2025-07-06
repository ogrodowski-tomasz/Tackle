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
    /// Optional priority of the task represented by the `TaskPriority` enum to indicate its importance.
    var priority: TaskPriority
    
    init(
        id: String = UUID().uuidString,
        title: String,
        details: String? = nil,
        isCompleted: Bool = false,
        createdAt: Date = Date(),
        dueDate: Date? = nil,
        goalWeek: Int? = nil,
        synced: Bool = false,
        updatedAt: Date = Date(),
        priority: TaskPriority = .low
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
        self.priority = priority
    }
}

extension TaskModel {
    static let mockTasks: [TaskModel] = [
        TaskModel(title: "Buy groceries", details: "Milk, Eggs, Bread", isCompleted: false, dueDate: .now.addingTimeInterval(3600 * 24), goalWeek: 27, priority: .medium),
        TaskModel(title: "Call Mom", isCompleted: true, dueDate: .now.addingTimeInterval(-3600 * 24), priority: .high),
        TaskModel(title: "Write blog post", details: "About SwiftData + SwiftUI", goalWeek: 28, priority: .high),
        TaskModel(title: "Gym workout", isCompleted: false, priority: .low),
        TaskModel(title: "Team standup", details: "Daily at 10 AM", isCompleted: true, dueDate: .now, priority: .medium),
        TaskModel(title: "Fix bug #412", isCompleted: false, goalWeek: 27, priority: .high),
        TaskModel(title: "Prepare slides for Monday", dueDate: .now.addingTimeInterval(3600 * 48), priority: .high),
        TaskModel(title: "Water the plants", isCompleted: true, priority: .low),
        TaskModel(title: "Organize desk", priority: .medium),
        TaskModel(title: "Read chapter 3 of Swift book", goalWeek: 28, priority: .medium),

        TaskModel(title: "Submit tax report", isCompleted: false, dueDate: .now.addingTimeInterval(3600 * 24 * 3), priority: .high),
        TaskModel(title: "Doctor appointment", dueDate: .now.addingTimeInterval(3600 * 24 * 2), priority: .high),
        TaskModel(title: "Meditation", isCompleted: true, priority: .low),
        TaskModel(title: "Refactor old project", isCompleted: false, priority: .medium),
        TaskModel(title: "Research Firebase syncing", goalWeek: 29, priority: .medium),
        TaskModel(title: "Design onboarding screen", details: "SwiftUI animations", priority: .high),
        TaskModel(title: "Write unit tests", isCompleted: true, priority: .medium),
        TaskModel(title: "Schedule meeting with HR", dueDate: .now.addingTimeInterval(3600 * 72), priority: .low),
        TaskModel(title: "Read design spec", isCompleted: false, priority: .low),
        TaskModel(title: "Publish update on TestFlight", isCompleted: true, synced: true, priority: .high),

        TaskModel(title: "Stretching routine", priority: .low),
        TaskModel(title: "Clean inbox", isCompleted: false, priority: .medium),
        TaskModel(title: "Update LinkedIn profile", isCompleted: false, priority: .low),
        TaskModel(title: "Weekly review", isCompleted: true, goalWeek: 27, priority: .medium),
        TaskModel(title: "Finish reading API docs", priority: .medium),
        TaskModel(title: "Backup MacBook", isCompleted: true, priority: .low),
        TaskModel(title: "Watch WWDC video", isCompleted: false, goalWeek: 29, priority: .low),
        TaskModel(title: "Meal prep for week", isCompleted: false, dueDate: .now.addingTimeInterval(3600 * 48), priority: .medium),
        TaskModel(title: "Debug crash in Firebase sync", priority: .high),
        TaskModel(title: "Sketch icon concepts", isCompleted: true, goalWeek: 28, priority: .low),

        TaskModel(title: "Create Trello roadmap", isCompleted: false, goalWeek: 30, priority: .medium),
        TaskModel(title: "Test release build", isCompleted: false, dueDate: .now.addingTimeInterval(3600 * 5), priority: .high),
        TaskModel(title: "Explore SwiftData edge cases", isCompleted: true, priority: .high),
        TaskModel(title: "Plan weekend trip", details: "Check weather and book train", priority: .low),
        TaskModel(title: "Sync Firestore backup", isCompleted: false, synced: true, priority: .medium),
        TaskModel(title: "Check App Store Connect issues", isCompleted: true, priority: .high),
        TaskModel(title: "Export analytics", priority: .medium),
        TaskModel(title: "Refill printer ink", isCompleted: false, priority: .low),
        TaskModel(title: "Finalize blog layout", isCompleted: true, priority: .medium),
        TaskModel(title: "Send invoice to client", isCompleted: false, dueDate: .now.addingTimeInterval(3600 * 24 * 4), priority: .high)
    ]
}
