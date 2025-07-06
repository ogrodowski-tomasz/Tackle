import SwiftUI

struct StatisticRow: View {
    let icon: String
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Label {
                Text(label)
            } icon: {
                Image(systemName: icon)
                    .tint(.secondary)
            }
            Spacer()
            Text(value)
                .bold()
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    StatisticRow(icon: "checkmark.circle.fill", label: "Completed Tasks", value: "24")
        .padding()
}
