# 🏗️ Tuist + TCA Modular Template Guide

This is an iOS project template perfectly set up with **Tuist**, **The Composable Architecture (TCA)**, and the **SwiftLint Plugin**.
The setup separates the development (Development) and production (Production) environments and follows the **Single Source of Truth (SSOT)** principle for centralized configuration management.

---

## ✨ Key Features

* **Project Structure**: Clean, Flat structure with `Development` and `Production` projects located directly under the `App` folder.
* **SSOT Configuration**: Manages app name, version, and Bundle ID using a single source: `AppConfiguration.swift`.
* **Modular Architecture**: Features are modularized through a **Local Swift Package** (named after the app) containing modules like `EntryKit` and `AppUI`.
* **Shared Resources**: `Info.plist` and `Launch Screen` are shared between both projects.
* **Code Quality**: **SwiftLint Plugin** is applied for automatic linting during the build process.
* **Settings**: iPhone Only / Portrait Only / Clean File Header applied.

---

## 📂 Project Structure

```text
MyApp
├── App
│   ├── Development            # Development App (Suffix: Dev)
│   ├── Production             # Production App (Clean)
│   ├── Shared                 # Shared Resources (Info.plist, Launch Screen)
│   │
│   ├── MyApp                  # ⭐️ Main Package Folder (Must match App Name)
│   │   ├── Sources
│   │   │   ├── EntryKit       # App Entry Point / Core Logic
│   │   │   └── AppUI          # Design System (Includes resources)
│   │   └── Package.swift      # Module Definition
│   │
│   ├── Tuist
│   │   └── ProjectDescriptionHelpers
│   │       └── AppConfiguration.swift # ⭐️ App Configuration Management (SSOT)
│   │
│   └── Workspace.swift        # Workspace Definition
```

---

## 🚀 Getting Started

This template uses **Mise** to manage and execute the required Tuist version.

### 1. Prerequisites (Mise Installation)
Mise must be installed on your system (If using Homebrew):
```bash
brew install mise
```

### 2. Initialization
Navigate to the `App` folder in your terminal to generate the project.

```bash
cd App

# 1. Pin Tuist Version (.mise.toml creation) ⭐️ ESSENTIAL!
mise use tuist@latest

# 2. Download external libraries (TCA, SwiftLint, etc.)
# (This command ensures safe execution using the pinned version)
mise x tuist -- tuist install

# 3. Generate the Xcode Project and Workspace
mise x tuist -- tuist generate
```

> **Note**: If you want to skip typing `mise x ...` every time, activate Mise in your shell.
> ```bash
> eval "$(mise activate zsh)" # or bash
> ```

### 3. Build & Run
Once `MyAppWorkspace.xcworkspace` opens, select the **Development** target and run.

---

## 🛠️ How to Customize (App Renaming)

When creating a new app (e.g., `NewApp`) from this template, you must perform these 3 steps to maintain SSOT and avoid path errors.

### 1. Configuration File Update
Modify the app name and organization in the SSOT file: `App/Tuist/ProjectDescriptionHelpers/AppConfiguration.swift`.

```swift
public enum AppConfiguration {
    public static let appName = "NewApp"           // ⭐️ Change here
    public static let organizationName = "com.new" // ⭐️ Change here
    // ...
}
```

### 2. Package Folder Renaming (Crucial)
The physical folder name must match the new `appName` for Tuist to find the path.

```bash
# Example: Change MyApp -> NewApp (assuming your package folder is MyApp)
mv App/MyApp App/NewApp
```

### 3. Package.swift Internal Naming
Open the `App/NewApp/Package.swift` file and change the internal `name` parameter to match the folder.

```swift
let package = Package(
    name: "NewApp", // ⭐️ Must match the folder name
    // ...
)
```

---

## 🧩 Adding New Modules & Features

To add a new feature, use the **Scaffolding** method. This template supports creating files within a specific module.

### 1. Generate Feature Files
Use the custom `feature` scaffold. You must specify the **target module** and the **feature name**.

```bash
# Syntax: tuist scaffold feature --module <TargetModule> --name <FeatureName>

# Example 1: Create a new 'Login' feature inside a 'Login' module folder
mise x tuist -- tuist scaffold feature --module Login --name Login

# Example 2: Add a 'Logout' feature to the existing 'Login' module
mise x tuist -- tuist scaffold feature --module Login --name Logout
```

### 2. Link Module in Package.swift (For New Modules Only)
If you created a **new module folder** (e.g., `Login`), you must register it in `Package.swift`.
Open `App/MyApp/Package.swift` and add the new module to the `products` and `targets` arrays.

### 3. Regenerate Project
Apply the changes to your Xcode workspace.

```bash
mise x tuist -- tuist generate
```

---

## ⚠️ Notes

* **Launch Screen**: Modify `App/Shared/LaunchScreen.storyboard` to apply changes to both apps simultaneously.
* **Info.plist**: Manage permissions (camera, etc.) via `App/Shared/Info.plist`.
* **Linting**: The SwiftLint plugin runs automatically during the build process; no local installation of SwiftLint via Homebrew is required.
