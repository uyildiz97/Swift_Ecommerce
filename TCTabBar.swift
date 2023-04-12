
import SwiftUI

struct TCTabBar: View {
    
    @State var images:[Image]
    @State var tabIndex:Int
    @State var contentTabs:[AnyView]
    
    
    var body: some View {
        ZStack(alignment: .center) {
            
            // Page Content
            ForEach(contentTabs.indices) { i in
                if i == self.tabIndex {
                    self.contentTabs[i]
                }
            }
            
            // TC TAB BAR
            VStack {
                Spacer()
                VStack(alignment: .center, spacing: 0) {
                    Divider()
                    HStack(alignment: .center, spacing: 0) {
                        Spacer()
                        ForEach(images.indices) { i in
                            
                            if i == self.tabIndex {
                                self.images[i]
                                    .foregroundColor(Color.black)
                                    .onTapGesture {
                                        self.tabIndex = i
                                    }
                            } else {
                                self.images[i]
                                    .foregroundColor(Color.gray.opacity(0.7))
                                    .onTapGesture {
                                        self.tabIndex = i
                                    }
                            }
                            Spacer()
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 50)
                    
                    
                }
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: -2)
                
            }.edgesIgnoringSafeArea(.bottom)
        }
        
    }
}

struct TCTabBar_Previews: PreviewProvider {
    static var images:[Image] = [
        Image(systemName: "house.fill"),
        Image(systemName: "cart.fill"),
        Image(systemName: "heart.fill"),
        Image(systemName: "gear")
    ]
    static var previews: some View {
        TCTabBar(images: images, tabIndex: 0, contentTabs: [
            AnyView(Text("Ana Sayfa")),
            AnyView(Text("Sepet")),
            AnyView(Text("Favori")),
            AnyView(Text("Profil Ayarları"))
        ])
    }
}
