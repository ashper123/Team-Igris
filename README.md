# Nanban Project Board

A modern, responsive project management board built with vanilla HTML, CSS, and JavaScript. Features drag-and-drop task management and AI-powered task generation using Google's Gemini API.

## Features

- **3 columns** — To Do, In Progress, Done
- **Drag & drop** — move cards between columns
- **Add tasks** — inline form per column with title, description, priority & tags
- **AI task generation** — type a title and click "✦ Generate with AI" to auto-fill description and tags using the Gemini API
- **Delete tasks** — hover a card and click ✕
- **Clear done** — one-click button to remove all completed tasks
- **Live stats** — progress bar per column updates in real time
- **Light & Dark modes** — automatically adapts to system preferences
- **Responsive design** — optimized for mobile, tablet, and desktop
- **Accessibility** — WCAG AA compliant with 44px touch targets

## Technology Stack

- **Frontend**: Vanilla HTML, CSS, JavaScript
- **Backend**: Node.js + Express (for secure API handling)
- **AI Engine**: Google Gemini Flash API
- **Design**: Apple HIG + Samsung One UI principles

## Getting Started

### Option 1: Static File (No AI)

1. Simply double-click `index.html` to open in your browser
2. The board works without any setup (AI features won't work)

### Option 2: With AI Features (Recommended)

#### Prerequisites
- Node.js (v14+) installed on your system
- Google Gemini API key (from [console.cloud.google.com](https://console.cloud.google.com))

#### Setup Steps

1. **Install dependencies:**
   ```bash
   npm install
   ```

2. **Configure environment variables:**
   - Edit `.env` file and verify your API key:
   ```
   VITE_GEMINI_API_KEY=your_api_key_here
   VITE_API_ENDPOINT=https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent
   ```

3. **Start the backend server:**
   ```bash
   npm start
   # or for development
   npm run dev
   ```
   The server will run on `http://localhost:3001`

4. **Open in browser:**
   - Open `http://localhost:3001` in your browser
   - The board is ready to use with AI features enabled!

## How to Use

### Adding Tasks

1. Click **"+ Add task"** in any column
2. Enter task title, description, priority, and tags
3. Click **"✦ Generate with AI"** to auto-fill description and tags (optional)
4. Click **"Add task"** to create

### Managing Tasks

- **Drag to move**: Click and drag any task card to a different column
- **Delete task**: Hover over a card and click the ✕ button
- **Clear done**: Click "✓ Clear done" in the header to remove all Done column tasks

### Customization

Edit these variables in `index.html` `<script>` section:

| What | Where |
|------|-------|
| Column names | `const COLS = [...]` array |
| Initial tasks | `let tasks = [...]` array |
| Priority colors | `const PRIORITY_COLORS = {...}` |
| Avatar colors | `const AVATARS = [...]` |

## Security Notes

⚠️ **Important:**

- **Never commit `.env` file** — it contains sensitive API keys
- **Use `.env` only locally** — for production, use environment variable management
- **Backend proxy** — all API calls go through your server, your API key is never exposed to clients
- Add `.env` to `.gitignore` (already included)

## API Configuration

### Using a Different API

To switch to Claude or another API:

1. Update `server.js` with new API endpoint and request format
2. Modify the `generateAI()` function response handling
3. Update `.env` with new credentials

### Example: Adding Claude

```javascript
// In server.js, replace the fetch call with Claude API
const response = await fetch('https://api.anthropic.com/v1/messages', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
    'x-api-key': apiKey,
  },
  body: JSON.stringify({
    model: "claude-3-5-sonnet-20241022",
    max_tokens: 300,
    messages: [{ role: "user", content: title }]
  })
});
```

## Troubleshooting

### "AI generation failed" error

1. Verify server is running: `npm start`
2. Check `.env` file has valid API key
3. Open browser console (F12) for detailed error messages
4. Ensure API key has proper permissions in Google Cloud Console

### CORS errors

- If running without backend, AI features won't work due to browser CORS restrictions
- Always use the backend server (`npm start`) for AI functionality

### Tasks disappearing

- Tasks are stored in browser memory only
- Refresh the page to reload initial tasks from code
- To persist tasks, modify code to use localStorage or a database

## Project Structure

```
vibe2build/
├── index.html          # Main application (UI + logic)
├── server.js           # Backend API proxy
├── .env                # API credentials (git-ignored)
├── .gitignore          # Git ignore rules
├── package.json        # Dependencies
└── README.md           # This file
```

## Browser Support

- Chrome/Edge 90+
- Firefox 88+
- Safari 14+
- Mobile browsers (iOS Safari, Chrome Mobile)

## Light & Dark Mode

The board automatically detects your system preference. You can also toggle it manually in your browser settings:

**macOS/iOS**: System Preferences > General > Appearance
**Windows**: Settings > Personalization > Colors
**Linux**: Environment variable: `GTK_THEME` or DE settings

## License

MIT
