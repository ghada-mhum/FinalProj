//
//  RoomPlanViewModel.swift
//  RealtyQuester
//
//  Created by ghada Mohammad on 19/06/1445 AH.
//

import SwiftUI
import Combine
import RoomPlan
import SwiftUI
import UIKit


struct CreatPlan: View {
    @State private var isShowingFullScreenSheet = false

    var body: some View {
   
            VStack {
                Text("Creat your real estate 3D plan")
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding()
                    .font(.title)
                    .bold()
                
                ZStack{
                    Image("home")
                        .resizable()
                        .frame(width: 300,height: 300)
                        .foregroundColor(.gray.opacity(0.5))
                    ScanAnimation(loopMode: .loop)
                        .scaleEffect(0.9)
                        .frame(width: 300,height: 300)
                    
                }
                Button(action: {
                    isShowingFullScreenSheet = true
                }, label: {
                    RoundedRectangle(cornerRadius: 20)
                    .fill(.appBlue)
                    .frame(width: 250,height: 60)
                    .overlay {
                    Text("Start Scanning")
                    .foregroundStyle(.white)
                    .bold()
                    }
                }).padding()
               Spacer()
            }.background(.clear)
            .fullScreenCover(isPresented: $isShowingFullScreenSheet, content: FullScreenSheetView.init)
           
        }
    
}


struct FullScreenSheetView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var roomCaptureViewModel = ARViewModel()

    var body: some View {
        ZStack{
      
            VStack {
                RoomCaptureViewRepresentable(viewModel: roomCaptureViewModel)
                    .ignoresSafeArea()
                    .overlay(alignment: .bottom) {
                        ButtonOverlay(viewModel: roomCaptureViewModel)
                    }
                    .onAppear {
                        roomCaptureViewModel.actions.send(.startSession)
                    }
                    .sheet(isPresented: $roomCaptureViewModel.showShareSheet) {
                        ActivityViewControllerRep(items: [roomCaptureViewModel.exportUrl])
                    }
               
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            
            Button("Dismiss") {
                presentationMode.wrappedValue.dismiss()
            }.frame(maxWidth: .infinity,maxHeight: .infinity ,alignment: .topLeading)
                .padding()
        }
    }
}

//struct CreatPlan: View {
//    @StateObject var roomCaptureViewModel = ARViewModel()
//    
//    var body: some View {
//        NavigationView{
//            VStack(spacing: 30) {
//                NavigationLink(
//                    destination: {
//                        RoomCaptureViewRepresentable(viewModel: roomCaptureViewModel)
//                            .ignoresSafeArea()
//                            .overlay(alignment: .bottom) {
//                                ButtonOverlay(viewModel: roomCaptureViewModel)
//                            }
//                            .onAppear {
//                                roomCaptureViewModel.actions.send(.startSession)
//                            }
//                            .sheet(isPresented: $roomCaptureViewModel.showShareSheet) {
//                                ActivityViewControllerRep(items: [roomCaptureViewModel.exportUrl])
//                            }
//                    },
//                    label: {
//                        RoundedRectangle(cornerRadius: 20)
//                            .fill(.appBlue)
//                            .frame(width: 200,height: 50)
//                            .overlay {
//                                Text("Start Scanning")
//                                    .foregroundStyle(.white)
//                                    .bold()
//                            }
//                    })
//                
//                Spacer()
//            }
//            .padding(.top, 20)
//        }
//    }
//}


//MARK: -

import SwiftUI

struct NavigationOptionView: View {
  @Environment(\.colorScheme)
  var colorScheme

  let title: String
  let description: String
  var body: some View {
    HStack {
      VStack(alignment: .leading, spacing: 4) {
        HStack {
          Text(title)
            .font(.headline)
            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
          Spacer()
        }
        Text(description)
          .font(.subheadline)
          .multilineTextAlignment(.leading)
          .foregroundColor(.gray)
      }
      Image(systemName: "chevron.right")
        .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
        .padding([.leading, .trailing], 8)
    }
    .padding(.leading, 8)
  }
}

struct NavigationOptionView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      NavigationOptionView(
        title: "Title",
        description: "A descriptive text of what the view behind the navigation option is about."
      )
      .previewLayout(.sizeThatFits)
      .preferredColorScheme(.light)
      .previewDisplayName("Light Mode")

      NavigationOptionView(
        title: "Title",
        description: "A descriptive text of what the view behind the navigation option is about."
      )
      .previewLayout(.sizeThatFits)
      .preferredColorScheme(.dark)
      .previewDisplayName("Dark Mode")
    }
  }
}

