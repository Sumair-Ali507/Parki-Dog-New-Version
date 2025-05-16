# Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }

# Google Maps
-keep class com.google.android.gms.maps.** { *; }
-keep class com.google.maps.api.** { *; }

# Your packages
-keep class com.your.package.** { *; }

# Fix for missing Play Core classes
-keep class com.google.android.play.** { *; }
-dontwarn com.google.android.play.**
