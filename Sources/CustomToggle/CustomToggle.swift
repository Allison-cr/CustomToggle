import SwiftUI

public struct MyCustomView<T: CaseIterable & RawRepresentable>: View where T.AllCases: RandomAccessCollection, T.RawValue == String {
    let item: T.Type
    @State private var selectedTheme: T
    let onTap: (T) -> Void

    public init(item: T.Type, selectedTheme: T? = nil, onTap: @escaping (T) -> Void) {
        self.item = item
        self._selectedTheme = State(initialValue: selectedTheme ?? item.allCases.first!)
        self.onTap = onTap
    }
    public var body: some View {
        HStack(spacing: 0) {
            ForEach(item.allCases, id: \.rawValue) { theme in
                Text(theme.rawValue)
                    .padding(.vertical, 10)
                    .frame(width: 100)
                    .contentShape(Rectangle())
                    .background(theme == selectedTheme  ? Color.gray : Color.clear)
                    .cornerRadius(5)
                    .onTapGesture {
                        selectedTheme = theme
                        onTap(theme)
                    }
            }
        }
        .padding(3)
        .background(Color.primary.opacity(0.06), in: Capsule())
        .padding(.top, 20)
    }
}
