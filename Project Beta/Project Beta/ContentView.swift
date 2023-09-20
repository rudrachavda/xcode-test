import SwiftUI

struct ContentView: View {
    @State private var counter = 0
    @State private var isChecked = false
    @State private var isDarkMode = false

    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "cloud")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                
                Text("Rudra Chavda!")
                
                Text("Count: \(counter)")
                
                Button(action: {
                    self.counter += 1
                }) {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                }
                
                NavigationLink(destination: AnotherView()) {
                    Text("Go to Another Page")
                }
                
                TextField("Enter text here", text: .constant(""))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Toggle(isOn: $isChecked) {
                    Text("Toggle to check")
                }
                .padding()
                
                Spacer()
                
                HStack {
                    Text("Dark Mode")
                    Spacer()
                    Toggle(isOn: $isDarkMode) {
                    // Empty, toggle will handle it
                    }
                    .padding()
                }
            }
            .padding()
            .navigationTitle("Main Page")
            .navigationBarItems(trailing:
                Button(action: {
                    // Add your action for the top right button here
                }) {
                    Image(systemName: "gear")
                        .imageScale(.large)
                }
            )
            .environment(\.colorScheme, isDarkMode ? .dark : .light)
        }
    }
}


struct AnotherView: View {
    var body: some View {
        Text("This is another page!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
