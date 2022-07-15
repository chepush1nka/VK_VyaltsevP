import Foundation
import SwiftUI

/**
        Структура отвечает за отображение
        иконки сервиса на главном экране.
*/
struct ImageView: View {
    let urlString: String
    @State var data: Data?
    
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage).resizable().aspectRatio(contentMode: .fill).padding(.trailing).frame(width: 65, height: 65)
        } else {
            Image("").resizable().aspectRatio(contentMode: .fit).frame(width: 65, height: 65).onAppear {
                fetchData()
            }
        }
    }
    /// Функция совершает работу с url изображения.
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}
