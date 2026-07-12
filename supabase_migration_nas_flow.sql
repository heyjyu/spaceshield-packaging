-- pkg_items 에 NAS 경로 / FLOW 기획서 URL 컬럼 추가
-- Supabase SQL Editor 에 붙여넣고 RUN (기존 데이터 유지, 한 번만)
alter table public.pkg_items add column if not exists nas_path text default '';
alter table public.pkg_items add column if not exists flow_url text default '';
