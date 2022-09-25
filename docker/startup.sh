#! /usr/bin/env bash
#
# Script to run on container startup
#
# @author Charlie Revett

# Output container name
if command -v go &> /dev/null
then
  echo -e "📦 revett/go:latest\n"
fi
if command -v node &> /dev/null
then
  echo -e "📦 revett/node:latest\n"
fi

# Output Zsh version
echo -e "🛂 checking zsh version..."
echo -e "✅ $(zsh --version)\n"

# Output Go version
if command -v go &> /dev/null
then
  echo -e "🛂 checking go version..."
  echo -e "✅ $(go version)\n"
fi

# Output Node version
if command -v node &> /dev/null
then
  echo -e "🛂 checking node version..."
  echo -e "✅ node $(node --version)\n"
fi

# Check that CONTAINER_PORT is set
echo -e "🛂 checking that \$CONTAINER_PORT is set..."
if [[ -z "${CONTAINER_PORT}" ]]; then
  echo -e '❌ error: "CONTAINER_PORT" environment variable is not set'
  exit 1
fi
echo -e "✅ success: \$CONTAINER_PORT is :$CONTAINER_PORT\n"

echo "🌐 open: http://localhost:$CONTAINER_PORT"
