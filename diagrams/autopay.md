```mermaid
    sequenceDiagram
       participant App
       participant PSP
       participant NPCI
       App->>PSP: POST /mandate/register
       PSP->>NPCI: store e-Mandate
       NPCI-->>PSP: 201 Created + mandateId
       Note over PSP,NPCI: Scheduler triggers
       PSP->>NPCI: POST /mandate/debit
       NPCI-->>PSP: pacs.008 Debit Ack
```
