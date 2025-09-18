import java.util.Properties
import java.io.FileInputStream

val keystorePropsFile = rootProject.file("key.properties")
val keystoreProps = Properties()
if (keystorePropsFile.exists()) {
    keystoreProps.load(FileInputStream(keystorePropsFile))
}
plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.khmercouple.dating"
    compileSdk = 35
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.khmercouple.dating"
        minSdk = flutter.minSdkVersion
        targetSdk = 35
        versionCode = 4
        versionName = "1.0.2"
    }

    signingConfigs {
        create("release") {
            keyAlias = keystoreProps["keyAlias"] as String?
            keyPassword = keystoreProps["keyPassword"] as String?
            storeFile = (keystoreProps["storeFile"] as String?)?.let { file(it) }
            storePassword = keystoreProps["storePassword"] as String?
        }
    }
    
    buildTypes {
        getByName("release") {
            // Only use signing config if keystore file exists
            if (keystoreProps["storeFile"] != null && file(keystoreProps["storeFile"] as String).exists()) {
                signingConfig = signingConfigs.getByName("release")
            }
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
}

flutter {
    source = "../.."
}
