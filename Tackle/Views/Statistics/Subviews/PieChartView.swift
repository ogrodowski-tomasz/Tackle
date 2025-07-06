import SwiftUI

struct PieChartView: View {
    let data: [(priority: TaskPriority, value: Int)] // Priority: count
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            HStack(spacing: 16) {
                ForEach(data, id: \.priority) { entry in
                    VStack {
                        Circle()
                            .fill(entry.priority.color)
                            .frame(width: 20, height: 20)
                        Text(entry.priority.label)
                            .font(.caption)
                        Text("\(entry.value)")
                            .font(.caption2)
                    }
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    PieChartView(data: [(.high, 5), (.medium, 3), (.low, 2)], title: "By Priority")
        .padding()
}
