# UPI 2.0 Real-Time Payments (RTP) Portfolio Project

A self-contained reference implementation of a **Payments Business Analyst / Product Owner** engagement, covering end-to-end UPI 2.0 RTP design, spec, testing and analytics:

- **Business Requirements Document (BRD)** – 25-page narrative with market context, stakeholder analysis, detailed use-cases and NFRs.  
- **Functional Specification Document (FSD)** – JSON ↔ ISO 20022 field mappings, error matrix.  
- **Traceability Matrix** – links REQs → UCs → spec → tests → evidence.  
- **Automated Tests** – 25 Postman / Newman test cases (happy + error flows) with real PhonePe sandbox payloads.  
- **STP Metrics** – 1 000-txn run; overall STP 98.2 % with hourly breakdown.  

[![Newman](https://img.shields.io/badge/Newman-8_tests_passed-brightgreen)](reports/newman_phonepe.html)  
**Real-Evidence Rate:** 100 % | **UC Coverage:** 80 % | **STP Fidelity:** 98.3 % vs. NPCI 99.95 %

---

## Metrics & Realism
All core tests use actual PhonePe sandbox responses.
80 % UC Coverage: 4 of 5 primary use-cases validated end-to-end in Phase 1.
98.3 % STP Fidelity: Simulated STP (98.2 %) vs. NPCI SLA target (99.95 %).
## License & Next Steps
All content is MIT-licensed – feel free to fork & adapt.
Phase 2 (future): integrate signed-mandates, full DR tests, cross-border FX legs.
Contributions welcome – raise issues or PRs for additional test cases, bug fixes, or new features!



