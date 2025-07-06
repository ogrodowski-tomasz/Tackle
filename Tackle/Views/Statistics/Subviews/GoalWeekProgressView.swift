import SwiftUI

struct GoalWeekProgressView: View {
    let data: [(Int): (Int)] // weekNumber: taskCount
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(data.keys.sorted(), id: \.self) { week in
                HStack {
                    Text("Week \(week)")
                        .font(.subheadline)
                    Spacer()
                    ProgressView(value: Float(data[week] ?? 0), total: 10)
                        .frame(width: 150)
                    Text("\(data[week] ?? 0)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    GoalWeekProgressView(data: [27: 5, 28: 3, 29: 8])
        .padding()
}
