#!/bin/sh
# ----------------------------------------------------------------------------
# Maven Wrapper for Maven 3.8.7
# ----------------------------------------------------------------------------

# Required ENV vars:
# ------------------
#   JAVA_HOME - location of a JDK home dir
# Optional ENV vars:
# -----------------
#   MAVEN_OPTS - parameters passed to the Java VM when running Maven
#   MAVEN_SKIP_RC - flag to disable loading of mavenrc files

# Load system or user mavenrc files if MAVEN_SKIP_RC is not set
if [ -z "$MAVEN_SKIP_RC" ]; then
  [ -f /etc/mavenrc ] && . /etc/mavenrc
  [ -f "$HOME/.mavenrc" ] && . "$HOME/.mavenrc"
fi

# Detect OS
cygwin=false
darwin=false
mingw=false
case "`uname`" in
  CYGWIN*) cygwin=true ;;
  MINGW*) mingw=true ;;
  Darwin*) darwin=true
    if [ -z "$JAVA_HOME" ]; then
      [ -x "/usr/libexec/java_home" ] && export JAVA_HOME="$(/usr/libexec/java_home)" || export JAVA_HOME="/Library/Java/Home"
    fi
    ;;
esac

# Fallback for Gentoo Linux
if [ -z "$JAVA_HOME" ] && [ -r /etc/gentoo-release ]; then
  JAVA_HOME=$(java-config --jre-home)
fi

# Resolve M2_HOME if not set
if [ -z "$M2_HOME" ]; then
  PRG="$0"
  while [ -h "$PRG" ]; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
      PRG="$link"
    else
      PRG="`dirname "$PRG"`/$link"
    fi
  done
  saveddir=`pwd`
  M2_HOME=`dirname "$PRG"`/..
  M2_HOME=`cd "$M2_HOME" && pwd`
  cd "$saveddir"
fi

# Convert paths for Cygwin or MinGW
if $cygwin; then
  [ -n "$M2_HOME" ] && M2_HOME=`cygpath --unix "$M2_HOME"`
  [ -n "$JAVA_HOME" ] && JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
  [ -n "$CLASSPATH" ] && CLASSPATH=`cygpath --path --unix "$CLASSPATH"`
fi
if $mingw; then
  [ -n "$M2_HOME" ] && M2_HOME="`(cd "$M2_HOME"; pwd)`"
  [ -n "$JAVA_HOME" ] && JAVA_HOME="`(cd "$JAVA_HOME"; pwd)`"
fi

# Detect JAVA executable
if [ -z "$JAVACMD" ]; then
  if [ -n "$JAVA_HOME" ]; then
    if [ -x "$JAVA_HOME/jre/sh/java" ]; then
      JAVACMD="$JAVA_HOME/jre/sh/java"
    else
      JAVACMD="$JAVA_HOME/bin/java"
    fi
  else
    JAVACMD="$(which java)"
  fi
fi

if [ ! -x "$JAVACMD" ]; then
  echo "Error: JAVA_HOME is not defined correctly." >&2
  echo "Cannot execute $JAVACMD" >&2
  exit 1
fi

[ -z "$JAVA_HOME" ] && echo "Warning: JAVA_HOME environment variable is not set."

# Function to find project base directory containing .mvn
find_maven_basedir() {
  if [ -z "$1" ]; then
    echo "Path not specified to find_maven_basedir"
    return 1
  fi
  basedir="$1"
  wdir="$1"
  while [ "$wdir" != '/' ]; do
    [ -d "$wdir/.mvn" ] && { basedir=$wdir; break; }
    [ -d "${wdir}" ] && wdir=`cd "$wdir/.."; pwd`
  done
  echo "$basedir"
}

# Concatenate all lines from jvm.config
concat_lines() {
  [ -f "$1" ] && echo "$(tr -s '\n' ' ' < "$1")"
}

BASE_DIR=`find_maven_basedir "$(pwd)"`
[ -z "$BASE_DIR" ] && exit 1

export MAVEN_PROJECTBASEDIR=${MAVEN_BASEDIR:-"$BASE_DIR"}
MAVEN_OPTS="$(concat_lines "$MAVEN_PROJECTBASEDIR/.mvn/jvm.config") $MAVEN_OPTS"

# Wrapper launcher
WRAPPER_LAUNCHER=org.apache.maven.wrapper.MavenWrapperMain
WRAPPER_JAR="$MAVEN_PROJECTBASEDIR/.mvn/wrapper/maven-wrapper.jar"

exec "$JAVACMD" \
  $MAVEN_OPTS \
  -classpath "$WRAPPER_JAR" \
  "-Dmaven.home=${M2_HOME}" "-Dmaven.multiModuleProjectDirectory=${MAVEN_PROJECTBASEDIR}" \
  $WRAPPER_LAUNCHER $MAVEN_CONFIG "$@"
