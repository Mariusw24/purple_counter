# 🟣 purple_counter

A simple Move module deployed on the **Sui Testnet** that implements a `Counter` object.  
Made for a homework submission to the sui bootcamp 2025 in Bucharest

---

## Submission Info

| **GitHub Repo** | [https://github.com/Mariusw24/purple_counter] |  
| **Package ID** | `0xc31b3d00da1900949d84224c74848e107722baf5e334e1d545459641aa1d1802` |  
| **Transaction Hash**| `5X4mWFzBDUmgBAEVB2FpkKLPFQ6WFNGWgR9YtJaF7voa` |  

---

## Overview

The module defines a `Counter` object that stores:
- Owner address
- Current count value (starting at 0)
- Creation timestamp

Functions:
- `create_counter()` → Creates a new Counter
- `increment()` → Increases counter value by 1
- `get_value()` → Returns current counter value

Includes:
- Ownership validation
- Events for creation and increment

---

## Build & Deploy Instructions

1. Clone the repo:
   ```bash
   git clone https://github.com/Mariusw24/purple_counter.git
   cd purple_counter
   ```

2. Build the package:
   ```bash
   sui move build
   ```

3. Deploy to **Sui Testnet**:
   ```bash
   sui client publish --gas-budget 30000000
   ```

4. Don't forget to get your package id!

---

## Notes

- `Counter` has `key` ability to persist on Sui.
- Ownership checks ensure only the creator can increment.
- Emits structured events for better tracking.
