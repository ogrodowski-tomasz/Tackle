import Foundation
import SwiftUI
import Observation

enum TabType: Identifiable, Hashable, CaseIterable {
    case tasks
    case statistics
    case settings
    
    var id: TabType { self }
    
    var title: String {
        switch self {
        case .tasks:
            "Tasks"
        case .statistics:
            "Statistics"
        case .settings:
            "Settings"
        }
    }
    
    var imageName: String {
        switch self {
        case .tasks:
            "checklist"
        case .statistics:
            "chart.bar"
        case .settings:
            "gearshape"
        }
    }
    
    @ViewBuilder
    var destination: some View {
        switch self {
        case .tasks:
            TaskListRootView()
        case .statistics:
            StatisticsRootView()
        case .settings:
            SettingsRootView()
        }
    }
}

enum AppRoute: Hashable {
    case taskForm(task: TaskModel?)
    case taskDetails(id: String)
    case statisticsDetails
    case settingsAbout
}

@Observable
class NavigationManager {
    
    var selectedtab: TabType = .tasks
    
    var taskPath: [AppRoute] = []
    var statisticsPath: [AppRoute] = []
    var settingsPath: [AppRoute] = []
    
    
    func navigate(to route: AppRoute, in tab: TabType) {
        switch tab {
        case .tasks:
            taskPath.append(route)
        case .statistics:
            statisticsPath.append(route)
        case .settings:
            settingsPath.append(route)
        }
    }
    
    func popToRoot(in tab: TabType) {
        switch tab {
        case .tasks:
            taskPath.removeAll()
        case .statistics:
            statisticsPath.removeAll()
        case .settings:
            settingsPath.removeAll()
        }
    }
}
