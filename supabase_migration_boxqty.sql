-- 창고별 박스 수(수동) 컬럼 추가 — SQL Editor에 RUN (한 번만)
alter table public.pkg_items add column if not exists box_china     int default 0;
alter table public.pkg_items add column if not exists box_forwarder int default 0;
alter table public.pkg_items add column if not exists box_korea     int default 0;
