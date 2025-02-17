#!/bin/sh
# ----------------------------------------------------------------------------
# Apache Maven Wrapper startup script for *nix
# ----------------------------------------------------------------------------

MVN_WRAPPER_VERSION="3.1.0"

if [ -z "$MVNW_REPOURL" ]; then
  MVNW_REPOURL="https://repo.maven.apache.org/maven2"
fi

if [ -z "$MVNW_VERBOSE" ]; then
  MVNW_VERBOSE="false"
fi

if [ "$MVNW_VERBOSE" = "true" ]; then
  set -x
fi

BASE_DIR=$(dirname "$0")

# Determine the Maven Wrapper's location
WRAPPER_DIR="${BASE_DIR}/.mvn/wrapper"
WRAPPER_JAR="${WRAPPER_DIR}/maven-wrapper.jar"
WRAPPER_PROPERTIES="${WRAPPER_DIR}/maven-wrapper.properties"

# Determine Java executable
if [ -n "$JAVA_HOME" ]; then
  JAVA_EXEC="$JAVA_HOME/bin/java"
else
  JAVA_EXEC="java"
fi

if ! command -v "$JAVA_EXEC" >/dev/null 2>&1; then
  echo "Error: Java executable not found in JAVA_HOME or system path." >&2
  exit 1
fi

# Verify the existence of the Maven Wrapper JAR
if [ ! -f "$WRAPPER_JAR" ]; then
  echo "Error: Maven Wrapper JAR not found. Please run 'mvn -N io.takari:maven:wrapper' to generate the wrapper files." >&2
  exit 1
fi

# Run the Maven Wrapper
exec "$JAVA_EXEC" -jar "$WRAPPER_JAR" "$@"
