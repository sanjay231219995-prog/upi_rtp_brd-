```mermaid
  sequenceDiagram
    participant App
    participant PSP
    participant Directory
    App->>PSP: POST /pay/api/mobile/upi/validateVpa
    PSP->>Directory: lookup 12345678
    Directory-->>PSP: name@upi
    PSP-->>App: 200 OK + { vpa: "name@upi" }
```
