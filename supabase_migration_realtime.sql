-- 실시간 동기화 활성화 — 다른 사용자의 변경(재고·발주·단계이동)을 자동 반영
-- 이미 테이블을 만든 경우 이 파일을 SQL Editor 에 붙여넣고 RUN (한 번만, 데이터 유지)
do $$
begin
  if not exists (select 1 from pg_publication_tables where pubname='supabase_realtime' and schemaname='public' and tablename='pkg_items') then
    alter publication supabase_realtime add table public.pkg_items;
  end if;
  if not exists (select 1 from pg_publication_tables where pubname='supabase_realtime' and schemaname='public' and tablename='pkg_orders') then
    alter publication supabase_realtime add table public.pkg_orders;
  end if;
end $$;