//MARK: -
struct ButtonOverlay: View {
    @ObservedObject var viewModel: ARViewModel
    var body: some View {
        HStack {
            if viewModel.canExport {
                Button(
                    action: {
                        viewModel.actions.send(.export)
                    },
                    label: {
                        ButtonLabel(imageSystemName: "square.and.arrow.up")
                    })
            }
            if viewModel.canPlaceBlock {
                Button(
                    action: {
                        viewModel.actions.send(.placeBlock)
                    },
                    label: {
                        ButtonLabel(imageSystemName: "rectangle.fill")
                    })
            }
            if viewModel.canDeleteBlocks {
                Button(
                    action: {
                        viewModel.actions.send(.removeAllBlocks)
                    },
                    label: {
                        ButtonLabel(imageSystemName: "trash")
                    })
            }
            Spacer()
        }
        .padding()
    }
}

//MARK: -

struct ButtonLabel: View {
  var imageSystemName: String
  var body: some View {
    Image(systemName: imageSystemName)
      .resizable()
      .scaledToFit()
      .frame(width: 40, height: 40)
      .padding()
      .background(.appBlue)
      .foregroundColor(.white)
      .cornerRadius(16)
  }
}
//MARK: -

struct ActivityViewControllerRep: UIViewControllerRepresentable {
  var items: [Any]
  var activities: [UIActivity]?

  func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewControllerRep>) -> UIActivityViewController {
    let controller = UIActivityViewController(activityItems: items, applicationActivities: activities)
    return controller
  }

  func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewControllerRep>) {}
}

//MARK: -

class RoomCaptureViewController: UIViewController {
  private var cancellables: Set<AnyCancellable> = []
  private var viewModel: ARViewModel
  private var roomCaptureView: RoomCaptureView?
  private var capturedRoom: CapturedRoom?

  init(viewModel: ARViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    let roomCaptureView = RoomCaptureView(frame: .zero)
    roomCaptureView.translatesAutoresizingMaskIntoConstraints = false
    self.roomCaptureView = roomCaptureView
    view.addSubview(roomCaptureView)
    NSLayoutConstraint.activate([
      roomCaptureView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      roomCaptureView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      roomCaptureView.topAnchor.constraint(equalTo: view.topAnchor),
      roomCaptureView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    setup()
    roomCaptureView.captureSession.delegate = self
  }

  private func setup() {
    viewModel.actions
      .sink { [weak self] action in
        switch action {
        case .startSession:
          self?.startSession()
        case .placeBlock:
          break
        case .removeAllBlocks:
          break
        case .export:
          self?.export()
        }
      }
      .store(in: &cancellables)
  }

  private func startSession() {
    let sessionConfig = RoomCaptureSession.Configuration()
    roomCaptureView?.captureSession.run(configuration: sessionConfig)
  }

  private func export() {
    do {
      try capturedRoom?.export(to: viewModel.exportUrl)
    } catch {
      print("Error exporting usdz scan: \(error)")
      return
    }
    viewModel.showShareSheet = true
  }
}

// MARK: - RoomCaptureSessionDelegate
extension RoomCaptureViewController: RoomCaptureSessionDelegate {
  func captureSession(
    _ session: RoomCaptureSession,
    didUpdate room: CapturedRoom
  ) {
    capturedRoom = room
    DispatchQueue.main.async {
      self.viewModel.canExport = true
    }
  }
}

struct RoomCaptureViewRepresentable: UIViewControllerRepresentable {
  @ObservedObject var viewModel: ARViewModel

  func makeUIViewController(context: Context) -> RoomCaptureViewController {
    return RoomCaptureViewController(viewModel: viewModel)
  }

  func updateUIViewController(_ uiViewController: RoomCaptureViewController, context: Context) { }
}

//MARK: -
class ARViewModel: ObservableObject {
  enum Action {
    case startSession
    case placeBlock
    case removeAllBlocks
    case export
  }

  var actions = PassthroughSubject<Action, Never>()

  let exportUrl = FileManager.default.temporaryDirectory.appending(path: "scan.usdz")
  @Published var canExport = false
  @Published var showShareSheet = false
  @Published var canPlaceBlock = false
  @Published var canDeleteBlocks = false
}

