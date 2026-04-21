#!/bin/bash

# Test Script for Project Board Setup
# Run this to verify everything is working correctly

echo "🔍 Project Board Setup Verification"
echo "===================================="
echo ""

# Check Node.js
echo "1️⃣  Checking Node.js..."
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    echo "   ✅ Node.js found: $NODE_VERSION"
else
    echo "   ❌ Node.js not found. Install from https://nodejs.org"
    exit 1
fi

# Check npm
echo ""
echo "2️⃣  Checking npm..."
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm --version)
    echo "   ✅ npm found: $NPM_VERSION"
else
    echo "   ❌ npm not found"
    exit 1
fi

# Check .env file
echo ""
echo "3️⃣  Checking .env file..."
if [ -f ".env" ]; then
    echo "   ✅ .env file exists"
    if grep -q "VITE_GEMINI_API_KEY" .env; then
        echo "   ✅ API key configured"
    else
        echo "   ⚠️  API key not found in .env"
    fi
else
    echo "   ❌ .env file not found"
fi

# Check package.json
echo ""
echo "4️⃣  Checking package.json..."
if [ -f "package.json" ]; then
    echo "   ✅ package.json found"
else
    echo "   ❌ package.json not found"
    exit 1
fi

# Check server.js
echo ""
echo "5️⃣  Checking server.js..."
if [ -f "server.js" ]; then
    echo "   ✅ server.js found"
else
    echo "   ❌ server.js not found"
    exit 1
fi

# Check index.html
echo ""
echo "6️⃣  Checking index.html..."
if [ -f "index.html" ]; then
    echo "   ✅ index.html found"
else
    echo "   ❌ index.html not found"
    exit 1
fi

# Suggest next steps
echo ""
echo "===================================="
echo "✨ All files verified!"
echo ""
echo "📝 Next steps:"
echo "   1. npm install"
echo "   2. npm start"
echo "   3. Open http://localhost:3001 in your browser"
echo ""
