import com.google.protobuf.gradle.*
import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
    kotlin("jvm") version "1.5.10"
    application
    id("java")
    id("com.google.protobuf") version "0.8.18"
}

buildscript {
    repositories {
        mavenCentral()
    }
    dependencies {
        classpath("com.google.protobuf:protobuf-gradle-plugin:0.8.18")
    }
}

group = "me.iliyan"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    implementation("io.grpc:grpc-protobuf:1.42.1")
    implementation("io.grpc:grpc-netty-shaded:1.42.1")
    implementation("io.grpc:grpc-stub:1.42.1")
    // https://mvnrepository.com/artifact/javax.annotation/javax.annotation-api
    //Resolves @javax.annotation.Generated missing
    implementation("javax.annotation:javax.annotation-api:1.3.2")
    implementation("org.jetbrains.xodus:xodus-environment:1.3.232")

    //Fix logging errors
    val slf4jVersion = "1.7.32"
    // https://mvnrepository.com/artifact/org.slf4j/slf4j-api
    implementation("org.slf4j:slf4j-api:$slf4jVersion")
    // https://mvnrepository.com/artifact/org.slf4j/slf4j-simple
    implementation("org.slf4j:slf4j-simple:$slf4jVersion")
    //----------------------------------------


    testImplementation(kotlin("test"))
}

protobuf {
    generatedFilesBaseDir = "$projectDir/src/main/kotlin/proto"

    protoc {
        artifact = "com.google.protobuf:protoc:3.7.1"
    }
    plugins {
        id("grpc") {
            artifact = "io.grpc:protoc-gen-grpc-java:1.22.1"
        }
    }
    generateProtoTasks {
        ofSourceSet("main").forEach {
            it.plugins {
                // Apply the "grpc" plugin whose spec is defined above, without options.
                id("grpc")
            }
        }
    }
}

tasks.test {
    useJUnitPlatform()
}

tasks.withType<KotlinCompile> {
    kotlinOptions.jvmTarget = "1.8"
}

application {
    mainClass.set("MainKt")
}