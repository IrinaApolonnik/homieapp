import SwiftUI

struct OnboardingContainerView: View {
    let pages = [
        OnboardingData(image: "img1", title: "Привет!", description: "Добро пожаловать!"),
        OnboardingData(image: "img2", title: "Функции", description: "Откройте новые функции"),
        OnboardingData(image: "img3", title: "Начнем", description: "Давайте начнем")
    ]
    
    @State private var currentPage = 0
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false // Добавили AppStorage

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<pages.count) { index in
                    OnboardingView(data: pages[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

            // Кнопки навигации
            HStack {
                if currentPage > 0 {
                    Button("Назад") {
                        withAnimation {
                            currentPage -= 1
                        }
                    }
                }
                Spacer()
                if currentPage < pages.count - 1 {
                    Button("Далее") {
                        withAnimation {
                            currentPage += 1
                        }
                    }
                } else {
                    Button("Начать") {
                        // Устанавливаем флаг завершения онбординга
                        hasSeenOnboarding = true
                    }
                }
            }
            .padding()
        }
    }
}
