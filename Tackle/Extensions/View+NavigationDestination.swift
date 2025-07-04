import SwiftUI

extension View {
    
    func tackleNavigationDestination() -> some View {
        self
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .taskForm(let taskModel):
                    TaskFormView(task: taskModel)
                case let .taskDetails(id):
                    Text("Details for \(id)")
                case .statisticsDetails:
                    Text("Statistics Details")
                case .settingsAbout:
                    Text("About")
                }
            }
    }
    
}
