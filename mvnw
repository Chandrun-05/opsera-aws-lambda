#!/bin/sh
# ----------------------------------------------------------------------------
# Maven Wrapper
# ----------------------------------------------------------------------------

BASEDIR="$(cd "$(dirname "$0")" && pwd)"

# Check for Java
if [ -z "$JAVA_HOME" ]; then
  JAVA_EXE=$(command -v java)
else
  JAVA_EXE="$JAVA_HOME/bin/java"
fi

if [ ! -x "$JAVA_EXE" ]; then
  echo "Error: JAVA_HOME is not set and no 'java' command found in system PATH." >&2
  exit 1
fi

# Define Maven Wrapper settings
MVN_CMD="$BASEDIR/.mvn/wrapper/maven-wrapper.jar"
MVN_PROPERTIES="$BASEDIR/.mvn/wrapper/maven-wrapper.properties"

# Ensure Maven Wrapper JAR exists
if [ ! -f "$MVN_CMD" ]; then
  echo "Maven Wrapper JAR not found. Please run: mvn -N io.takari:maven:wrapper" >&2
  exit 1
fi

# Execute Maven Wrapper
exec "$JAVA_EXE" -jar "$MVN_CMD" "$@"
