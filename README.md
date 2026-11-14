# 🚀 SPACE ECHOES

> An interactive space exploration mobile app for school students and young space enthusiasts.
> Built by **Team She Space** for the NASA Space Apps Challenge — *"Abandoned but Not Forgotten"*.

NASA machines have been left across the Moon, Mars, and deep space. Some completed their missions, some are still active, and others have lost contact. **SPACE ECHOES** lets students discover each machine's story through first-person storytelling, quizzes, badges, and an AI space buddy.

*Because even when a machine stops working, its discoveries, contributions, and story remain alive.*

---

## ✨ Features

- Splash & onboarding
- Login & Sign up
- Home with 3 destinations: The Moon, Mars, and Deep Space
- Level maps for each destination
- Equipment storytelling (mission, journey, current status)
- Explore missions list
- Quiz & results
- Mission badges
- Chatbot "FLASH", your space companion
- Profile & progress

---


**Data flow:** `View → UseCase → Repo (abstract) → RepoImpl → DataSource`

### Project structure

```
lib/
├── main.dart
├── core/
│   ├── components/      # Reusable widgets (e.g. CustomSvg)
│   ├── helper/          # MyNavigator
│   ├── network/         # ApiHelper , EndPoints
│   └── utils/           # AppColors, AppGradients, AppImages
└── features/
    ├── auth/            # Splash, Onboarding, Login
    ├── home/            # MainView (bottom nav), Home, Moon, Mars, Equipment screens
    ├── Explore/         # Missions list
    ├── badges/          # data / domain / presention
    ├── chatbot/         # data / domain / presention
    └── profile/         # Header, stats, progress
```

---


## 🎨 Design

Dark, space-themed UI with a purple base and warm peach/salmon accents.

| Token | Color |
|---|---|
| Primary | `#312C51` |
| Secondary | `#48426D` |
| Accent | `#F0C38E` |
| Salmon Pink | `#F1AA9B` |

All colors live in `lib/core/utils/app_colors.dart`.

---

## 👩‍🚀 Team

**Team She Space** — NASA Space Apps Challenge
