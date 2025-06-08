
```mermaid
sequenceDiagram
    participant POS
    participant MerchantPSP
    participant NPCI
    participant PayerPSP
    participant App
    POS->>MerchantPSP: POST /pay/api/mobile/upi/collect
    MerchantPSP->>NPCI: pacs.008 Pull
    NPCI->>PayerPSP: Collect request
    PayerPSP->>App: prompt user
    App-->>PayerPSP: approval
    PayerPSP-->>NPCI: pacs.008 approval
    NPCI-->>MerchantPSP: pacs.002 Ack
    MerchantPSP-->>POS: 201 Created

```
