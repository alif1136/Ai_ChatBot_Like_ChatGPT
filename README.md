# 🤖 Flutter Chatbot App

A modern and minimal chatbot application built with **Flutter**, featuring a clean UI and real-time interaction with an LLM API.

---

## ✨ Features

* 💬 Clean and minimal chat UI
* 👤 User messages aligned to the right
* 🤖 AI responses aligned to the left
* ⌨️ Input field with send button
* ⏳ Typing/loading indicator
* 📜 Scrollable chat history
* ⚡ Real-time API communication
* ⚠️ Error handling (no internet, timeout, API failure)

---

## 🏗️ Architecture

The app follows a simple and maintainable structure:

* **Model:** Message model (role, text, timestamp)
* **View:** Chat UI with message bubbles
* **Logic:** API handling and state updates

---

## 📱 ScreenShots

<img width="587" height="584" alt="image" src="https://github.com/user-attachments/assets/5a9b549c-a244-4da7-b8ba-3a79911f9ca3" />


## 🧠 How It Works

1. User types a message and presses **Send**
2. The app sends an HTTP request to the LLM API
3. The request includes:

   * User prompt
   * (Optional) previous messages for context
4. API returns a response
5. The response is displayed instantly as a chatbot message

---

## 📦 Message Model

Each message contains:

```dart
class Message {
  final String role; // 'user' or 'assistant'
  final String text;
  final DateTime timestamp;

  Message({
    required this.role,
    required this.text,
    required this.timestamp,
  });
}
```

---

## 🌐 API Configuration

```
Base URL: https://api.durjoyai.com
Model: durjoy-kotha-1
```

### Example Request

```json
{
  "model": "durjoy-kotha-1",
  "messages": [
    {"role": "user", "content": "Hello!"}
  ]
}
```

---

## 🔐 API Key Setup

⚠️ **Important:** Never expose your API key in public repositories.

Replace your API key in code:

```dart
const String apiKey = "YOUR_API_KEY_HERE";
```

For better security, use:

* `.env` file
* Flutter secure storage

---

## 📱 UI Overview

* Chat bubbles for messages
* Smooth scrolling message list
* Loading indicator while waiting for response
* Clean Material Design layout

---

## ⚠️ Error Handling

The app handles:

* ❌ No internet connection
* ⏱️ Request timeout
* 🔴 API errors

Users see a friendly error message instead of crashes.

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

---

## 🛠️ Tech Stack

* **Flutter**
* **Dart**
* **HTTP package**
* **Material UI**

---

## 📌 Future Improvements

* ✅ Chat history persistence
* 🎙️ Voice input support
* 🌙 Dark mode
* 🔔 Notifications
* 🧠 Better context memory

---

## 📄 License

This project is open-source and available under the MIT License.

---

## 👨‍💻 Author

Developed by **Your Name**

---

⭐ If you like this project, don't forget to star the repo!
