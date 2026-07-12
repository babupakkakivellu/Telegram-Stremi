---
title: Telegram Stremio
emoji: 🎬
colorFrom: blue
colorTo: purple
sdk: docker
app_port: 8000
pinned: false
---

<p align="center">
  <img src="https://iili.io/KhN0ztj.png" alt="Logo" width="400"/>
</p>

<p align="center">
  A powerful, self-hosted <b>Telegram Stremio Media Server</b> built with <b>FastAPI</b>, <b>MongoDB</b>, and <b>PyroFork</b> — turn your Telegram channels into a private streaming library you watch in <b>Stremio</b> / <b>Nuvio</b>.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/UV%20Package%20Manager-2B7A77?logo=uv&logoColor=white" alt="UV Package Manager" />
  <img src="https://img.shields.io/badge/Python-3776AB?logo=python&logoColor=white" alt="Python" />
  <img src="https://img.shields.io/badge/FastAPI-009688?logo=fastapi&logoColor=white" alt="FastAPI" />
  <img src="https://img.shields.io/badge/MongoDB-47A248?logo=mongodb&logoColor=white" alt="MongoDB" />
  <img src="https://img.shields.io/badge/PyroFork-EE3A3A?logo=python&logoColor=white" alt="PyroFork" />
  <img src="https://img.shields.io/badge/Stremio-8D3DAF?logo=stremio&logoColor=white" alt="Stremio" />
  <img src="https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white" alt="Docker" />
</p>

---

## 🧭 Contents

