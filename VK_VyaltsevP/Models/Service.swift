import Foundation

/**
        Структура предназначена для хранения
        информации о Сервисах.
*/
struct Service: Decodable, Hashable {
    /// Название сервиса.
    let name: String
    /// Описание сервиса.
    let description: String
    /// Ссылка на сервис.
    let link: String
    /// Ссылка на изображение логотипа сервиса.
    let icon_url: String
}
