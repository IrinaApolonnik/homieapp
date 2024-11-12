import SwiftUI

struct ProfileView: View {
    @Binding var user: UserProfile
    @State private var isEditing = false
    @State private var selectedImage: UIImage? // Для выбора нового аватара

    var body: some View {
        NavigationView {
            VStack {
                // Аватар пользователя
                if let avatar = user.avatar {
                    Image(uiImage: avatar)
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.gray)
                        .clipShape(Circle())
                        .shadow(radius: 10)
                }
                
                Text("\(user.firstName) \(user.lastName)")
                    .font(.largeTitle)
                    .padding(.top, 20)
                
                Text(user.email)
                    .font(.subheadline)
                    .padding(.top, 5)
                
                Spacer()
                
                // Кнопка для редактирования профиля
                Button(action: {
                    isEditing.toggle()
                }) {
                    Text("Edit Profile")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .sheet(isPresented: $isEditing) {
                    EditProfileView(user: $user, selectedImage: $selectedImage)
                }
            }
            .padding()
            .navigationBarTitle("Profile", displayMode: .inline)
        }
    }
}
