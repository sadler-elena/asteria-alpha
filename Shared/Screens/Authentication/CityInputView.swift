//
//  CityInputView.swift
//  asteria alpha
//
//  Created by Geraldine Turcios on 1/11/21.
//

import SwiftUI

struct CityInputView: View {
    // MARK: - Properties

    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.presentationMode) private var presentationMode

    @Binding var cityOfBirth: String

    @State private var cities = [City]()
    @State private var cityText = ""
    @State private var maxRows = 20
    @State private var searchTimer: Timer? = nil
    @State private var isNotFoundMessageVisible = false

    @State private var isErrorAlertVisible = false
    @State private var errorMessage: String? = nil

    private var formattedCity: String {
        // Replaces whitespaces in city text with hyphens for requests
        let unformattedCity = cityText
        return unformattedCity.replacingOccurrences(of: " ", with: "-")
    }

    // MARK: - Methods

    func cityButtonTapped(city: City) {
        cityOfBirth = "\(city.toponymName), \(city.countryCode)"
        presentationMode.wrappedValue.dismiss()
    }

    func errorMessageCloseButtonTapped() {
        cityText = ""
        isErrorAlertVisible = false
        errorMessage = nil
    }

    func handleCityTextChange<V>(_ value: V) {
        searchTimer?.invalidate()
        cities = []
        maxRows = 20
        isNotFoundMessageVisible = false

        if !cityText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            // Runs a two second timer to delay the request if the user is still typing
            searchTimer = Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                NetworkManager.shared.fetchLocation(with: formattedCity, rows: maxRows) { result in
                    switch result {
                    case .success(let cities):
                        handleFetchedCities(for: cities)
                    case .failure(let error):
                        handleRequestError(for: error)
                    }
                }
            }
        }
    }

    func fetchMoreRows(city: City) {
        if city == cities.last {
            maxRows += 20

            NetworkManager.shared.fetchLocation(with: formattedCity, rows: maxRows) { result in
                switch result {
                case .success(let cities):
                    self.cities = cities
                case .failure(let error):
                    handleRequestError(for: error)
                }
            }
        }
    }

    // Request handlers

    func handleFetchedCities(for cities: [City]) {
        if cities.isEmpty {
            isNotFoundMessageVisible = true
        } else {
            self.cities = cities
        }
    }

    func handleRequestError(for error: ATError) {
        isErrorAlertVisible = true
        errorMessage = error.rawValue
    }

    // MARK: - Body

    func getCityRow(for city: City) -> some View {
        HStack {
            Group {
                Text("\(city.toponymName), ") +
                    Text("\(city.adminName1), ") +
                    Text("\(city.countryName)")
            }
            .foregroundColor(Color(.label))
            Spacer()
        }
        .padding()
        .onAppear(perform: { fetchMoreRows(city: city) })
    }

    var citiesList: some View {
        LazyVStack {
            Divider()
            ForEach(cities, id: \.geonameId) { city in
                Button(action: { cityButtonTapped(city: city) }) {
                    getCityRow(for: city)
                }
                Divider()
            }
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            NavigationBarView(title: "city of birth") {
                NavigationBackButton()
            } trailing: {
                NavigationBackButton()
                    .hidden()
            }
            HStack(spacing: 0) {
                Image(systemName: "magnifyingglass")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
                TextField("Search", text: $cityText)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .font(.custom(Fonts.quicksandRegular, size: 18))
                if !cityText.isEmpty {
                    Button(action: { cityText = "" }) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(.gray)
                            .padding(.leading, 8)
                    }
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical)
            Divider()
            if isNotFoundMessageVisible {
                Spacer()
                Text("No results found")
                    .font(.custom(Fonts.quicksandRegular, size: 26))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                Spacer()
            } else if !cityText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty && cities.isEmpty {
                VStack {
                    Spacer()
                    ProgressView("Fetching cities")
                        .font(.custom(Fonts.quicksandRegular, size: 26))
                    Spacer()
                }
            } else if cityText.isEmpty || cities.isEmpty {
                VStack {
                    Spacer()
                    Text("Use the search bar to find your city of birth")
                        .font(.custom(Fonts.quicksandRegular, size: 26))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 40)
                    Spacer()
                }
            } else {
                ScrollView {
                    citiesList
                }
            }
        }
        .alert(isPresented: $isErrorAlertVisible) {
            Alert(
                title: Text("Error"),
                message: Text(errorMessage ?? "Please try again."),
                dismissButton: .default(Text("Okay"), action: errorMessageCloseButtonTapped)
            )
        }
        .navigationBarHidden(true)
        .onChange(of: cityText, perform: handleCityTextChange)
    }
}

// MARK: - Previews

struct CityInputViewPreviews: PreviewProvider {
    static var previews: some View {
        CityInputView(cityOfBirth: .mock(""))
    }
}
