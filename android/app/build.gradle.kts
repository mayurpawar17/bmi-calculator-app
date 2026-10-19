import java.io.FileInputStream
import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Load the private release-signing settings from android/key.properties.
// The file is optional for local builds; do not commit it or the keystore.
val keystoreProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    FileInputStream(keystorePropertiesFile).use(keystoreProperties::load)
}

// Require either all signing values or none: a partial configuration is likely
// a mistake and should fail instead of silently producing an unusable release.
val releaseSigningKeys = listOf("keyAlias", "keyPassword", "storeFile", "storePassword")
val missingReleaseSigningKeys = releaseSigningKeys.filter {
    keystoreProperties.getProperty(it).isNullOrBlank()
}
if (missingReleaseSigningKeys.size < releaseSigningKeys.size && missingReleaseSigningKeys.isNotEmpty()) {
    throw GradleException(
        "Incomplete Android release signing configuration in android/key.properties. " +
            "Missing: ${missingReleaseSigningKeys.joinToString()}",
    )
}
val hasReleaseSigningKeys = missingReleaseSigningKeys.isEmpty()

android {
    // Android/Flutter build settings for this app module.
    namespace = "com.example.bmi_calculator_app"
    compileSdk = 36
    ndkVersion = flutter.ndkVersion

    // Compile Android and Kotlin code against Java 17.
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // App identity and version values packaged into Android builds.
        applicationId = "com.devmayur.bmi_fitindex_pro"
        minSdk = flutter.minSdkVersion
        targetSdk = 36
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    // Define the release signing configuration only when all required
    // properties are available.
    signingConfigs {
        if (hasReleaseSigningKeys) {
            create("release") {
                keyAlias = keystoreProperties.getProperty("keyAlias")
                keyPassword = keystoreProperties.getProperty("keyPassword")
                storeFile = file(keystoreProperties.getProperty("storeFile"))
                storePassword = keystoreProperties.getProperty("storePassword")
            }
        }
    }

    // Use the private upload key for releases when configured. Without signing
    // properties, use the debug key so local release builds remain possible.
    buildTypes {
        release {
            signingConfig = signingConfigs.getByName(
                if (hasReleaseSigningKeys) "release" else "debug",
            )
        }
    }
}

flutter {
    // Flutter project root, relative to the android/ directory.
    source = "../.."
}
