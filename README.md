# chromix

**Flutter version:** 3.35.2

---

## Українська версія

### Реалізовано все, що було потрібно згідно з технічним завданням:

1. Вивід тексту на екран.
2. Зміна фону при натисканні на екран.
3. Додатково (як бонус) реалізовано власну логіку:
    - Створено метод, який спрацьовує при **довгому натисканні** на екран.
    - Його суть полягає у використанні **ряду Фібоначчі** (обмежено до 8 розрядів).
    - Залежно від розряду, користувачу відображаються **випадкові кольори**.
    - Потім із набору кольорів, що відповідають певному числу Фібоначчі, обирається **фінальний
      “виграшний” колір**.
    - Після досягнення 8-го розряду все **обнуляється**, і процес можна розпочати знову.

---

**P.S.** [solid_lints](https://pub.dev/packages/solid_lints) — це був справді непоганий жарт

---

## English version

### Everything required by the technical task has been implemented:

1. Displaying text on the screen.
2. Changing the background color when the screen is tapped.
3. Additionally (as a bonus), custom logic was added:
    - Implemented a method triggered by a **long press** on the screen.
    - The logic is based on the **Fibonacci sequence** (limited to 8 levels).
    - Depending on the level, the user sees **randomly generated colors**.
    - From the list of colors corresponding to the current Fibonacci number, the **final “winning”
      color** is selected.
    - After reaching the 8th level, the process **resets**, and the user can start again.

---

**P.S.** [solid_lints](https://pub.dev/packages/solid_lints) — that was actually a pretty good joke 
