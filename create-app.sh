#!/bin/bash
set -e

# Strip any leading dashes (pnpm passes args as --my-app)
APP_NAME="${1#--}"
APP_NAME="${APP_NAME:-my-app}"

echo "Creating: $APP_NAME (React + TypeScript + Tailwind CSS v4)"

# Scaffold with Vite — pipe "n" to skip the "Install and start now?" prompt
printf 'n\n' | pnpm create vite "$APP_NAME" --template react-ts

cd "$APP_NAME"

# Install dependencies after we've patched the files
pnpm install

# Inject Tailwind CDN into index.html (no config or npm package needed)
python3 -c "
content = open('index.html').read()
content = content.replace('</title>', '</title>\n    <script src=\"https://cdn.tailwindcss.com\"></script>')
open('index.html', 'w').write(content)
"

# Clear out default Vite CSS
echo '' > src/index.css

# Minimal App with project name and Tailwind card layout
cat > src/App.tsx << APPEOF
function App() {
  return (
    <div className="min-h-screen bg-gray-100 flex items-center justify-center">
      <div className="bg-white rounded-2xl shadow-md p-10 text-center">
        <h1 className="text-3xl font-bold text-gray-800 mb-2">$APP_NAME</h1>
        <p className="text-gray-500">Get started by editing src/App.tsx</p>
      </div>
    </div>
  )
}

export default App
APPEOF

# Remove unused boilerplate
rm -f src/App.css src/assets/react.svg

echo ""
echo "Done! Starting $APP_NAME..."
echo ""

pnpm dev
