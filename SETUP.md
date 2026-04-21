# Setup Guide - Quick Start

## ⚡ Quick Setup (3 steps)

### Step 1: Install Dependencies
```bash
npm install
```

### Step 2: Verify .env Configuration
The `.env` file already contains your API key. Verify it's correct:
```
VITE_GEMINI_API_KEY=AIzaSyAqzuoJNGjQ4UE8YUC6FHiHlkWrt9oCzdQ
VITE_API_ENDPOINT=https://generativelanguage.googleapis.com/v1beta/models/gemini-flash-latest:generateContent
```

### Step 3: Start the Server
```bash
npm start
```

Then open: **http://localhost:3001**

---

## 🔒 Security Checklist

✅ **Before deploying to production:**

- [ ] Move API key to environment variables (not .env file)
- [ ] Never commit `.env` to Git (already in .gitignore)
- [ ] Use environment-specific configuration
- [ ] Implement rate limiting in `server.js`
- [ ] Add authentication/authorization
- [ ] Use HTTPS only
- [ ] Add request validation
- [ ] Monitor API usage

---

## 🐛 Troubleshooting

### Server won't start
```bash
# Check Node.js version
node --version  # Should be v14+

# Clear cache and reinstall
rm -rf node_modules package-lock.json
npm install
npm start
```

### AI generation fails
1. Check console: Press `F12` → Console tab
2. Verify `.env` file has API key
3. Restart server: `Ctrl+C` then `npm start`
4. Check Gemini API quota in Google Cloud Console

### Tasks disappear after refresh
- Tasks are stored in browser memory only
- To persist, implement localStorage or database (see README)

---

## 📋 Project Files

- **index.html** — UI & frontend logic
- **server.js** — Backend API proxy
- **.env** — API credentials (⚠️ keep secret)
- **package.json** — Dependencies
- **.gitignore** — Files to exclude from Git
- **README.md** — Full documentation

---

## 🚀 Next Steps

1. Customize column names in `index.html`
2. Add persistent storage (localStorage/database)
3. Deploy to production with proper environment setup
4. Implement user authentication
5. Add more features (filters, search, recurring tasks, etc.)

Happy building! 🎉
