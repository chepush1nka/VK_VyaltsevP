import SwiftUI

struct ContentView: View {
    @StateObject var dataManager = DataManager()
    init() {
            UITableView.appearance().backgroundColor = .systemBackground
        }
    var body: some View {
        VStack {
            Text("Сервисы VK")
                .font(.title2)
                .lineLimit(nil)
            List {
                ForEach(dataManager.services, id: \.self) { service in
                    HStack {
                        Link("", destination: URL(string: service.link)!)
                        ImageView(urlString: service.icon_url)
                        VStack(alignment: .leading, spacing: 5) {
                            Text(service.name)
                            Text(service.description)
                                .font(.caption)
                                .multilineTextAlignment(.leading)
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                            .resizable()
                            .foregroundColor(Color.gray)
                            .frame(width: 6.0, height: 11.0)
                            
                    }.listRowBackground(Color(UIColor.systemBackground))
                    
                }
            }.onAppear() {
                dataManager.fetch()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
