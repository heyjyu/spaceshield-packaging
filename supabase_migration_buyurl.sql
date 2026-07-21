-- 구매링크(buy_url) 컬럼 추가 — 이미 테이블이 있는 경우 SQL Editor 에 RUN (한 번만, 데이터 유지)
alter table public.pkg_items add column if not exists buy_url text default '';
