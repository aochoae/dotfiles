
# Java
#
if [ -z "$JAVA_HOME" ] && [ -x "/usr/libexec/java_home" ]; then
    #
    # Apple JDKs
    #
    export JAVA_HOME=`/usr/libexec/java_home -v21`
fi


# cmake
#
export CMAKE_MAKE_PROGRAM=/usr/bin/make
export CMAKE_C_COMPILER=/usr/bin/clang
export CMAKE_CXX_COMPILER=/usr/bin/clang++


# Secrets
#
if [[ -f "$HOME/.env.secrets" ]]; then
    source "$HOME/.env.secrets"
fi
