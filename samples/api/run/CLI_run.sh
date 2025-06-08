$ newman run PhonePe_UPI.postman_collection.json \
    -e PhonePe_env.json \
    --reporters cli

→ PhonePe UPI Collection
  Iteration 1
    ✓ TC-01 • 200 OK
    ✓ TC-01 • business SUCCESS
    ✓ TC-03 • 409 DUP
    ✓ TC-03 • code TXN_DUPLICATE
    ✓ TC-05 • 400 LIMIT
    ✓ TC-05 • code LIMIT_EXCEEDED
    ✓ TC-14 • 401 AUTH
    ✓ TC-14 • code INVALID_SIGNATURE

┌─────────────────────────┬────────┬────────┬────────┐
│                         │ executed │ failed │ skipped │
├─────────────────────────┼────────┼────────┼────────┤
│      iterations         │      1   │      0 │      0 │
├─────────────────────────┼────────┼────────┼────────┤
│      requests           │      4   │      0 │      0 │
├─────────────────────────┼────────┼────────┼────────┤
│      test-scripts       │      8   │      0 │      0 │
└─────────────────────────┴────────┴────────┴────────┘

→ Collection run completed. 8 passed, 0 failed.
