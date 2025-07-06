import Foundation

@Observable
final class StatisticsStore {
    private var tasks: [TaskModel]
    
    init(tasks: [TaskModel]) {
        self.tasks = tasks
    }
    
    var completedCount: Int {
        tasks.filter(\.isCompleted).count
    }
    
    var activeCount: Int {
        tasks.filter { !$0.isCompleted }.count
    }
    
    var thisWeekCompleted: Int {
        let calendar = Calendar.current
        let now = Date()
        let week = calendar.component(.weekOfYear, from: now)
        return tasks.filter {
            $0.isCompleted && $0.goalWeek == week
        }.count
    }
    
    var weeklyCompletions: [Int] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: .init())
        var result = Array(repeating: 0, count: 7)
        for task in tasks {
            guard let completedDate = task.updatedAt as Date?, task.isCompleted else { continue }
            let dayDiff = calendar.dateComponents([.day], from: completedDate, to: today).day ?? 0
            let index = 6 - dayDiff
            if index >= 0 && index < 7 {
                result[index] += 1
            }
        }
        return result
    }
    
    var priorityDistribution: [(TaskPriority, Int)] {
        let grouped = Dictionary(grouping: tasks, by: { $0.priority.rawValue })
        return TaskPriority.allCases.map { priority in
            (priority, grouped[priority.rawValue]?.count ?? 0)
        }
    }
    
    var goalWeekStats: [Int:Int] {
        let grouped = Dictionary(grouping: tasks, by: { $0.goalWeek ?? -1 })
        return grouped
            .filter { $0.key != -1 }
            .mapValues { $0.count }
    }
    
    var currentStreak: Int {
        return 3 // TODO: FIX FIX
    }
    
    var bestDay: Int {
        let calendar = Calendar.current
        let grouped = Dictionary(grouping: tasks.filter { $0.isCompleted }) { task in
            calendar.startOfDay(for: task.updatedAt)
        }
        return grouped.values.map(\.count).max() ?? 0
    }
}
