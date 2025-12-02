import SwiftUI

extension View {
    /// 指定した角を丸くし、ビューの境界をクリップします。
    ///
    /// 実際に利用する際は、`UIRectCorner`の配列を`corners`に指定する。
    ///
    ///   Text("Top Left, Bottom Left Rounded Corners")
    ///     .frame(width: 175, height: 75)
    ///     .foregroundColor(Color.white)
    ///     .background(Color.black)
    ///     .cornerRadius(10, corners: [.topLeft, .bottomLeft])
    public func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

private struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
