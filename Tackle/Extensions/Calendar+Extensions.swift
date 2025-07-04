import Foundation

extension Calendar {
    
    var currentWeekNumber: Int {
        return self.component(.weekday, from: .init())
    }

}
