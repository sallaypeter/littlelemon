//
//  Menu.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.03.
//

import SwiftUI

struct Menu: View {
    @State private var searchText: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    /*
    @FetchRequest(
            sortDescriptors: buildSortDescriptors(),
            predicate: nil,
            animation: .default)
    private var dishes: FetchedResults<Dish>
     */
    @State private var jsonFetched: Bool = false
    var body: some View {
        VStack {
            Text("Little Lemon")
            Text("Chicago")
            Text("Your local Mediterranian Bistro")
            TextField("Search menu", text: $searchText)
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {(dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        NavigationLink(destination: ItemDetails(title: dish.title!, price: dish.price!)) {
                            HStack{
                                AsyncImage(url: URL(string: dish.image!)) { image in
                                    image.resizable()
                                } placeholder: {
                                    Image(systemName: "fork.knife.circle")
                                }
                                .frame(width: 50, height: 50)
                                Text(dish.title!)
                                    .font(.system(size: 16, weight: .bold))
                                Spacer()
                                Text("$\(dish.price!)")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                            }
                        }
                    }
                }
            }
        }
        .onAppear() {
            if (!jsonFetched) {
                getMenuData()
                jsonFetched = true
            }
        }
    }
    
    func buildPredicate() -> NSPredicate {
        if (searchText.isEmpty) {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [
            NSSortDescriptor(
                key: "title",
                ascending: true,
                selector: #selector(NSString.localizedStandardCompare))
        ]
    }
    
    func getMenuData() {
        PersistenceController.shared.clear()
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let menuList = try? JSONDecoder().decode(MenuList.self, from: data) {
                    let menuItems = menuList.menu
                    for item in menuItems {
                        let dish = Dish(context: viewContext)
                        dish.id = Int64(item.id)
                        dish.title = item.title
                        dish.image = item.image
                        dish.price = item.price
                        dish.category = item.category
                        dish.comment = item.description
                    }
                    try? viewContext.save()
                    return
                }
            }
        }
        task.resume()
    }
}

#Preview {
    Menu()
}
