# 🚀 Floating Action Button (Expandable FAB)

floating_action_button is a customizable, auto-positioning expandable Floating Action Button (Speed Dial FAB) for Flutter.

It allows you to create multiple action buttons (Camera, Gallery, Message, Add Note, etc.) from a single FAB with smooth animation and zero manual positioning.

 and it works automatically.

-------------------------------

## ✨ Features

* 📍 Auto-detects FAB position
* 🔼 Opens upward or downward automatically
* 🎯 Works with all `floatingActionButtonLocation`
* 🎨 Label mode and icon-only mode
* 🌙 Background overlay when opened
* 👆 Tap outside to close
* 🔄 Animated icon rotation
* 📱 Safe-area protection (never goes off screen)
* 🎛 Custom colors support
* 🧩 Unlimited action buttons
* ⚡ Simple plug-and-play usage

---------------------------

## 📸 Feature Preview

https://github.com/user-attachments/assets/a1372fc8-f8d8-45db-8901-93824e05ef37

--------------------------

## 📦 Installation

Add this to your `pubspec.yaml`:

```
dependencies:
  floating_action_button:
    git:
      url: https://github.com/Excelsior-Technologies-Community/floating_action_button/tree/stage
```

Then run:

```
flutter pub get
```

------------------------

## 🧱 File Structure

```
floating_action_button/
│
├─ lib/
│   ├─ floating_action_button.dart      # Public export file
│   │
│   │─ src/
│   │    ├─ floating_fab_widget.dart     # Main expandable FAB logic
│   │    ├─ fab_item.dart                # Action button model
│   │    ├─ fab_controller.dart          # Open/close state handler
│   │    └─ fab_style.dart               # Styling options
│   │
│   │
│   └─ main.dart                        # Example usage app
│
│
│   
│
├─ pubspec.yaml
├─ README.md
└─ LICENSE
```

--------------------------------

## 🛠 Basic Usage

Import the package:

```
import 'package:floating_action_button/floating_action_button.dart';
```

Use inside a Scaffold:

```
Scaffold(
  floatingActionButton: FloatingActionExpandableFab(
    items: [
      FabItem(
        icon: Icons.camera_alt,
        onTap: () => print("Camera clicked"),
      ),
      FabItem(
        icon: Icons.photo,
        onTap: () => print("Gallery clicked"),
      ),
    ],
  ),
);
```

-----------------------------

## 🏷 Label Mode

```
FloatingActionExpandableFab(
  items: [
    FabItem(
      icon: Icons.camera_alt,
      label: "Camera",
      onTap: () {},
    ),
    FabItem(
      icon: Icons.photo,
      label: "Gallery",
      onTap: () {},
    ),
  ],
);
```

-----------------------------------

## 🎯 Icon-Only Mode (Professional UI)

```
FloatingActionExpandableFab(
  style: const FabStyle(showLabels: false),
  items: [
    FabItem(icon: Icons.camera_alt, onTap: () {}),
    FabItem(icon: Icons.photo, onTap: () {}),
  ],
);
```

--------------------------------

## 🎨 Customize Colors

```
FloatingActionExpandableFab(
  style: const FabStyle(
    backgroundColor: Colors.deepPurple,
    iconColor: Colors.white,
  ),
  items: [...],
);
```

----------------------------------

## 📍 Position Control

Flutter controls position, and the library automatically adapts:

```
Scaffold(
  floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
  floatingActionButton: FloatingActionExpandableFab(
    items: [...],
  ),
);
```

-------------------------------

## 🧩 FabItem Properties

| Property          | Type         | Required | Description            |
| ----------------- | ------------ | -------- | ---------------------- |
| `icon`            | IconData     | Yes      | Icon shown on mini FAB |
| `label`           | String       | No       | Action text label      |
| `onTap`           | VoidCallback | Yes      | Action when pressed    |
| `backgroundColor` | Color        | No       | Mini button color      |
| `iconColor`       | Color        | No       | Icon color             |

---------------------------------

## 🧾 MIT License
```
Copyright (c) 2026

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
```
