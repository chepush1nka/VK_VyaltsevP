import Foundation

/**
        Структура нужна для корректного декодирования
        данных из json.
*/
struct Body: Decodable, Hashable {
    let body: Services
    struct Services: Decodable, Hashable {
        let services: [Service]
    }
}
