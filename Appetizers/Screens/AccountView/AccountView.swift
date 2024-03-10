

import SwiftUI

struct AccountView: View {
    
    @StateObject var VM = AccountViewModel()
    
    
    var body: some View {
        NavigationStack{
           Form {
                Section {
                    TextField("First Name", text: $VM.user.firstName)
                    TextField("Last Name", text: $VM.user.lastName)
                    TextField("Add Email Id", text: $VM.user.emailId)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    
                    DatePicker("Birth Date", selection: $VM.user.birthday,
                            displayedComponents: .date)
                        
                    Button{
                        VM.saveChanges()
                        
                    }label: {
                        Text("Save Changes")
                    }
                } header: {
                    Text("Personal Info")
                }
                .tint(.brandPrimary)

                Section {
                    Toggle("Extra Napkins", isOn: $VM.user.extraNapkins)
                    Toggle("Frequent Refils", isOn: $VM.user.frequentRefils)
                } header: {
                    Text("Requests")
                }
                .tint(.brandPrimary)

                
            }
            .navigationTitle("👦🏻 Account")
        }
        .onAppear(perform: {
            VM.getUserData()
        })

        .alert("Alert", isPresented: $VM.isShowingAlert, presenting: VM.alertError) { errorMsg in
            Button{
                VM.isShowingAlert = false
            } label: {
                Text("OK")
            }
        } message: { errorMsg in
           Text(errorMsg.message)
        }

        
    }
}

#Preview {
    AccountView()
}
