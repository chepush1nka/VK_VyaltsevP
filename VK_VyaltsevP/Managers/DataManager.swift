import Foundation

/**
        Класс предназначен для получения дфнных из json.
*/
class DataManager : ObservableObject {
    /// Список сервисов.
    @Published var services: [Service] = []

    /// Функция для получения списка сервисов.
    func fetch() {
        guard let url = URL(string: "https://publicstorage.hb.bizmrg.com/sirius/result.json") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            /// Конвертируем полученные данные.
            do {
                let body = try JSONDecoder().decode(Body.self, from: data)
                DispatchQueue.main.async {
                    self?.services = body.body.services
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
