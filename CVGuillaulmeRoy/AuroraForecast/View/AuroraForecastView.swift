//
//  AuroraForecastView.swift
//  CVGuillaulmeRoy
//
//  Created by guill roy on 10/09/2024.
//
import SwiftUI

struct AuroraForecastView: View {
    var manager = AuroraAPI()
    @State private var latestImage = UIImage()
    @State private var imagesArray = [UIImage]()
    @State private var currentImageIndex = 0
    @State private var isAnimating = false
    @State private var isLoading = false
    var body: some View {
        VStack {
            Text("Projection des 24 dernières heures")
                .fontWeight(.medium)
                .font(.title2)
                .underline()
                .colorInvert()
                .shadow(color: .white, radius: 10, x: 3, y: 3)
            ZStack {
                Image(uiImage: latestImage)
                    .resizable()
                    .frame(width: 350, height: 350)
                    .cornerRadius(25)
                    .shadow(color: .white, radius: 10, x: 3, y: 3)
                
                // Flou et ProgressView si en cours de chargement
                if isLoading {
                        ProgressView("Chargement des images...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .foregroundColor(.white)
                            .scaleEffect(1.70)
                            .frame(width: 350, height: 350)
                            .background {
                                    Color.black.opacity(0.4) // Un léger fond sombre semi-transparent
                                    .cornerRadius(25) // Pour correspondre à l'image
                                    .blur(radius: 10) // Effet de flou sur l'image

                            }
                    }
            }
            .onTapGesture(count: 2) {
                Task {
                    isLoading = true
                    do {
                        imagesArray = try await manager.fetchImages()
                        isLoading = false
                        startImageAnimation()
                    } catch {
                        print("Erreur lors du fetch des images: \(error)")
                        isLoading = false
                    }
                }
            }
            .task {
                do {
                    latestImage = try await manager.fetchImage()
                } catch {
                    print("Erreur lors du fetch de l'image: \(error)")
                }
            }
            if isAnimating{
                Button(action: {
                    stopImageAnimation()
                }, label: {
                    Label("Arrêt de l'animation", systemImage: "stop.circle")
                })
                .foregroundColor(.white)
                .padding(20)
            }
        }
        .background {
            Image("Background1")
                .blur(radius: 10, opaque: true)
        }
    }
    
    /// Start Images Animation
    private func startImageAnimation() {
        guard !imagesArray.isEmpty else { return }
        isAnimating = true
        currentImageIndex = 0
        print(imagesArray.count)
        Task {
            while isAnimating {
                withAnimation {
                    latestImage = imagesArray[currentImageIndex]
                }
                currentImageIndex = (currentImageIndex + 1) % imagesArray.count
                try? await Task.sleep(nanoseconds: 10000000)
            }
        }
    }
    
    // Fonction pour arrêter l'animation si nécessaire
    private func stopImageAnimation() {
        isAnimating = false
    }
}
#Preview {
    AuroraForecastView()
}
