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
    static var previewTasks: [TaskModel] {
        [
            TaskModel(
                title: "Submit job application",
                details: "Update resume, write cover letter and apply to Apple.",
                isCompleted: false,
                createdAt: Date().addingTimeInterval(-86400),
                dueDate: Date().addingTimeInterval(3600 * 24),
                goalWeek: 27,
                synced: true,
                updatedAt: Date(),
                priority: .high
            ),
            TaskModel(
                title: "Grocery shopping",
                details: "Milk, eggs, bread, veggies",
                isCompleted: true,
                createdAt: Date().addingTimeInterval(-3600 * 48),
                dueDate: nil,
                goalWeek: nil,
                synced: true,
                updatedAt: Date().addingTimeInterval(-3600),
                priority: .high
            ),
            TaskModel(
                title: "Design portfolio app",
                details: "Implement SwiftUI navigation and Firebase integration",
                isCompleted: false,
                createdAt: Date().addingTimeInterval(-3600 * 72),
                dueDate: Date().addingTimeInterval(3600 * 72),
                goalWeek: 28,
                synced: false,
                updatedAt: Date().addingTimeInterval(-3600 * 2),
                priority: .low
            ),
            TaskModel(
                title: "Morning workout",
                details: nil,
                isCompleted: false,
                createdAt: Date(),
                dueDate: Date().addingTimeInterval(3600 * 3),
                goalWeek: 27,
                synced: false,
                updatedAt: Date(),
                priority: .medium
            ),
            TaskModel(
                title: "Weekly planning",
                details: "Define top 3 goals for the week.",
                isCompleted: false,
                createdAt: Date().addingTimeInterval(-3600 * 24),
                dueDate: Date().addingTimeInterval(3600 * 48),
                goalWeek: 27,
                synced: true,
                updatedAt: Date(),
                priority: .medium
            ),
            TaskModel(
                title: "Refactor code",
                details: "Clean up ViewModels and remove old Combine logic",
                isCompleted: true,
                createdAt: Date().addingTimeInterval(-3600 * 120),
                dueDate: Date().addingTimeInterval(-3600 * 10),
                goalWeek: 26,
                synced: false,
                updatedAt: Date().addingTimeInterval(-3600 * 4),
                priority: .low
            ),
            TaskModel(
                title: "Book flight tickets",
                details: "Trip to Berlin. Check AirBnB and hotel options.",
                isCompleted: false,
                createdAt: Date().addingTimeInterval(-3600 * 10),
                dueDate: Date().addingTimeInterval(3600 * 100),
                goalWeek: nil,
                synced: true,
                updatedAt: Date(),
                priority: .high
            ),
            TaskModel(
                title: "Read SwiftData documentation",
                details: "Understand migrations and constraints",
                isCompleted: false,
                createdAt: Date(),
                dueDate: nil,
                goalWeek: 28,
                synced: false,
                updatedAt: Date(),
                priority: .medium
            ),
            TaskModel(
                title: "Pay bills",
                details: "Electricity, internet and rent",
                isCompleted: true,
                createdAt: Date().addingTimeInterval(-3600 * 72),
                dueDate: Date().addingTimeInterval(-3600 * 5),
                goalWeek: 27,
                synced: true,
                updatedAt: Date(),
                priority: .low
            ),
            TaskModel(
                title: "Team meeting",
                details: "Discuss progress on project milestones",
                isCompleted: false,
                createdAt: Date(),
                dueDate: Date().addingTimeInterval(3600 * 24 * 2),
                goalWeek: 28,
                synced: false,
                updatedAt: Date(),
                priority: .medium
            )
        ]
    }
}

