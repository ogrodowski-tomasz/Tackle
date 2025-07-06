import SwiftUI

struct AchievementRow: View {
    
    let icon: String
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Label(label, systemImage: icon)
                .foregroundStyle(.yellow)
            Spacer()
            Text(value)
                .bold()
        }
        .padding(.vertical, 4)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    AchievementRow(icon: "flame.fill", label: "Current Streak", value: "5 days")
        .padding()
}
