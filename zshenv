
if [ -z "$JAVA_HOME" ] && [ -x "/usr/libexec/java_home" ]; then
    #
    # Apple JDKs
    #
    export JAVA_HOME=`/usr/libexec/java_home -v17`
fi

