# aBag-retail
WoW Retail bag and bank addon, featuring simplicity and a sleek design.

## Intro
Extra simple bag addon for simple people like me!
All config is done in the config.lua file.
Please note that this addon has been rehauled for Retail from its Classic version, and now it's literally reusing blizzard's frames to be as lightweight as possible. This also means it's even more simple than before.
If you want to have the same font as in the screenshots, install the fonts from [ZorkUI](https://www.wowinterface.com/downloads/info24252-ZorkUI.html).

## Features
  * One big simple bag!
  * One big bank!
  * Disableable bank bag slots
  * Reagent bank! (disableable as well)
  * Money text!
  * Nothing else!

## Anti-features
  * No bag manager - relies on blizzard's.
  * No sorting.
  * No searching.
  * No item level.
  * No bag separation of any type.
  * No alternate currencies.
  * Bag and bank/reagent frames can't be dragged - position is set in config.lua.
  * No void storage. I never used it, and never will.

## Known bugs
  * Opening/closing individual bags will show/hide its related slots. Just use the "Open all bags" keybind instead. Same thing applies for the bank.
  * Any update to the equipped bags / bank bags, purchasing a bank slot, or unlocking the reagent bank won't update the addon. It's just... not implemented, so you'll need to /reload.
  * Any bank bags equipped after the first empty bag slot won't show properly. Just make sure all empty bag slots are on the right side.
  * Pressing the "toggle all bags" keybind while having the bank open will close the bank but not the bag. Bag will close after pressing that keybind a second time. Pressing Escape properly closes both at the same time.
  * Interacting with the Soulbind table while on "tutorial" mode (when you get the quest to learn the first conduits), makes the slots of any non-backpack bag containing conduits displace to their original position. Just learn the conduits, and the bag will work again.
  * If using Aurora, empty slots show the default background the first time the bag opens.

## Changelog
  * 2.3: Added Aurora and TrincaUI support.
  * 2.2: Added bank and reagent bank support.
  * 2.1: Replaced blizzard's border on empty slots with a sleek backdrop.
  * 2.0: Completely revamped the addon for retail.
