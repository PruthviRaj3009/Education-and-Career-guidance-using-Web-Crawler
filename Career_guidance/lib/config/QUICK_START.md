# 🚀 Quick Start - API Keys Setup

## New Team Member? Start Here!

### 1️⃣ Create Your API Keys File (30 seconds)

```bash
# Navigate to config directory
cd lib/config

# Copy the sample file
copy api_keys.sample.dart api_keys.dart
```

### 2️⃣ Add Your OpenAI API Key

Open `lib/config/api_keys.dart` and replace:

```dart
static const String openAiApiKey = 'REPLACE_WITH_YOUR_REAL_OPENAI_KEY';
```

**Get your key:** https://platform.openai.com/api-keys

### 3️⃣ Run the App

```bash
flutter run
```

---

## ✅ Verification

```bash
# This should show "ignored by .gitignore"
git status

# api_keys.dart should NOT appear in the list
```

---

## ❓ Common Questions

**Q: I don't have an OpenAI API key. How do I get one?**  
A: Go to https://platform.openai.com → Sign up → API Keys → Create new secret key

**Q: Is `api_keys.dart` committed to git?**  
A: NO! It's automatically ignored. Only `api_keys.sample.dart` is committed.

**Q: Can I add other API keys?**  
A: Yes! See examples in `api_keys.sample.dart` and follow the same pattern.

**Q: What about Firebase keys?**  
A: Firebase keys are in `lib/firebase_options.dart` (separate file, auto-generated).

---

## 🆘 Troubleshooting

**Error: "Cannot find api_keys.dart"**  
→ Solution: Create it from the sample (see step 1 above)

**Error: "Invalid API key"**  
→ Solution: Check you copied the full key (starts with `sk-proj-...`)

**Keys not working?**  
→ Solution: Ensure no extra spaces/quotes when pasting the key

---

## 📚 Need More Help?

See `README.md` in this directory for complete documentation.
