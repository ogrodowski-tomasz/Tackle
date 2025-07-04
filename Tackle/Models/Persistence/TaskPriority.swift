import SwiftUI

enum TaskPriority: Int, Codable, CaseIterable, Identifiable {
    case high = 1
    case medium = 2
    case low = 3
    
    var id: Int { rawValue }
    
    var label: String {
        switch self {
        case .high: return "High"
        case .medium: return "Medium"
        case .low: return "Low"
        }
    }
    
    var color: Color {
        switch self {
        case .high: return .red
        case .medium: return .orange
        case .low: return .green
        }
    }
}
