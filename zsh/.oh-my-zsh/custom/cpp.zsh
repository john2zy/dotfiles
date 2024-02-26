unset LDFLAGS
unset CPPFLAGS

export LDFLAGS="-L$(brew --prefix)/lib $LDFLAGS"
export CPPFLAGS="-I$(brew --prefix)/include $CPPFLAGS"

export LDFLAGS="-L$(brew --prefix)/opt/openssl@1.1/lib $LDFLAGS"
export CPPFLAGS="-I$(brew --prefix)/opt/openssl@1.1/include $CPPFLAGS"

