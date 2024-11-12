import SwiftUI

@main
struct MyApp: App {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    @AppStorage("isAuthenticated") var isAuthenticated: Bool = false

    var body: some Scene {
        WindowGroup {
            if !hasSeenOnboarding {
                // Показать онбординг, если он еще не пройден
                OnboardingContainerView()
                    .onDisappear {
                        hasSeenOnboarding = true
                    }
            } else if !isAuthenticated {
                // Показать экран авторизации, если пользователь не авторизован
                LoginView()
                    .onDisappear {
                        isAuthenticated = true
                    }
            } else {
                // Показать основной экран, если онбординг пройден и пользователь авторизован
                ContentView()
            }
        }
    }
}
