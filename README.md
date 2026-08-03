# Klear

**New in 0.3.0: customize opacity and exclude specific apps**

Klear now lets you choose an opacity from 40% to 100% and exclude installed
apps from transparency. Open Klear's settings, select the apps that should
remain fully opaque, and use the Custom field for any window classes that are
not listed.

## Description

Very primitive KWin script for KDE Plasma, which makes regular desktop
windows transparent on opening. 

Requirements:

- KDE Plasma 6.2 or above (likely anything from 6.0)

How to install from the KDE store:

1. Open System Settings → Window Management → KWin Scripts.
2. Click **Get New...**
3. Search for Klear.
4. Install it from the GUI.
5. Enable the script using the checkbox next to it.
6. Click **Apply**.
7. Open Klear's settings. Choose your preferred opacity and select any apps
   that should remain fully opaque. Window classes that are not listed can be
   entered in the **Custom** field, separated by commas.
8. Restart KWin after changing Klear's settings.

How to install from a checkout:

```sh
./install.sh
```

The installer builds the application checklist from the current user's
desktop entries. Klear then watches the standard application directories and
refreshes the checklist when applications are installed or removed.

How to use it:

Once Klear is enabled, every normal desktop window opens at your chosen
opacity unless its app or window class is excluded.
