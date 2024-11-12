import SwiftUI

struct OnboardingView: View {
    var data: OnboardingData

    var body: some View {
        VStack {
            Image(data.image)
                .resizable()
                .scaledToFit()
                .frame(height: 200) // Задай размер изображения
            Text(data.title)
                .font(.largeTitle)
                .padding(.top, 20)
            Text(data.description)
                .font(.body)
                .padding(.top, 10)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
        }
    }
}
