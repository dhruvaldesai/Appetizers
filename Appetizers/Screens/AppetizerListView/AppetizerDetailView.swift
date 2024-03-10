
import SwiftUI
import CachedAsyncImage

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Order
    
    var appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack{
            CachedAsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image.resizable()
                    .frame(width: 300, height: 225)
            }
            placeholder: {
                ProgressView()
              }
              .padding(.bottom, 10)
            
            
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom, 10)
                

                    Text(appetizer.description)
                    .font(.body)
                    .fontWeight(.semibold)
                    .padding(.bottom, 30)
                
                HStack(spacing: 30) {
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    
                }

            }
            
            Spacer()
            
            
            Button{
                order.add(appetizer)
                isShowingDetail = false
            }label: {
                Text("$\(appetizer.price, specifier: "%.2f") Add To Cart")
                    .bold()
            }
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
            .tint(.brandPrimary)
            .padding(.bottom, 30)
            
        }
        .frame(width:300 ,height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 50)
        .overlay(
            Button{
                print("dismiss")
               isShowingDetail = false
            }label: {
                XDismissButton()
            },
            alignment: .topTrailing
          )
        
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}

struct NutritionInfo: View {
    var title: String
    var value: Int
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
            Text("\(value)")
                .foregroundStyle(.secondary)
                .italic()
        }
    }
}
