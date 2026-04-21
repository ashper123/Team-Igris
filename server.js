// server.js - Backend proxy for Gemini API
// Install dependencies first: npm install express cors body-parser dotenv

import express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';
import dotenv from 'dotenv';
import fetch from 'node-fetch';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3001;

app.use(cors());
app.use(bodyParser.json());

// Serve static files
app.use(express.static('.'));

// API endpoint for AI generation
app.post('/api/generate-ai', async (req, res) => {
  try {
    const { title } = req.body;

    if (!title || !title.trim()) {
      return res.status(400).json({ error: 'Title is required' });
    }

    const apiKey = process.env.VITE_GEMINI_API_KEY;
    const apiEndpoint = process.env.VITE_API_ENDPOINT;

    if (!apiKey || !apiEndpoint) {
      return res.status(500).json({ error: 'API configuration missing' });
    }

    const response = await fetch(apiEndpoint, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-goog-api-key': apiKey,
      },
      body: JSON.stringify({
        contents: [
          {
            parts: [
              {
                text: `You are a project management assistant. For the software project task titled "${title}", write a concise 2-sentence description and suggest 2-3 relevant lowercase tags. Respond ONLY with valid JSON, no markdown or extra text: {"description":"...","tags":["...","..."]}`,
              },
            ],
          },
        ],
      }),
    });

    if (!response.ok) {
      const error = await response.text();
      console.error('Gemini API error:', error);
      return res.status(response.status).json({ error: 'Failed to generate content' });
    }

    const data = await response.json();

    // Extract text from Gemini response
    if (!data.candidates || !data.candidates[0] || !data.candidates[0].content) {
      return res.status(500).json({ error: 'Invalid API response' });
    }

    const text = data.candidates[0].content.parts[0].text;
    const parsed = JSON.parse(text);

    res.json({
      description: parsed.description || '',
      tags: parsed.tags || [],
    });
  } catch (error) {
    console.error('Server error:', error);
    res.status(500).json({ error: error.message });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
