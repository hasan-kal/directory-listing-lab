
# Directory Listing Vulnerability Lab

This is a small Docker-based lab I made to understand a simple cybersecurity issue called **Directory Listing Vulnerability**.

This vulnerability happens when a web server shows all the files inside a folder by mistake.  
If there is a private file inside the folder, anyone can open it directly.

I chose this concept because it is beginner-friendly and easy to demonstrate visually.

---

## What this lab shows

- A web server is running with **directory listing enabled**.
- Anyone who visits the server can see every file in that folder.
- One of the files is a fake sensitive file called **secret-config.txt**.
- The attacker container uses `curl` to list the files and download the secret file.

---

## Containers in this lab

### 1. **web** (nginx)

- Runs an nginx server
- Directory listing (`autoindex`) is intentionally turned **on**
- Contains:
  - `index.html`
  - `notes.txt`
  - `secret-config.txt` (fake secret file)

### 2. **attacker** (alpine + curl)

- Uses `curl` to visit the web server
- Lists all visible files
- Downloads the “secret” file

---

## How to run this lab

1. Install Docker and Docker Compose
2. Go to this folder in your terminal
3. Run:

```
docker-compose up --build
```

4. Open this in your browser:

```
http://localhost:8080
```

You will see the directory listing directly.

5. To see what the attacker script did:

```
docker logs attacker
```

---

## What we learn from this

- Never store secret files in the public web folder
- Disable directory listing unless it is needed (in nginx, turn off `autoindex`)
- Even small configuration mistakes can leak sensitive information

---

## Why this is safe

- Entirely local using Docker
- Fake secret file
- Very basic commands (no dangerous tools)
- For education only

---

## Why I picked this concept

I wanted to create something simple that I can fully understand and clearly explain.  
This concept is easy to show, easy to understand, and teaches an important real-world lesson.

---