* [🚀 What is this?](#-what-is-this)
* [✨ Key Features](#-key-features)
* [🗂️ Organizing Your Channels](#️-organizing-your-channels-recommended)
* [📤 Adding Files by Forwarding (filename rules)](#-adding-files-by-forwarding-filename-rules)
  * [🎥 Movies](#-movies)
  * [📺 TV Shows](#-tv-shows)
  * [🧩 Split Files (`.001`, `.002` …)](#-split-files-001-002-)
  * [🎞️ Combined / Season-Pack Files](#️-combined--season-pack-files)
* [🖐️ Adding Files Manually (Goa trip, lectures, One Piece)](#️-adding-files-manually-goa-trip-lectures-one-piece)
* [📚 Catalogs Explained](#-catalogs-explained)
  * [🤖 Auto Catalogs](#-auto-catalogs)
  * [🎯 Custom Catalogs](#-custom-catalogs)
  * [🔒 Private, Exclusive & Searchable](#-private-exclusive--searchable)
* [📡 Special Channels](#-special-channels)
  * [🌀 Anime Channel](#-anime-channel)
  * [🔍 Global Search](#-global-search)
  * [📢 Announcement Channel](#-announcement-channel)
* [🏷️ Fixing Wrong Metadata](#️-fixing-wrong-metadata)
* [🛠️ Managing Your Server (logs, restart, update)](#️-managing-your-server-logs-restart-update)
* [💳 Subscriptions & Access](#-subscriptions--access)
* [🔧 First-Time Setup (config.env)](#-first-time-setup-configenv)
* [🎛️ Web Settings Page (every option explained)](#️-web-settings-page-every-option-explained)
* [🚀 Deployment](#-deployment)
  * [🐙 Heroku](#-heroku-guide)
  * [🐳 VPS (recommended)](#-vps-guide-recommended)
  * [🤗 Hugging Face](#-hugging-face-guide-free-always-online-no-vps)
* [📺 Watch in Nuvio / Stremio](#-watch-in-nuvio--stremio)
* [🏅 Contributors](#-contributors)

---

# 🚀 What is this?

This is a **self-hosted media server** that streams your **Telegram files** straight into **Stremio** (or **Nuvio**). You forward a movie/episode to your channel, and it instantly becomes a permanent, no-expiry streaming link — with posters, descriptions, seasons and episodes, just like a real streaming app.

Everything is managed from a friendly **web panel** — no coding, and almost no bot commands.

---

## ✨ Key Features

- ⚡ **Ultra-fast, permanent streaming links** (no expiry)
- 🎬 **Automatic posters & details** from IMDb / TMDb
- 📚 **Auto & custom catalogs** (organize by language, platform, or your own lists)
- 🔐 **Private / exclusive catalogs** for premium content
- 💳 **Subscriptions & access control** built in
- 🧩 **Split-file & multi-part playback** as one stream
- 🌀 **Anime-aware** metadata for anime channels
- 🔍 **Global Search** across extra channels
- 📢 **New-content announcements** to a channel
- 🖥️ **Full web configuration panel** — no restarts for most changes
- 🗄️ **Multiple databases & bot tokens** for scale and speed

---

# 🗂️ Organizing Your Channels (recommended)

You *can* dump everything into one AUTH channel — but keeping content in **separate channels** makes your library far easier to manage, back up, and share with helpers. Each of these is added the same way (as an AUTH channel in Settings), and your bot must be an **admin** in every one.

A clean layout many people use:

| Channel | What goes in it | Note |
| :--- | :--- | :--- |
| 🎬 **Movies** | Single movies | — |
| 📺 **TV Shows** | Regular series episodes | — |
| 🌀 **Anime** | Anime episodes & movies | ✅ tick the **Anime** box on this channel |
| 🇰🇷 **K-Drama** | Korean dramas | — |
| 🎞️ **Combined TV** | Season-pack / multi-episode files (e.g. `S01 E01-E13`) | — |
| 🎞️ **Combined Anime** | Anime batches (e.g. `E01-E24`) | ✅ tick **Anime** |
| 🧩 **Split Movies** | Big movies split into `.001/.002` parts | — |
| 🧩 **Split TV** | Big episodes split into parts | — |
| 📁 **Manual** | Personal / hand-added files | set as your **Manual** channel (not Auth) |
| 📢 **Announcements** | Auto "new content" posts | set as your **Announcement** channel |

> 💡 This is just an organizing habit — the app reads each **file's name** to sort it into the right catalog no matter which channel it came from. Separate channels simply keep *your* side tidy. Remember: a channel should have only **one role** (Auth / Manual / Announcement / Global Search); marking an Auth channel as **Anime** is just a checkbox.

---

# 📤 Adding Files by Forwarding (filename rules)

The easiest way to add content: **forward the file to your AUTH channel** (the channel you set in Settings, where your bot is an admin). The server reads the **file name or caption** to figure out the title, year, season/episode, and quality — then fetches the poster and details automatically.

> 👉 The better your filename/caption, the better the match. Below is exactly what's supported, with real examples.

## 🎥 Movies

A movie name should contain the **title**, **year**, and **quality**.

**✅ Good examples**
```
Ghosted 2023 720p WEBRip Hindi x265 HEVC.mkv
Oppenheimer.2023.1080p.BluRay.x264.mkv
3 Idiots (2009) 2160p 4K HEVC.mkv
```

| Part | Example | Needed? |
| :--- | :--- | :---: |
| Title | `Ghosted` | ✅ |
| Year | `2023` | ✅ |
| Quality | `720p` / `1080p` / `2160p` | ✅ |
| Extra (codec, audio, source) | `WEBRip`, `x265`, `Hindi` | optional |

## 📺 TV Shows

A TV file should contain the **title**, **season + episode** (`S01E04` style), and **quality**.

**✅ Good examples**
```
Harikatha Sambhavami Yuge Yuge S01E04 1080p WEB-DL.mkv
Loki.S02E03.720p.HEVC.mkv
Panchayat S03E05 Hindi 1080p.mkv
```

| Part | Example | Needed? |
| :--- | :--- | :---: |
| Title | `Loki` | ✅ |
| Season | `S02` | ✅ |
| Episode | `E03` | ✅ |
| Quality | `720p` | ✅ |

> 💡 Files that only have an **episode number and no season** (e.g. anime like `One Piece - 1142 (1080p).mkv`) can't be auto-forwarded — use the **[Manual Upload Session](#️-adding-files-manually-goa-trip-lectures-one-piece)** with a fallback season.

## 🧩 Split Files (`.001`, `.002` …)

Big files that were split into numbered volumes are supported and are **joined back into a single stream** automatically.

**✅ Supported format:** `filename.ext.NN`
```
Avatar.2009.2160p.BluRay.mkv.001
Avatar.2009.2160p.BluRay.mkv.002
Avatar.2009.2160p.BluRay.mkv.003
```
Forward **all parts** to the channel — they play as one file, in order.

**❓ Why only the `.001 / .002` style?**
Those numbered volumes are **true byte-splits of one single video** (like what `split`, 7-Zip, or WinRAR create). They *must* be re-joined to play, so the server treats them as one stream.
Files named like `... Part 1.mkv`, `... CD1.mkv`, `... Disc2.mkv` are **skipped from joining** on purpose — those are usually **separate, standalone videos**, not pieces of one file, so merging them would break playback.

## 🎞️ Combined / Season-Pack Files

One file that contains **multiple episodes** (or a whole season) is detected too, and filed neatly under a **"Season N Combined"** entry.

**✅ Supported examples**
```
One Piece S01 E01-E13 1080p.mkv        →  Season 1, Episodes 1–13
Naruto.S02.E14-26.Combined.720p.mkv    →  Season 2, combined batch
Friends S03 1080p.mkv                  →  whole Season 3 (no episode number)
```
Recognized range separators: `-`, `–`, `~`, `+`, `&`, `,`, `to` (e.g. `E01-E04`, `E01 to E04`).

---

# 🖐️ Adding Files Manually (Goa trip, lectures, One Piece)

Use manual adding for **personal videos** (that TMDb doesn't know) or for **special cases** like anime with no season number. There are two tools:

- **Add Content** → on the **Media Management** page → to *create* a title + add its first file.
- **Manual Upload Session** → on the **Tools** page → to *bulk-add* many files to a title that already exists (just forward the files, they attach automatically).

> ⚙️ First make sure a **Manual Channel** is set in **Settings** and your bot is admin there. Personal files must be forwarded **only** to the Manual Channel.

### 🏖️ Case A — A Goa trip video (personal)

**Single clip → add as a Movie**
1. **Media Management → Add Content** → Type = **Movie**.
2. Skip the search box. Enter **Title** (e.g. `Goa Trip 2024`). Everything else is optional.
3. Paste the Telegram link → **Resolve** → pick **Quality** → **Add Content**. ✅

**Many clips (Day 1, Day 2…) → add as a TV Show**, then bulk-add the rest with a session (see Case B).

### 🧪 Case B — Biochemistry lectures (personal series, many files)

**Step 1 — Create the show once:**
1. **Add Content** → Type = **TV Show**, Title = `Biochemistry Lectures`, Season = `1`, Episode = `1`.
2. Paste lecture 1's link → **Resolve** → **Add Content**.

**Step 2 — Bulk-add the rest:**
1. **Tools → Manual Upload Session** → search `Biochemistry Lectures` → select it.
2. It's **personal + TV**, so set **Season = 1**, leave **Episode empty** (each file becomes the next episode: E2, E3, E4…). Quality is optional.
3. **Start session** → forward all the lecture videos to your **Manual Channel** → **End session**. ✅

> 💡 Want multiple *qualities* of the same lecture? Set **Episode = 5** so every file attaches to Episode 5 instead of creating new episodes.

### 🏴‍☠️ Case C — One Piece with no season (`One Piece - 1142 (1080p).mkv`)

One Piece **is** a real TMDb show, but the file has an episode number and **no season**.
1. Make sure One Piece exists in your library (add it once via **Add Content**, using the search box to auto-fill its details).
2. **Tools → Manual Upload Session** → search `One Piece` → select it.
3. Because it's a real title, set the **Fallback season = 1**. *(The episode `1142` is read from the filename; the fallback fills the missing season → stored as S01E1142.)*
4. **Start session** → forward all the `One Piece - #### (1080p).mkv` files (to your **auth or manual** channel) → **End session**. ✅

### Quick reference

| Content | How to add | Season/Episode | Channel |
| :--- | :--- | :--- | :--- |
| Goa trip (single) | Add Content → Movie | not needed | Manual only |
| Lectures / trip (many) | Session (personal TV) | Season required, Episode optional | Manual only |
| One Piece (no season) | Session (real TV) | **Fallback season** only | Auth or Manual |
| Normal `S01E05` files | just forward | auto-detected | Auth |

---

# 📚 Catalogs Explained

A **catalog** is a shelf of titles that appears in Stremio. There are two kinds: **Auto** (the app builds them) and **Custom** (you build them). Manage both on the **Catalogs** page (`/catalogs`).

## 🤖 Auto Catalogs

The server can automatically sort your whole library into ready-made shelves — **you just tick which ones you want**. It decides where each title belongs using its TMDb details (original language + streaming platform).

Available auto catalogs:

| Group | Catalogs |
| :--- | :--- |
| **Language** | Bollywood, Hollywood, Anime, K-Drama, Bengali, South Indian, Tamil, Telugu, Malayalam, Kannada, Japanese, Korean |
| **OTT Platform** | Netflix, Prime Video, Hotstar, Apple TV, Hulu, HBO, JioCinema, ZEE5, SonyLIV, MX Player, Crunchyroll |
| **Smart** | Top Rated, Recently Added |

- Enable/disable them on the **Catalogs** page.
- They **update automatically** as you add new content; you can also press **Sync** to rebuild them.

## 🎯 Custom Catalogs

Your own hand-picked shelves — e.g. `My Exclusives`, `Hindi Dubbed`, `Kids`.

**Create one:**
1. Go to **Catalogs** → **Create Catalog**.
2. Give it a **name** and choose **who can see it** (visibility — see below).

**Put titles in it (any of these):**
- On the **Catalogs** page → open the catalog → **search** a title → add it.
- On a title's **Edit** page (Media Management → Edit) → *Custom Catalog* → choose the catalog → **Add to Catalog**.
- While using **Add Content** (Manual Add), tick the catalog in the *Add to Custom Catalog* list.

## 🔒 Private, Exclusive & Searchable

When you create or edit a custom catalog you get three controls:

**1) Who can see it (Visibility)**

| Option | Meaning |
| :--- | :--- |
| **Everyone (Public)** | Shows in Stremio for all users. |
| **Specific users** | Only the users/tokens you pick can see it. |
| **Owner only (Private / Hidden)** | Hidden from the public catalog — only you manage it. This is how you make a catalog **private**. |

**2) Exclusive** 🔐
Turning **Exclusive** on **locks** its titles to *this catalog only* — they're removed from every other catalog (auto and custom) and won't reappear elsewhere. Perfect for premium/members-only content you don't want leaking into public shelves.
> Exclusive is only available when visibility is **Specific users** or **Owner only** (it wouldn't make sense on a public shelf).

**3) Searchable** 🔎
For an **exclusive** catalog you can decide whether its titles show up in **Stremio search**:
- **Off** → truly hidden: the title can only be reached through this catalog.
- **On** → discoverable: allowed users can also find it via search.

> **How to make a catalog private + exclusive:** create/edit it → set visibility to **Owner only** (or **Specific users**) → toggle **Exclusive** on → optionally turn **Searchable** on. Save.

---

# 📡 Special Channels

All of these are configured on the **Settings** page. Your bot must be an **admin** in every channel you use. ⚠️ A channel should have **only one role** — don't use the same channel as Auth, Manual, Global Search *and* Announcement at once. (Marking an Auth channel as **Anime** is just a checkbox on that same channel, so that's perfectly fine.)

## 🌀 Anime Channel

Anime often needs special handling (correct titles, posters and episode numbers). The server can treat one of your channels as an **anime channel** and use **anime-aware matching** for files posted there.

**How to use:**
1. Add the channel to **AUTH_CHANNELS** in Settings (so its files get indexed).
2. Right next to that channel there's an **Anime** checkbox — just **tick it**. ✅ That's the whole setup.
3. Forward your anime files there as usual — they'll now be matched using anime metadata.

> ℹ️ The **Anime** tick simply flags an existing auth channel as anime — you don't add it to any separate field.

## 🔍 Global Search

Normally Stremio only searches titles already in your library. **Global Search** lets it also search **live inside extra Telegram channels** that you haven't indexed — great for pulling in results on demand.

**Requirements:** a `USER_SESSION_STRING` in `config.env` (a userbot login) + **one app restart** to unlock the feature.

**How to use:**
1. Add `USER_SESSION_STRING` in `config.env` (see [setup](#-first-time-setup-configenv)) and restart once.
2. In **Settings**, enable the **Global Search** toggle.
3. Add the **channel IDs** you want it to search.
4. Now when a user searches in Stremio and the title isn't in your local catalog, matching results from those channels appear — tagged **🌐 GLOBAL**.

## 📢 Announcement Channel

Automatically post a message whenever **new content is added**, so your members/subscribers always know what's fresh.

**How to use:**
1. In **Settings**, turn on **Announce New Content**.
2. Set the **Announcement Channel** (ID or `@username`) and add your bot as admin there.
3. From then on, every newly indexed movie/episode gets announced to that channel.

---

# 🏷️ Fixing Wrong Metadata

If a title gets matched incorrectly (wrong poster/name) or has no details, fix it in seconds:

**Method 1 — Paste the correct link in the caption**
1. Copy the correct **IMDb** or **TMDb** link of the title.
2. **Edit the file's caption** in your AUTH channel and paste the link anywhere in it.
3. The server re-matches it automatically using that link.

**Method 2 — Fix it from the web panel**
1. Open the title in **Media Management** → **Edit**.
2. Click **Scan / Rescan Metadata**, search the correct title, pick the right result, and apply.

✅ The catalog and posters refresh instantly.

---

# 🛠️ Managing Your Server (logs, restart, update)

Everything here is on the **Settings** page (`/admin/settings`) — no terminal needed.

### 📜 Get the logs
- **Settings → Logs** → click **Refresh** to view the latest log lines in the browser.
- Click **Download** to save the full `log.txt` (handy when reporting an issue).

### 🔄 Restart the server
- **Settings → Restart App** → click the **Restart** button.
- The panel goes offline for a few seconds and **reconnects automatically** when it's back.

### 🆙 Update to the latest code
- The **same Restart button also updates**: it pulls the newest code from the **Upstream Repo / Branch** you set in Settings, then restarts.
- So to update: make sure *Upstream Repo* = `https://github.com/weebzone/Telegram-Stremio` (and branch, e.g. `master`) in Settings → click **Restart**. Done. 🎉

### ⚙️ Everything else
All other options — TMDB key, Base URL, channels, subscriptions, proxy, extra databases, multi-token bots, replace mode, hide catalog, etc. — live on the **Settings** page and apply **instantly, without a restart** (the only value that needs a restart is `USER_SESSION_STRING`, because it lives in `config.env`).

---

# 💳 Subscriptions & Access

Turn your server into a paid service. When **Subscription** is enabled in Settings, users must have an active plan to stream.

**Plans** — create/edit them under **Admin → Subscription Management** (name, days, price). Stored in the database, editable anytime.

**Payment flow (via your bot):**
```
User → /start → picks a plan → sends payment screenshot
     → an Approver gets a notification → Approve / Reject
     → On Approve: subscription saved, a Stremio token is auto-created,
       and the user gets their install link + group invite
```

**Access Management** (`Admin → Access Management`) lets you:

| Action | What it does |
| :--- | :--- |
| 📅 Assign | Give or extend a plan (adds days) |
| ➕ Extend / ➖ Reduce | Add or remove days |
| 🚫 Revoke | Cancel a subscription |
| 🗑️ Del Token | Delete only the addon token |
| 🔗 Link User ID | Attach an old token to a Telegram user so you can manage it |

Each subscriber gets a **personal addon link**:
```
https://your-domain.com/stremio/{token}/manifest.json
```
The addon name even shows their expiry date, and expired/not-joined users see a friendly "renew from the bot" entry instead of streams. A **Configure page** (`/stremio/{token}/configure`) lets them reinstall after you extend their plan.

---

# 🔧 First-Time Setup (config.env)

You only fill in a few values **once** in `config.env`. Everything else is configured later from the **web Settings page**.

```bash
cp sample_config.env config.env
nano config.env
```

| Variable | Required | What it is |
| :--- | :---: | :--- |
| `API_ID` | ✅ | Telegram API ID (from my.telegram.org) |
| `API_HASH` | ✅ | Telegram API Hash (from my.telegram.org) |
| `BOT_TOKEN` | ✅ | Your bot token (from @BotFather) |
| `OWNER_ID` | ✅ | Your numeric Telegram user ID (from @userinfobot) |
| `DATABASE` | ✅ | **Two** MongoDB URIs, separated by a comma |
| `PORT` | ✅ | Web server port (keep `8000`) |
| `USER_SESSION_STRING` | ⬜ | Optional — only for **Global Search** |

**Example:**
```env
API_ID="1234567"
API_HASH="abc123def456ghi789jkl012mno345pq"
BOT_TOKEN="1234567890:AAEabcdEFGhijkLMnOPqrsTUVwxyz12345"
USER_SESSION_STRING=""
OWNER_ID="987654321"
DATABASE="mongodb+srv://user:pass@cluster0.xxxx.mongodb.net/tracking,mongodb+srv://user:pass@cluster0.xxxx.mongodb.net/storage1"
PORT="8000"
```

### Where to get each value
- **API_ID / API_HASH** — [my.telegram.org](https://my.telegram.org) → *API development tools* → create an app.
- **BOT_TOKEN** — [@BotFather](https://t.me/BotFather) → `/newbot`. Then add this bot as **admin** in every media channel.
- **OWNER_ID** — [@userinfobot](https://t.me/userinfobot) replies with your numeric ID.
- **DATABASE** — two free MongoDB databases from [MongoDB Atlas](https://www.mongodb.com/atlas). Create a cluster, add a DB user, allow network access `0.0.0.0/0`, copy the connection string, and append a name to each (`/tracking` and `/storage1`). You can reuse one cluster with two different DB names.
- **PORT** — leave `8000` unless it's busy.

### (Optional) Generate USER_SESSION_STRING — only for Global Search
Run this in [Google Colab](https://colab.new) (safe — it's just a "stay logged in" token for *your* account; revoke anytime from Telegram → Settings → Devices):
```python
!pip install pyrogram tgcrypto
import asyncio
from pyrogram import Client
api_id = int(input("API ID: "))
api_hash = input("API HASH: ")
async def main():
    async with Client("temp_session", api_id, api_hash) as app:
        print("\nYour USER_SESSION_STRING is:\n")
        print(await app.export_session_string())
await main()
```
Copy the printed string into `config.env`. 🔒 Keep it private.

### Then finish in the web panel
Open your server → log in with default **`admin` / `admin`** → go to **Settings**. **Change the admin password first**, then fill in the rest below. Everything on this page is saved to the database and applied **instantly — no restart** (the only value that needs a restart is `USER_SESSION_STRING`, which lives in `config.env`).

---

# 🎛️ Web Settings Page (every option explained)

Open **Settings** (`/admin/settings`) after logging in. Here's what each card does and where to get the values.

### ⚙️ General
| Option | What it does |
| :--- | :--- |
| **Replace Mode** | When a new file has the same quality (`720p`, `1080p`…) as an existing one, it replaces the old entry so you never get duplicates. Recommended **ON**. |
| **Hide Catalog** | Hides the public Stremio catalog (direct stream links still work). |

### 🛡️ Admin Authentication
| Field | What to enter |
| :--- | :--- |
| **Admin Username / Password** | Your web panel login. Leave the password blank to keep the current one. **Change the defaults right away.** |
| **AUTH_CHANNELS** | The channel(s) the bot indexes and streams from. Add each by `@username` or `-100…` ID, and make sure your bot is an **admin** in each. Tick the **Anime** box on a channel to treat it as an anime channel. |

### 🎬 Media & Content
| Field | What to enter / where to get it |
| :--- | :--- |
| **TMDB API Key** | A free TMDB **v3** key from [themoviedb.org](https://www.themoviedb.org) → *Settings → API*. Powers automatic poster & metadata matching. |
| **Base URL** | Your public address, e.g. `https://your-domain.com`. **Important:** Stremio uses this to reach your streams, so it must be correct. |
| **Upstream Repo / Branch** | Used by the **Restart/Update** button to auto-update. Set repo to `https://github.com/weebzone/Telegram-Stremio` and branch to `master`. |

### 💳 Subscription (optional)
Turn this on to monetise access. Set the **Subscription Group ID**, **Payment Instructions** (your UPI / bank / PayPal text), an optional **Payment QR image URL**, and the **Approver IDs** (who can approve payments). Renewal and "join the channel" prompts in Stremio point users back to **your bot automatically** — no URL to configure. Full flow in [Subscriptions & Access](#-subscriptions--access).

### 🌐 Global Search (optional)
Requires `USER_SESSION_STRING` in `config.env` plus one app restart. Then enable the toggle and add the **channel IDs** to search live. Results not in your local catalog are tagged **🌐 GLOBAL** in Stremio. See [Global Search](#-global-search).

### 📢 Announcements (optional)
Turn on **Announce New Content** and set an **Announcement Channel** to auto-post whenever new media is indexed. See [Announcement Channel](#-announcement-channel).

### 📁 Manual Channel
Set the channel used for **hand-added / personal files** (these are *not* auto-indexed). Used by the [Manual Upload Session](#️-adding-files-manually-goa-trip-lectures-one-piece).

### 🌐 Proxy (optional)
Set an **HTTP Proxy URL** for outbound metadata/API requests, and optionally **show both** proxied and direct stream links.

### 🗄️ Extra Storage Databases
Your first two databases (from `config.env`) are **locked** as *Tracking* and *Storage 1*. Add more MongoDB URIs here to expand capacity — 🟢 means connected. Remove entries only from the **end** of the list, since existing media reference databases by position.

### 📨 Multi-Token Clients
Add extra **bot tokens** for faster parallel streaming under heavy load. Create more bots with [@BotFather](https://t.me/BotFather), add them as **admins** in all your AUTH channels, then paste their tokens here. Applies immediately.

> ✅ Click **Save Settings** when done — you're live!

---

# 🚀 Deployment

This guide helps you deploy on **Heroku**, a **VPS with Docker**, or **Hugging Face** (free).

## ✅ Prerequisites

Before you begin, make sure you have:

1. ✅ A **VPS** with a public IP (Ubuntu on DigitalOcean, AWS, Vultr, etc.) — for the VPS route
2. ✅ A **domain name** — recommended so Stremio can reach you over HTTPS

## 🐙 Heroku Guide

Follow the ready-made Google Colab tool to deploy on Heroku:

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/weebzone/Colab-Tools/blob/main/telegram%20stremio.ipynb)

## 🐳 VPS Guide (recommended)

Deploy on a VPS using **Docker Compose (recommended)** or **plain Docker**.

### 1️⃣ Step 1: Clone & Configure

```bash
git clone https://github.com/weebzone/Telegram-Stremio
cd Telegram-Stremio
cp sample_config.env config.env
nano config.env
```
Fill in all required variables, then save with `Ctrl + O`, `Enter`, `Ctrl + X`.

### 2️⃣ Step 2: Choose a Deployment Method

#### 🟢 Option 1 — Docker Compose (recommended)

Easier and more maintainable, with config mounting and restart policies.

```bash
docker compose up -d
```
Your server runs at ➡️ `http://<your-vps-ip>:8000`

**Updating `config.env` later:**
1. Edit it: `nano config.env`
2. Save: `Ctrl + O`, `Enter`, `Ctrl + X`
3. Apply: `docker compose restart`

⚡ The config file is mounted, so you **don't need to rebuild** — changes apply on restart.

#### 🔵 Option 2 — Plain Docker (manual)

```bash
docker build -t telegram-stremio .
docker run -d -p 8000:8000 telegram-stremio
```
Your server runs at ➡️ `http://<your-vps-ip>:8000`

### 3️⃣ Step 3: Add a Domain (recommended)

**A. DNS record** — at your domain registrar, add an **A record** to your VPS IP:

| Type | Name | Value |
| ---- | ---- | ----- |
| A | @ | `195.xxx.xxx.xxx` |

**B. Install Caddy** (automatic HTTPS + reverse proxy):

```bash
sudo apt install -y debian-keyring debian-archive-keyring apt-transport-https curl
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
chmod o+r /usr/share/keyrings/caddy-stable-archive-keyring.gpg
chmod o+r /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
sudo apt install caddy
```

**C. Configure Caddy:**

1. Edit the Caddyfile: `sudo nano /etc/caddy/Caddyfile`
2. Replace its contents with (change the domain, and the port if you changed it):
   ```caddy
   your-domain.com {
       reverse_proxy localhost:8000
   }
   ```
3. Reload: `sudo systemctl reload caddy`

✅ Your server is now live at ➡️ `https://your-domain.com`

## 🤗 Hugging Face Guide (free, always-online, no VPS)

Deploy a **free, always-online** instance — no VPS, no domain, no Docker knowledge. Hugging Face builds the image on its own servers; you just tap a few buttons.

> 💡 **How it works:** this repo ships a GitHub Action that pushes your code to your Hugging Face Space on every change. The Space then builds the included `Dockerfile` and runs your server.

### ⭐ Step 1: Star this Repository
Open the repo and tap **⭐ Star** at the top right → [github.com/weebzone/Telegram-Stremio](https://github.com/weebzone/Telegram-Stremio)

### 🍴 Step 2: Fork the Repository
Tap **Fork** (top right) → **Create fork**. This gives you your own copy for private secrets and the deploy workflow.

### 🔑 Step 3: Create a Hugging Face Write Token
1. Sign in (or sign up) at [huggingface.co](https://huggingface.co).
2. Go to **Profile → Settings → Access Tokens**.
3. Tap **Create new token**, choose the **Write** role, and copy it.

### 🚀 Step 4: Create a Docker Space
1. Go to [huggingface.co/new-space](https://huggingface.co/new-space).
2. Give it a name, select **Docker** as the SDK (pick the **Blank** template).
3. Set visibility to **Public** (required so Stremio/Nuvio can reach your addon).
4. Tap **Create Space**. Your Space ID is `<your-hf-username>/<your-space-name>` — note it down.

### 🔐 Step 5: Add Deploy Credentials to Your GitHub Fork
In **your forked repo** → **Settings → Secrets and variables → Actions**:

| Type | Name | Value |
| ------------ | ------------- | -------------------------------------- |
| **Secret** | `HF_TOKEN` | the Write token from Step 3 |
| **Variable** | `HF_SPACE_ID` | `<your-hf-username>/<your-space-name>` |

> Add the secret under the **Secrets** tab and the variable under the **Variables** tab.

### 🤖 Step 6: Add Your Bot Secrets to the Space
On your **Hugging Face Space → Settings → Variables and secrets**, add the same values you'd put in `config.env`:

| Secret | Required | Where to get it |
| --------------------- | -------- | -------------------------------------- |
| `API_ID` | ✅ | [my.telegram.org](https://my.telegram.org) |
| `API_HASH` | ✅ | [my.telegram.org](https://my.telegram.org) |
| `BOT_TOKEN` | ✅ | [@BotFather](https://t.me/BotFather) |
| `OWNER_ID` | ✅ | your numeric Telegram ID |
| `DATABASE` | ✅ | two comma-separated MongoDB URIs |
| `USER_SESSION_STRING` | ⬜ | optional (Global Search) |

> ℹ️ No `config.env` needed on Hugging Face — these secrets are read as environment variables. The `Dockerfile` already listens on the right port (`app_port: 8000` is preset in this README).

### ▶️ Step 7: Deploy
In **your forked repo** → **Actions** → select **Deploy to Hugging Face Space** → **Run workflow**. After this first run, **every push auto-deploys**. Watch the build on your Space page — once it shows **Running**, you're live.

### 🎬 Step 8: Use Your Addon
1. Open `https://<your-hf-username>-<your-space-name>.hf.space/login`
2. Log in (`admin` / `admin`) and **immediately change the password**.
3. In the web **Settings** page set **Base URL** to `https://<your-hf-username>-<your-space-name>.hf.space`.
4. Open your bot, send **/start** — it returns your manifest URL.
5. Add that manifest URL to Stremio/Nuvio and enjoy. 🎉

### 🧩 Step 9: Finish the Setup
1. Go to `https://<your-hf-username>-<your-space-name>.hf.space/admin/settings`.
2. Fill in the **TMDB API** key and **AUTH channels**.
3. For everything else, see [Web Settings Page](#️-web-settings-page-every-option-explained).
4. Save and enjoy.

---

# 📺 Watch in Nuvio / Stremio

Your server is a standard **Stremio-style addon**, so it works in any compatible player. For the smoothest experience across devices we recommend **[Nuvio](https://play.google.com/store/apps/details?id=com.nuvio.app)** — a free, open-source media hub for Android, Android TV, Fire TV, iOS, Windows and TV that supports addon manifest URLs. *(Content was rephrased for compliance with licensing restrictions.)*

1. Get your **manifest URL** — open your bot and send `/start`.
2. Install a player:

   | Platform | Source |
   | :--- | :--- |
   | Android / Android TV / Fire TV | [Google Play](https://play.google.com/store/apps/details?id=com.nuvio.app) |
   | All platforms / latest builds | [GitHub — tapframe/NuvioStreaming](https://github.com/tapframe/NuvioStreaming) |

3. Open the app → **Addons** → paste your **manifest URL** → install.
4. Done! 🎉 Your Telegram library appears in the catalog and streams directly.

> 💡 Prefer **Stremio**? It works too — just install the same manifest URL.

---

## 🏅 Contributors

|<img width="80" src="https://avatars.githubusercontent.com/u/113664541">|<img width="80" src="https://avatars.githubusercontent.com/u/13152917">|<img width="80" src="https://avatars.githubusercontent.com/u/14957082">|<img width="80" src="https://raw.githubusercontent.com/vflixa1prime/Readme/main/VFlixPRime.png">|
|:---:|:---:|:---:|:---:|
|[`Karan`](https://github.com/Weebzone)|[`Stremio`](https://github.com/Stremio)|[`ChatGPT`](https://github.com/OPENAI)|[`VFlix Prime`](https://t.me/vflixprime2)|
|Author|Stremio SDK|Refactor|Community Support|
