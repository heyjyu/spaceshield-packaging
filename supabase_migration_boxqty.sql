-- 박스당 입수량(box_qty) 컬럼 추가 — 이미 테이블이 있으면 SQL Editor 에 RUN (한 번만)
alter table public.pkg_items add column if not exists box_qty int default 0;
