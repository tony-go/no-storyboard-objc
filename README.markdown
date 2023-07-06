# macOS Objective-C App Without Storyboards

This project is a simple macOS application built using Objective-C without the use of storyboards or nib files.
It is intended for educational and research purposes and showcases the building of a macOS app using pure Objective-C code.

## Features

- Window management using `NSWindowController`.
- View switching between two custom views.
- Use of `NSTextField` and `NSButton`.
- Handling the CMD+Q keyboard shortcut for quitting the application.
- Built using CMake.

## Prerequisites

- macOS
- Xcode
- Command Line Tools for Xcode (for `clang`)
- CMake

## Building and Running the Project

1. Open Terminal.
2. Navigate to the root directory of the project.
3. Run the `make` to build the application:

    ```sh
    make
    ```

4. Then you can open the app:

    ```sh
    make open
    ```

## Structure of the Project

- `main.m`: Contains the main function that initializes the app delegate and starts the application and 
  the app delegate, which is responsible for setting up the window controller and handling application lifecycle events.
- `WindowController.m`: A custom window controller that manages the window and content views.
- `ViewA.m` and `ViewB.m`: Custom views containing text and a button to switch between views.

## License

This project is open-source. Feel free to use and modify the code.

## Contributions

Contributions are welcome! If you have any ideas or improvements, feel free to submit a pull request or create an issue.


