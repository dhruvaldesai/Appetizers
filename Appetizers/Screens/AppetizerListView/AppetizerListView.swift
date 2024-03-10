
import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    
    
    
    var body: some View {
        ZStack{
            
            NavigationStack{
                List(viewModel.appetizers) { appetizer in
                        AppetizerTitleView(appetizer: appetizer)
                            .onTapGesture {
                                viewModel.isShowingDetail = true
                                viewModel.selectedCell = appetizer
                            }
                }
                .navigationTitle("🍟 Appetizer")
                .tint(Color("brandPrimary"))
                .disabled(viewModel.isShowingDetail)
                    
            }
            .blur(radius: viewModel.isShowingDetail ? 15 : 0)
            
            if viewModel.appetizers.isEmpty{
                ProgressView()
                    .controlSize(.large)
                    
            }
            
            if viewModel.isShowingDetail{
                AppetizerDetailView(appetizer: viewModel.selectedCell!, isShowingDetail: $viewModel.isShowingDetail)
            }
            
            
            
            }
        .task{
            viewModel.fetchAppetizer()
        }
        .alert("Server Error", isPresented: $viewModel.isShowingAlert, presenting: viewModel.alertItem) { alertItem in
            Button{
                viewModel.isShowingAlert = false
            }label: {
                Text("OK")
            }
        } message: { alertItem in
            Text(alertItem.message)
        }

        
    }
    
    
}

#Preview {
    AppetizerListView()
}
