import SwiftUI

struct CardDetailView: View {
    var card: Card
    @Environment(\.presentationMode) var presentationMode // Для закрытия экрана

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(card.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 20)

            Text(card.description)
                .font(.body)
                .padding(.top, 10)

            // Отображаем теги карточки
            HStack {
                ForEach(card.tags, id: \.self) { tag in
                    Text(tag)
                        .font(.caption)
                        .padding(8)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
            }
            .padding(.top, 10)

            Spacer()

            Button(action: {
                presentationMode.wrappedValue.dismiss() // Закрытие экрана
            }) {
                Text("Close")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)
        }
        .padding()
        .navigationBarHidden(true) // Скрываем навигационную панель
    }
}
