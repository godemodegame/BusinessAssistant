import SwiftUI
import ConcentricOnboarding

struct OnboardView: View {
    @State var isPresented = false
    var body: some View {
        let pages = (0...3).map { i in
            AnyView(
                PageView(
                    title: MockData.title,
                    header: MockData.headers[i],
                    content: MockData.contentStrings[i],
                    textColor: MockData.textColors[i]
                ).fullScreenCover(
                    isPresented: $isPresented,
                    content: {
                        MainView()
                    }
                )
            )
        }

        var a = ConcentricOnboardingView(pages: pages, bgColors: MockData.colors)

        a.insteadOfCyclingToFirstPage = {
            self.isPresented.toggle()
        }
        return a
    }
}

struct PageView: View {
    var title: String
    var header: String
    var content: String
    var textColor: Color

    let textWidth: CGFloat = 350

    var body: some View {
        return
            VStack(alignment: .center, spacing: 50) {
                Text(title)
                    .font(Font.system(size: 40, weight: .bold, design: .rounded))
                    .foregroundColor(textColor)
                    .frame(width: textWidth)
                    .multilineTextAlignment(.center)
                VStack(alignment: .center, spacing: 5) {
                    Text(header)
                        .font(Font.system(size: 25, weight: .bold, design: .rounded))
                        .foregroundColor(textColor)
                        .frame(width: 300, alignment: .center)
                        .multilineTextAlignment(.center)
                    Text(content)
                        .font(Font.system(size: 18, weight: .bold, design: .rounded))
                        .foregroundColor(textColor)
                        .frame(width: 300, alignment: .center)
                        .multilineTextAlignment(.center)
                }
            }.padding(60)
    }
}

struct MockData {
    static let title = "Eating grapes 101"
    static let headers = [
        "Step 1",
        "Step 2",
        "Step 3",
        "Step 4",
    ]
    static let contentStrings = [
        "Break off a branch holding a few grapes and lay it on your plate.",
        "Put a grape in your mouth whole.",
        "Deposit the seeds into your thumb and first two fingers.",
        "Place the seeds on your plate."
    ]

    static let colors = [
        "F38181",
        "FCE38A",
        "95E1D3",
        "EAFFD0"
        ].map{ Color(hex: $0) }

    static let textColors = [
        "FFFFFF",
        "4A4A4A",
        "4A4A4A",
        "4A4A4A"
        ].map{ Color(hex: $0) }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff


        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
}

struct OnboardView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardView()
    }
}
