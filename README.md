# Building Quarkus applications in Scala, with Gradle


## Dev mode

```bash
gradle quarkusDev
```

Open [localhost](http://localhost:8080/greetings/hello)

## Native Image build

### Setup GraalVM

```bash
sdk install java 19.2.0.1-grl
sdk use java 19.2.0.1-grl
gu install native-image
export GRAALVM_HOME=~/.sdkman/candidates/java/19.2.0.1-grl/
```

### Build with Gradle

```
gradle buildNative --stacktrace
```

(Don't forget `--stacktrace` to diagnose potential PATH issues or GraalVM version issues)


Current error (Mac OS, GraalVM 19.2.0.1):

```
Undefined symbols for architecture x86_64:
  "_crc32", referenced from:
      ___svm_cglobaldata_base in quarkus-scala-gradle-0.0.1-SNAPSHOT-runner.o
  "_deflate", referenced from:
      ___svm_cglobaldata_base in quarkus-scala-gradle-0.0.1-SNAPSHOT-runner.o
  "_deflateEnd", referenced from:
      ___svm_cglobaldata_base in quarkus-scala-gradle-0.0.1-SNAPSHOT-runner.o
  "_deflateInit2_", referenced from:
      ___svm_cglobaldata_base in quarkus-scala-gradle-0.0.1-SNAPSHOT-runner.o
  "_deflateParams", referenced from:
      ___svm_cglobaldata_base in quarkus-scala-gradle-0.0.1-SNAPSHOT-runner.o
  "_deflateReset", referenced from:
      ___svm_cglobaldata_base in quarkus-scala-gradle-0.0.1-SNAPSHOT-runner.o
  "_inflate", referenced from:
      ___svm_cglobaldata_base in quarkus-scala-gradle-0.0.1-SNAPSHOT-runner.o
  "_inflateEnd", referenced from:
      ___svm_cglobaldata_base in quarkus-scala-gradle-0.0.1-SNAPSHOT-runner.o
  "_inflateInit2_", referenced from:
      ___svm_cglobaldata_base in quarkus-scala-gradle-0.0.1-SNAPSHOT-runner.o
  "_inflateReset", referenced from:
      ___svm_cglobaldata_base in quarkus-scala-gradle-0.0.1-SNAPSHOT-runner.o
ld: symbol(s) not found for architecture x86_64
```
