# Supabase 연결 — 한 번만 하면 끝

이 앱은 **Supabase 공유 데이터**로 동작합니다. 모두에게 같은 화면이 보이고,
열람은 로그인 없이, **편집·발주·단계 이동은 로그인한 사람만** 가능합니다.
클라이언트에는 **publishable(anon) 키만** 들어 있습니다 — 공개돼도 안전하며(RLS로 쓰기 차단),
secret / service_role 키는 코드 어디에도 없습니다.

> 이미 카탈로그(spaceshied-catalog)에서 쓰던 **같은 Supabase 프로젝트**를 재사용합니다.
> 테이블만 새로 추가하면 됩니다(`pkg_items`, `pkg_orders`).

---

## 1. 테이블 만들기 (2분)
1. Supabase 대시보드 → 좌측 **SQL Editor** → **New query**.
2. 이 폴더의 **`supabase_schema.sql`** 내용을 통째로 붙여넣고 **RUN**.
   → `pkg_items` / `pkg_orders` 표 + 보안규칙(RLS) + 이미지 버킷(`pkg-images`) + 예시 데이터가 한 번에 생성됩니다.
3. 새로고침하면 라이브 페이지에 예시 5개 품목이 뜹니다.

## 2. 로그인 계정 만들기 (편집자용)
1. 좌측 **Authentication ▸ Users ▸ Add user** → 이메일/비밀번호 입력.
   - 대표(김정환)와 물류팀이 쓸 계정을 각각 추가하면 됩니다.
2. 끝. 사이트 우측 상단 **로그인** → 그 계정으로 로그인하면
   품목 추가/수정, 발주 요청, 칸반 단계 이동, 사진·지시서 업로드가 됩니다.

---

## 키가 어디 있나요?
`index.html` 상단 스크립트의 `SB_URL` / `SB_KEY`.
`SB_KEY`는 **publishable(anon)** 키입니다 — 공개용으로 설계돼 코드에 노출돼도 안전합니다.
쓰기는 로그인(JWT)한 사용자만 RLS로 허용됩니다.

## 이미 테이블을 만든 뒤 컬럼이 추가됐다면? (마이그레이션)
`nas_path` / `flow_url`(NAS 경로·FLOW 기획서 URL) 같은 컬럼이 나중에 추가됩니다.
기존 테이블에는 **`supabase_migration_nas_flow.sql`** 을 SQL Editor 에 붙여넣고 RUN 하면 됩니다(데이터 유지).
> 이 마이그레이션을 안 돌리면 품목 저장 시 "column not found" 오류가 납니다.

## 예시 데이터를 빼고 시작하려면?
`supabase_schema.sql`에서 `-- 5) 예시 데이터` 아래 `insert` 블록만 지우고 RUN 하세요.

## 백업
우측 상단 **백업(JSON)** 버튼으로 현재 전체 데이터를 JSON으로 내려받을 수 있습니다.
(읽기 전용 스냅샷 — 복원은 Supabase에서 관리)
