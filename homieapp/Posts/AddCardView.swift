import SwiftUI

struct AddCardView: View {
    @Binding var cards: [Card]
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var tags: String = ""
    @Environment(\.presentationMode) var presentationMode // Доступ к presentationMode для закрытия окна
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Card Information")) {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    TextField("Tags (comma separated)", text: $tags)
                }
                
                Button("Add Card") {
                    let tagList = tags.split(separator: ",").map {
                        String($0).trimmingCharacters(in: .whitespaces)
                    }
                    
                    let newCard = Card(title: title, description: description, tags: tagList)
                    cards.append(newCard)
                    presentationMode.wrappedValue.dismiss() // Закрываем окно после добавления карточки
                }
            }
            .navigationBarTitle("Add Card")
            .navigationBarItems(trailing: Button("Dismiss") {
                presentationMode.wrappedValue.dismiss() // Закрываем окно при нажатии "Done"
            })
        }
    }
}
