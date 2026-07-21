-- 상태 뱃지(status) 컬럼 추가 — 이미 테이블이 있으면 SQL Editor 에 RUN (한 번만, 데이터 유지)
-- '' = 자동(재고/발주 상태 자동 표시), '시안' = 발주 전 시안만, '단종' = 더이상 제작 안 함
alter table public.pkg_items add column if not exists status text default '';
