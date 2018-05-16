#!/usr/bin/env sh

# The local dev environment overwrites
# the onbuild produced node_modules by
# mounting ./ into /app on the container
if [ "$NPM_INSTALL" ]; then
    npm install
fi

exec "$@"