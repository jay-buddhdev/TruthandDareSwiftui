import SwiftUI

struct ContentView: View {
    @State private var counter:Int = 2
    
    var body: some View {
        NavigationView{
            ZStack { // 1
                Color.white // 2
                VStack{
                    Spacer()
                    Text("Welcome To Truth and Dare Game ")
                        .font(.system(size: 25))
                        .bold()
                    Spacer().frame(minHeight: 10, maxHeight: 50)
                    Spacer().frame(minHeight: 10, maxHeight: 100)
                    Stepper("Number of Players \(counter)", value: $counter,in:2...8,step: 2).padding(50)
                    Spacer()
                    NavigationLink(destination: GameDashboard(Counter: $counter)) {
                        Text("Start Game")
                            .frame(minWidth: 0, maxWidth: 300)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(40)
                            .font(.title)
                    }
                    Spacer().frame(minHeight: 10, maxHeight: 100)
                }
            }
            .accentColor(Color.black)
        }
       
       
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
