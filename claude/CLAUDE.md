# Cum lucrez cu Claude Code (global)

Se aplică în toate proiectele. Specificul fiecărui proiect stă în CLAUDE.md-ul proiectului.

## Despre mine
- Răspunde-mi în română. Termenii tehnici, comenzile și codul rămân în engleză.
- Am abonament Pro și ating des limita, deci fiecare token contează. Mac cu 16 GB RAM: nu porni procese grele fără motiv.
- Scurt și la obiect: întâi rezultatul, detaliile doar dacă ajută.

## Principii de inginerie
- Înainte să scrii cod, citește codul din jur și urmează-i pattern-urile, numele și stilul. Un proiect consecvent se întreține mai ușor decât unul „mai bun” pe bucăți.
- Fă cea mai mică schimbare care rezolvă ce am cerut. Refactorizările, fișierele sau feature-urile necerute doar le propui, separat.
- Fără abstracții pentru viitor: un strat sau o interfață nouă apare doar când există deja cel puțin 2 folosiri reale.
- Module mici, cu o singură responsabilitate. Dacă un fișier trece de ~300 de rânduri, spune-mi.
- Validează input-ul și tratează erorile la granițe (API, I/O, input de la utilizator). În interior te bazezi pe tipuri.
- Nu ghici. Dacă cerința e ambiguă și contează, pune o singură întrebare, precisă.

## Planificare
- Task mic (1–3 fișiere, fără decizii de arhitectură): fă-l direct.
- Task mare: întâi un plan scurt, împărțit în subtask-uri independente: ce fișiere, în ce ordine, cum verifici fiecare pas, ce riscuri sunt. Aștepți „ok”-ul meu înainte să scrii cod.
- La bug-uri: întâi reproduci, apoi găsești cauza, abia apoi repari. Nu schimba lucruri la întâmplare până „merge”.

## Agenți în paralel
- Pornești un subagent doar când (a) sunt cel puțin 2 subtask-uri mari și independente sau (b) ai de făcut o căutare largă prin cod din care îți trebuie doar concluzia. Altfel lucrezi singur: fiecare agent pornește de la zero și își citește din nou contextul, deci costă tokeni în plus.
- Căutare, rulat teste, rezumat de log-uri: model ieftin (haiku). Design și cod dificil: modelul principal.
- Agenții care modifică cod în paralel lucrează fiecare în worktree-ul lui, ca să nu se calce pe fișiere.
- Dă-i fiecărui agent un brief complet (ce, unde, când e gata) și cere-i înapoi doar concluzia, nu fișiere întregi.

## Teste și economie de tokeni
- Rulează întâi doar testele afectate (un fișier sau un pattern). Suita completă o singură dată, la final.
- Output-ul lung (teste, build, install, log-uri) îl filtrezi: `| tail -40`, `| grep -E "FAIL|Error"`. Nu aduci mii de rânduri în context.
- Citești doar ce îți trebuie: întâi cauți (grep), apoi citești bucata relevantă. Nu reciti un fișier pe care îl ai deja în context.
- Nu repeta în răspuns cod sau output pe care l-am văzut deja; arată doar diferența.
- Când un task e gata și următorul nu are legătură cu el, spune-mi că e momentul pentru `/clear`: un context nou face mesajele mai ieftine.

## Git
- Nu adăuga niciodată `Co-Authored-By` sau „Generated with Claude Code” în commit-uri sau PR-uri.
- Commit-uri mici, cu un singur scop, cu mesaje clare (ex. `fix: validate email on signup`). Faci commit doar când îți cer.
- Nu faci push, force-push, rebase pe branch-uri comune, ștergeri sau alte acțiuni ireversibile fără să mă întrebi.
