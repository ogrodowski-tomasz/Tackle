import SwiftUI

struct BarChartView: View {
    let data: [Int]
    let title: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            
            HStack(alignment: .bottom, spacing: 8) {
                ForEach(data.indices, id: \.self) { index in
                    VStack {
                        Capsule()
                            .frame(width: 20, height: CGFloat(data[index] * 10))
                        Text(shortDay(for: index))
                            .font(.caption2)
                    }
                }
            }
            .frame(height: 100)
        }
        .padding(.vertical, 8)
    }
    
    private func shortDay(for index: Int) -> String {
        let symbols = Calendar.current.shortWeekdaySymbols
        return symbols[(index + 1) % 7] // Offset
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    BarChartView(data: [2,4,1,3,5,0,6], title: "Weekly Completions")
        .padding()
}
