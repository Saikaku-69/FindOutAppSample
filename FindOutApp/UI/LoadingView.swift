import SwiftUI
//加载条
struct LoadingView: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    //主界面迁移
    @State private var MoveToHomeView: Bool = false

    var body: some View {
        VStack {
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle())
                .frame(width: 200, height: 10) // 设定宽度为200，粗细为10
                .scaleEffect(x: 1, y: 2, anchor: .center) // 加倍粗细
                .padding()

            Text("読み込んでいます...")
        }//VStack end
        .padding()
        .onAppear {
            startProgress()
        }
        .navigationBarBackButtonHidden(true) // 隐藏返回按钮
//        .navigationDestination(isPresented: $MoveToGameView) {
//            BaseMapView()
//        }
        .fullScreenCover(isPresented: $MoveToHomeView) {
            HomeView()
        }
    }//var body end

    func startProgress() {
        // 每0.1秒更新一次，持续4秒内走完
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if progress < 1.0 {
                progress += 0.025 // 4秒钟内达到1.0
            } else {
                timer?.invalidate() // 完成时停止计时器
                MoveToHomeView = true
            }
        }
    }//func startProgress end
}

#Preview {
    NavigationStack {
        LoadingView()
    }
}
