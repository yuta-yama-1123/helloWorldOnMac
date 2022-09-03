import SwiftUI

struct SquareProgressView: View {
  @Binding var progress: CGFloat
  var fullWidth: Int
  var baseColor: Color = Color.gray.opacity(0.20)
  var progressColor: Color = Color.blue

  var body: some View {
    GeometryReader { geometry in
      VStack(alignment: .trailing) {
        ZStack(alignment: .leading) {
          Rectangle()
            .fill(self.baseColor)
          Rectangle()
            .fill(self.progressColor)
            .frame(width: CGFloat(fullWidth) * progress)
        }
      }
    }
  }
}
