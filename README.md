# Provide Widget for responsive Layout, Widget, and Text
# The main purpose is about Responsive Text for Tablet, Mobile, and Web.

<!-- ![Tablet Landscape Mode](/flutter_responsive_framework/screenshots/tablet_landscape.png "Tablet Landscape Mode")
![Tablet Portrait Mode](/flutter_responsive_framework/screenshots/tablet_portrait.png "Tablet Portrait Mode"). -->

## Large Screen
<img src="https://github.com/SowatKheang/responsive_framework/blob/master/screenshots/Screenshot%202023-05-15%20at%204.20.37%20PM.png" height="400"> 
<img src="https://github.com/SowatKheang/responsive_framework/blob/master/screenshots/Screenshot%202023-05-15%20at%204.20.21%20PM.png" height="400"> 

<br>

## Medium Screen
<img src="https://github.com/SowatKheang/responsive_framework/blob/master/screenshots/Screenshot%202023-05-15%20at%204.21.32%20PM.png" height="400"> 
<img src="https://github.com/SowatKheang/responsive_framework/blob/master/screenshots/Screenshot%202023-05-15%20at%204.21.37%20PM.png" height="400"> 

<br>

## Small Screen
<img src="https://github.com/SowatKheang/responsive_framework/blob/master/screenshots/Screenshot%202023-05-15%20at%204.22.12%20PM.png" height="400"> 
<img src="https://github.com/SowatKheang/responsive_framework/blob/master/screenshots/Screenshot%202023-05-15%20at%204.22.17%20PM.png" height="400"> 

<br>

## Web Small Screen
<img src="https://github.com/SowatKheang/responsive_framework/blob/master/screenshots/Screenshot%202023-05-15%20at%204.23.09%20PM.png" height="400">

## Web Medium Screen
<img src="https://github.com/SowatKheang/responsive_framework/blob/master/screenshots/Screenshot%202023-05-15%20at%204.23.31%20PM.png" height="400">

## Web Large Screen
<img src="https://github.com/SowatKheang/responsive_framework/blob/master/screenshots/Screenshot%202023-05-15%20at%204.23.49%20PM.png" height="400">

# Installation
### Add flutter_responsive_framework to pubspec.yaml

```yaml
dependencies:
  flutter_responsive_framework: ^0.0.1
```
# Usage

## Import the Package
```dart
import 'package:flutter_responsive_framework/flutter_responsive_framework.dart';
```
## Wrap MaterialApp with ResponsiveUIWidget widget
```dart
ResponsiveUIWidget( 
  builder: (context, orientation, screenType) {
    return MaterialApp(
      home: HomePage(),
    );
  },
);
```

## Widget Size
```dart
Container(
  width: LayoutSizeHelper.h(50), // This will take 50% of the screen's width
  height: 30.h // This will take 30% of the screen's height
)
```

## Font size
```dart
Text('Responsive Framework', style: TextStyle(fontSize: 16.px))
```
or
```dart
Text('Responsive Framework', style: TextStyle(fontSize: FontSizeHelper.NORMAL_TEXT_MEDIUM))
```
### see FontSizeHelper for further detail

## Responsive UI Helper Class provide custom Responsive Widget
```dart
ResponsiveUIHelper.buildTitleTextWidget(titleText);
```
```dart
ResponsiveUIHelper.buildNormalTextWidget(text);
```
```dart
ResponsiveUIHelper.buildPlatformWidget(
    tabletWidget: YourTabletWidget(),
    mobileWidget: YourMobileWidget(),
);
```
```dart
ResponsiveUIHelper.buildPlatformWidgetWithOrientation(
    tabletPortraitWidget: YourTabletPortraitWidget(),
    tabletLandScapetWidget: YourTabletLandScapeWidget(),
    mobilPortraitWidget: YourMobilePortraitWidget(),
    mobilLandScapeWidget: YourMobileLandScapeWidget(),
);
```

# Community Support

If you have any suggestions or issues, feel free to open an [issue](https://github.com/SowatKheang/responsive_framework/issues)

If you would like to contribute, feel free to create a [PR](https://github.com/SowatKheang/responsive_framework/pulls)
