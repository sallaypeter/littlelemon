//
//  Menu.swift
//  Little Lemon
//
//  Created by Péter Sallay on 2024.02.03.
//

import SwiftUI

struct Menu: View {
    @Binding var selectedTab: String
    @State private var searchText: String = ""
    @Environment(\.managedObjectContext) private var viewContext
    @State var startersOn: Bool = true
    @State var mainsOn: Bool = true
    @State var dessertsOn: Bool = true
    @State var drinksOn: Bool = true

    @FetchRequest(
        sortDescriptors: []
    ) var items: FetchedResults<Dish>

    @State private var jsonFetched: Bool = false
    var body: some View {
        VStack(spacing: 0.0) {
            VStack(spacing: 0.0) {
                HStack(alignment: .center) {
                    Rectangle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white)
                        .padding([.leading], 20)
                    Spacer()
                    Image("Logo")
                        .padding([.bottom], 20)
                    Spacer()
                    Button {
                        selectedTab = "Profile"
                    } label: {
                        Image("Profile")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                    .padding([.bottom,.trailing], 20)
                }
                .background(.white)
                HeroWrapper()
                HStack {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.white)
                    TextField("Search menu", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                }
                .padding(10)
            }
            .background(.littleLemonPrimaryGreen)
            .padding(0.0)
            .frame(minHeight: 375)
            MenuBreakdown(startersOn: $startersOn, mainsOn: $mainsOn, dessertsOn: $dessertsOn, drinksOn: $drinksOn)
            FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {(dishes: [Dish]) in
                List {
                    ForEach(dishes) { dish in
                        ZStack {
                            NavigationLink(destination: ItemDetails(title: dish.title!, description: dish.comment!, price: dish.price!, image: dish.image!)) {
                                EmptyView()
                                    .padding(0.0)
                            }.padding(0.0).opacity(0.0)
                            MenuItemRow(title: dish.title!, description: dish.comment!, price: dish.price!, image: dish.image!)
                                .padding(0.0)
                        }
                        .padding(0.0)
                    }
                    .padding(0.0)
                }
                .padding(0.0)
            }
            .padding(0.0)
        }
        .padding(0.0)
        .onAppear() {
            if (!jsonFetched && items.count == 0) {
                getMenuData()
                jsonFetched = true
            }
        }
        .toolbar(.hidden, for: .tabBar)
    }
    
    /*
    func buildPredicate() -> NSPredicate {
        if (searchText.isEmpty) {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
     */
    
    func buildPredicate() -> NSCompoundPredicate {
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        let starters = !startersOn ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
        let mains = !mainsOn ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let desserts = !dessertsOn ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        let drinks = !drinksOn ? NSPredicate(format: "category != %@", "drinks") : NSPredicate(value: true)

        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
        return compoundPredicate
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
    Menu(selectedTab: .constant(""))
}
