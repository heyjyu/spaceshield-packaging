-- ===================================================================
--  통합 마이그레이션 — 신규 컬럼 전부 + 실시간 동기화
--  이미 테이블이 있는데 앱에서 저장이 막히거나 실시간 반영이 안 되면
--  이 파일 하나만 Supabase SQL Editor 에 붙여넣고 RUN 하면 됩니다.
--  여러 번 실행해도 안전(idempotent). 데이터 그대로 유지.
-- ===================================================================

-- 신규 컬럼 (없을 때만 추가)
alter table public.pkg_items add column if not exists nas_path text default '';   -- NAS 서버 경로
alter table public.pkg_items add column if not exists flow_url text default '';   -- FLOW 기획서 URL
alter table public.pkg_items add column if not exists buy_url  text default '';   -- 구매링크 URL
alter table public.pkg_items add column if not exists status   text default '';   -- 상태 뱃지 (''=자동/시안/단종)

-- 실시간 동기화 (다른 사용자의 변경 자동 반영)
do $$
begin
  if not exists (select 1 from pg_publication_tables where pubname='supabase_realtime' and schemaname='public' and tablename='pkg_items') then
    alter publication supabase_realtime add table public.pkg_items;
  end if;
  if not exists (select 1 from pg_publication_tables where pubname='supabase_realtime' and schemaname='public' and tablename='pkg_orders') then
    alter publication supabase_realtime add table public.pkg_orders;
  end if;
end $$;
