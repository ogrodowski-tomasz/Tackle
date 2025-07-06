import SwiftData
import SwiftUI

struct StatisticsView: View {
    
    @Query private var tasks: [TaskModel]
    
    var store: StatisticsStore {
        StatisticsStore(tasks: tasks)
    }
    
    var body: some View {
        List {
            overview
            achievements
            activity
            goalWeeks
        }
        .navigationTitle("Statistics")
    }
    
    private var overview: some View {
        Section("Overview") {
            StatisticRow(icon: "checkmark.circle.fill", label: "Completed Tasks", value: "\(store.completedCount)")
            StatisticRow(icon: "circle", label: "Active Tasks", value: "\(store.activeCount)")
            StatisticRow(icon: "calendar", label: "This Week", value: "\(store.thisWeekCompleted)")
        }
    }
    
    private var achievements: some View {
        Section("Achievements") {
            AchievementRow(icon: "flame.fill", label: "Current Streak", value: "\(store.currentStreak)")
            AchievementRow(icon: "star.fill", label: "Best Day", value: "\(store.bestDay) tasks")
        }
    }
    
    private var activity: some View {
        Section("Activity") {
            BarChartView(data: store.weeklyCompletions, title: "Weekly Completions")
            PieChartView(data: store.priorityDistribution, title: "By Priority")
        }
    }
    
    private var goalWeeks: some View {
        Section("Goal Weeks") {
            GoalWeekProgressView(data: store.goalWeekStats)
        }
    }
}



#Preview {
    NavigationStack {
        StatisticsView()
            .modelContainer(.preview)
    }
}
