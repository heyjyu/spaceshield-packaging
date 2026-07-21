# CLAUDE.md — spaceshield-packaging

㈜쵸미앤세븐 SPACE SHIELD **포장재 발주·재고** 관리 웹앱(v1.3). 재고가 3창고(중국/포워딩/국내)로 나뉨.
정적 HTML 1파일(`index.html`), 바닐라 JS, 빌드 없음. `main` push → GitHub Pages 자동 배포.
백엔드 = Supabase(`tnuzqrqxptxrfozzjjek`), 테이블 `pkg_items`·`pkg_orders`, Storage `pkg-images`.

## 이 repo 규칙 (어기면 인수인계가 깨짐)
- **컬럼 추가 시 3곳을 같이 고치기:** ① SQL 파일(`supabase_*.sql`, 같은 커밋에) ② `index.html`의 `rowToItem`/`itemToRow`(품목) 또는 `rowToOrder`/`orderToRow`(주문) **양방향 매핑**. 매핑을 빠뜨리면 값이 조용히 사라짐.
- **DB 변경은 대시보드 클릭 말고 SQL 파일로** 만들고 커밋. (지금 라이브 DB == `supabase_schema.sql` 일치 상태 — 유지할 것)
- **이미지는 Storage(`pkg-images`)로만.** 로컬 리사이즈 후 업로드하는 기존 방식 유지.
- **CDN 고정 유지:** `@supabase/supabase-js@2.110.5`. `@2`로 되돌리지 말 것.
- **재고 변경은 `moveOrder` 단계이동 규칙**을 따라가기(단계 이동 = 재고 이동). 알려진 구멍: `arrived` 주문 삭제 시 재고 desync, 역방향 이동 시 `orderDate`/`eta` 잔존.
- **화면에 뿌리는 DB 텍스트는 escape**(현재 `innerHTML` 직접 사용 → 저장형 XSS 위험). 읽기는 공개.

## 검증
`file://` 금지(CORS). `python3 -m http.server 8000` 로 열어 콘솔 에러 확인. 로컬도 운영 DB에 붙음 — 쓰기 테스트 주의.

## 상세·전체 맥락
private repo `heyjyu/spaceshied-handoff` → `apps/packaging.md`, `README.md`, `DEV_IN_CLAUDE.md`. 접근은 오너에게 요청.
