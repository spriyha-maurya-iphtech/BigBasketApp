## BigBasketApp
This repository contains a SwiftUI-based clone of the popular BigBasket app. The app provides users with features such as Firebase authentication for account creation and login, as well as a user-friendly interface for browsing and purchasing products. The project includes key components such as a side menu, search functionality, banners, and more.

## Features
1. Firebase Authentication
* User Login & Sign-Up: Users can create an account and log in securely using Firebase Authentication.
* Validation: Password validation ensures a smooth and error-free account creation process.
* Account Management: Account setup includes fields for email, full name, and password, with visual indicators for password matching.
2. Home Screen
* Search Bar: Allows users to search for products.
* Top Banner: Displays promotional content.
* Scrollable Sections: Organized views for categories and fresh produce, ensuring easy navigation.
* Side Menu: Accessible via a hamburger icon, providing navigation options.
* Bottom Banner: Displays discounts/ads etc.
3. Cart Integration
* Cart Icon: Displays the number of items in the cart dynamically.
* Add/Remove Items: Users can add or remove items from the cart, with real-time updates to the total cost and quantity.
* Navigation: Links to the cart details page for easy access.
4. Category Menu Items
* Interactive Categories: Displays a list of product categories for quick navigation.
* Customizable Layout: Categories are presented in a visually appealing, scrollable layout.
* Ease of Use: Users can quickly tap on a category to view related products.
5. Reusable Components
Modular and reusable SwiftUI components such as TopTitleView, SearchBarView etc.
## Requirements
* Xcode 14+
* Swift 5+
* iOS 15+
## Architecture
The app follows the MVVM (Model-View-ViewModel) architecture pattern:
1. Models:
* User.swift
Represents the user data model (e.g., uid, email, fullName).
* CartItem.swift
Represents individual items in the cart (e.g., name, price, quantity).
2. Views:
* HomeView.swift
* TopTitleView.swift
* SearchBarView.swift
* CategoriesSectionView.swift
* FreshProduceSectionView.swift
* BottomBannerView.swift
* SideMenuView.swift
* TabBarView.swift
* LoginView.swift
* AccountView.swift
* CartDetailView.swift
3. ViewModels:
* AuthViewModel.swift
Handles Firebase authentication (login, signup, password recovery).
Manages the current user's session and error handling.
* CartViewModel.swift
Manages cart operations such as adding/removing items and calculating the total cost.
4. Services:
* FirebaseService.swift
A centralized service for Firebase-related operations like authentication and Firestore CRUD.
5. Utilities:
* InputView.swift
A reusable SwiftUI component for text input fields.
* CapsuleButtonStyle.swift
A custom button style for consistent design.
* Constants.swift
Contains static values like API keys, default placeholders, and asset names.
## Package Dependencies
* Firebase 
* abseil
* AppCheck
* GoogleAppMeasurement
* GoogleDataTransport
* GoogleUtilities
* gRPC
* GTMSessionFetcher
* InteropForGoogle
* leveldb
* nanopb
* Promises
* SwiftProtobuf
## Future Improvements
Add product filtering and sorting.
Integrate payment gateway for seamless checkout.
Enhance UI/UX with animations and themes.
Add push notifications for offers and updates.
## License
This project is open source.
## Getting Started
* Clone the Repository: git clone (https://github.com/spriyha-maurya-iphtech/BigBasketApp.git)
* Open in Xcode: Open the SpotifyUI.xcodeproj file in Xcode.
* Run the App: Ensure you have an iOS simulator or device configured. Build and run the app using the Play button in Xcode.
## Acknowledgements
We would like to thank the Apple community for their excellent framework and documentation,which greatly facilitated the development of this project.
## Screenshots
![Simulator Screenshot - iPhone 14 - 2024-12-30 at 11 41 27](https://github.com/user-attachments/assets/34f31c74-4bf7-428c-9a65-73cdf7685b95)
![Simulator Screenshot - iPhone 14 - 2024-12-30 at 11 40 07](https://github.com/user-attachments/assets/d9670e45-8e62-45c2-bec2-89b5c760de16)
![Simulator Screenshot - iPhone 16 Plus - 2024-12-30 at 13 00 39](https://github.com/user-attachments/assets/44ab273c-5672-418a-a187-34e728a914b2)

![Simulator Screenshot - iPhone 16 Plus - 2024-12-30 at 13 00 02](https://github.com/user-attachments/assets/bb09aaa2-a591-48e1-ab1c-2b6bf13c5d24)
![Simulator Screenshot - iPhone 16 Plus - 2024-12-30 at 12 59 38](https://github.com/user-attachments/assets/e24bc897-7fdf-48f8-92e0-ca5bc7e959eb)
![Simulator Screenshot - iPhone 16 Plus - 2024-12-30 at 13 00 20](https://github.com/user-attachments/assets/69773db8-0d5b-4291-948a-8aa6f5cf64fa)

![Screenshot 2024-12-30 at 11 40 00 AM](https://github.com/user-attachments/assets/8aaedc21-3169-4bf4-b9f5-c105846a24a1)
![Screenshot 2024-12-30 at 11 39 14 AM](https://github.com/user-attachments/assets/76af66e7-9f3a-4e57-b326-b8a6357dd317)

![Simulator Screen Recording - iPhone 16 Plus - 2024-12-30 at 13 08 58](https://github.com/user-attachments/assets/0997162e-0b92-4a6f-b3ff-983ce999a1d1)
