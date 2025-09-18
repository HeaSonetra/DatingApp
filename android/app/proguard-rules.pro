# Flutter specific rules
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
-keep class io.flutter.embedding.** { *; }

# Play Core API (fix for missing classes)
-dontwarn com.google.android.play.core.**
-keep class com.google.android.play.core.** { *; }

# Riverpod specific rules
-keep class * extends com.riverpod.** { *; }
-keepclassmembers class * {
    @riverpod_annotation.riverpod* <methods>;
}

# JSON serialization
-keepattributes Signature
-keepattributes *Annotation*
-keep class * extends com.google.gson.** { *; }
-keep class * implements com.google.gson.** { *; }

# Keep model classes (adjust package name as needed)
-keep class com.khmercouple.dating.** { *; }

# Dio HTTP client
-keep class dio.** { *; }
-keep class retrofit2.** { *; }

# General rules
-dontwarn okhttp3.**
-dontwarn retrofit2.**
-dontwarn javax.annotation.**
-dontwarn org.conscrypt.**
-dontwarn okio.**

# Keep line numbers for debugging stack traces
-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile
