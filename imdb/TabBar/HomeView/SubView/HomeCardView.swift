
import SwiftUI

struct HomeCardView: View {
    var item : DataList
    var body: some View {
        VStack{
            Divider()
                .background(Color.black)
            HStack{
                Text(item.show.name ?? "Not available")
                    .font(.largeTitle)
                    .foregroundStyle(Color.black)
                Spacer()
            }
            
            if let url = URL(string: item.show.image.original ?? ""){
                AsyncImage(url: url) {phase in
                    if let image = phase.image{
                        image.resizable()
                    } else if phase.image == nil {
                        Image(systemName: "photo")
                            .font(.title)
                            .foregroundStyle(Color.black)
                    } else {
                        ProgressView()
                            .controlSize(.large)
                    }
                }
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: 0, maxHeight: 350)
            }
            Divider().background(Color.black)
        }
        .padding()
        .background(Color("ThemeGray"))
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
    }
}
